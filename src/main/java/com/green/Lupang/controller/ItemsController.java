package com.green.Lupang.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.Lupang.dto.CartItem;
import com.green.Lupang.dto.CartItemDTO;
import com.green.Lupang.dto.Items;
import com.green.Lupang.dto.ItemsCategory;
import com.green.Lupang.service.CartService;
import com.green.Lupang.service.ItemsService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ItemsController {
	@Autowired
	private ItemsService is;
	@Autowired
	private CartService cs;
	
	@PostMapping("/cart/updateQuantity")
	@ResponseBody
	public String updateQuantity(@RequestParam("i_id") String i_id, @RequestParam("quantity") int quantity, HttpSession session) {
	    String id = (String) session.getAttribute("id");
	    if (id == null) return "fail";
	    cs.updateQuantity(id, i_id, quantity);
	    return "success";
	}
	@PostMapping("/cart/deleteItem") // 장바구니에 있는 각 상품을 삭제
	@ResponseBody
	public String deleteItem(@RequestParam("i_id") String i_id, HttpSession session) {
		String id = (String) session.getAttribute("id");
		if (id == null) return "fail";
		cs.deleteItem(id, i_id);
		return "success";
	}
	
	@GetMapping("/items/itemsCart")	
	public String itemsCart(Model model, HttpSession session) {		
		String id = (String)session.getAttribute("id");
		// 장바구니 상품 관계 데이터 리스트 
		List<CartItemDTO> cartItems = cs.getCartItemsByUserId(id);
		model.addAttribute("cartItems", cartItems);
		return "items/itemsCart";
	}
	
	@GetMapping("/items/itemsByCategory")
	public String itemsByCategory(Model model, HttpSession session,
			@RequestParam(value = "ic_id" , defaultValue = "") String ic_id, 
			@RequestParam(value = "page", defaultValue = "1") int page) 
	{
		String id = (String)session.getAttribute("id");
		int pageSize = 12; // 한 페이지당 보여줄 상품 수
		int offset = (page - 1) * pageSize;
		
		// 카테고리 리스트 데이터... 
		List<ItemsCategory> ic_list = is.ic_list();
		// 카테고리 분류명
		String ic_name = is.ic_name(ic_id);
		
		List<Items> itemList = is.itemList(ic_id, offset, pageSize); // 페이징된 상품 목록
		int totalCount = is.itemCountByCategory(ic_id); // 전체 상품 수		
		int totalPage = (int) Math.ceil((double)totalCount / pageSize);
		int blockSize = 10; // 한 번에 보여줄 페이지 수
		int startPage = ((page - 1) / blockSize) * blockSize + 1;
		int endPage = Math.min(startPage + blockSize - 1, totalPage);
		
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("ic_list", ic_list);
		model.addAttribute("itemList", itemList);
		model.addAttribute("ic_id", ic_id);
		model.addAttribute("ic_name", ic_name);
		model.addAttribute("id", id);
		return "items/itemsByCategory";
	}	
	@PostMapping("items/innerCart")
	@ResponseBody
	public String innerCart(   @RequestParam("i_id") String itemCode,   @RequestParam("quantity") int quantity,
	    HttpSession session ) {
		String msg = "";
	    String u_id = (String) session.getAttribute("id");	
	    if (u_id == null) {
	        return "로그인이 필요합니다.";
	    }
	    // 현재 로그인한 사용자의 장바구니가 있으면 가져오고, 없으면 새로 생성하자
	    String c_id = cs.getOrCreateCartId(u_id); // cartId = c_id (장바구니 코드)
	    cs.addItemToCart(c_id, itemCode, quantity); // itemCode = i_id (상품코드)    
	    return "장바구니에 담겼습니다.!";
	}
	@GetMapping("items/itemsDetail")
	public void itemsDetail(@RequestParam("i_id") String i_id, HttpSession session, Model model) {
		String id = (String)session.getAttribute("id");
		Items items = is.select(i_id);
		// 카테고리 리스트 데이터... 
		List<ItemsCategory> ic_list = is.ic_list();
		model.addAttribute("items", items);		
		model.addAttribute("ic_list", ic_list);
		model.addAttribute("id", id);		
}
}
