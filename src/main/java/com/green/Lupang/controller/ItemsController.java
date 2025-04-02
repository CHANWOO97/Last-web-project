package com.green.Lupang.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.Lupang.dto.Items;
import com.green.Lupang.dto.ItemsCategory;
import com.green.Lupang.service.ItemsService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ItemsController {
	@Autowired
	private ItemsService is;
	@GetMapping("/items/itemsByCategory")
	public String itemsByCategory(Model model, 
			@RequestParam(value = "ic_id" , defaultValue = "") String ic_id, 
			@RequestParam(value = "page", defaultValue = "1") int page) 
	{
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
		return "items/itemsByCategory";
	}	
	@GetMapping("items/itemsDetail")
		public void itemsDetail(@RequestParam("i_id") String i_id, Model model) {
		Items items = is.select(i_id);
		model.addAttribute("items", items);
		
	}
}
