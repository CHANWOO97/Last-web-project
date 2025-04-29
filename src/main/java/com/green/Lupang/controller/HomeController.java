package com.green.Lupang.controller;

import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.Lupang.dto.Items;
import com.green.Lupang.dto.ItemsCategory;
import com.green.Lupang.dto.Sale;
import com.green.Lupang.dto.Seller;
import com.green.Lupang.dto.User;
import com.green.Lupang.service.ItemsService;
import com.green.Lupang.service.SaleService;
import com.green.Lupang.service.SellerService;
import com.green.Lupang.service.UserService;
import com.green.Lupang.service.WishListService;

import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {
	@Autowired
	private ItemsService is;
	@Autowired
	private SaleService ss;
	@Autowired
	private UserService us;

	@GetMapping({ "/", "/layout/home" })
	public String main(Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		// id 존재 시 User 객체 조회 및 seller_role 설정
		User user = us.select(id); // 유저 1명 조회
		if (id != null) {
			model.addAttribute("seller_role", user.getSeller_role());
		}
		List<ItemsCategory> ic_list = is.ic_list();
		List<Items> topItems = is.findTopWishItems(8); // 인기상품 Top 4
		model.addAttribute("id", id);
		model.addAttribute("ic_list", ic_list);
		model.addAttribute("topItems", topItems);

		return "layout/home";
	}
	
	@GetMapping("/itemsOrder/orderCancleList")
	public String orderList(HttpSession session, Model model, @RequestParam(value = "page", defaultValue = "1") int page) {
		String id = (String)session.getAttribute("id");
		System.out.println("page"+page);
		int pageSize = 12; // 한 페이지당 보여줄 상품 수
		int offset = (page - 1) * pageSize;
		
		List<Sale> orderList = ss.findCancleByUserId(id, offset, pageSize); // 페이징된 상품 목록
		int totalCount = ss.saleCountByCancleOrder(id); // 전체 주문 수량
		int totalPage = (int) Math.ceil((double)totalCount / pageSize);
		int blockSize = 10; // 보여줄 블록 패이지 수 1, 2, 3, 4
		int startPage = ((page - 1) / blockSize) * blockSize + 1;
		int endPage = Math.min(startPage + blockSize - 1, totalPage);
		System.out.println("blockSize"+ blockSize);
		
		model.addAttribute("startPage", startPage);
		System.out.println("startPage"+ startPage);
		model.addAttribute("endPage", endPage);
		System.out.println("endPage"+ endPage);
		model.addAttribute("currentPage", page);
		System.out.println("currentPage"+ page);
		model.addAttribute("totalPage", totalPage);
		System.out.println("totalPage"+ totalPage);
		model.addAttribute("orderList", orderList);
		return "itemsOrder/orderList";
	}
}
