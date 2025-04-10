package com.green.Lupang.controller;

import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.green.Lupang.dto.Items;
import com.green.Lupang.dto.ItemsCategory;
import com.green.Lupang.service.ItemsService;
import com.green.Lupang.service.WishListService;

import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {
	@Autowired
	private ItemsService is;
	@Autowired
	private WishListService wls;
	
	@GetMapping({"/", "/layout/home"})
	public String main(Model model, HttpSession session) {
		String id = (String)session.getAttribute("id");
		List<ItemsCategory> ic_list = is.ic_list();
		List<Items> topItems = is.findTopWishItems(4); // 인기상품 Top 4
		model.addAttribute("id", id);
		model.addAttribute("ic_list", ic_list);
	    model.addAttribute("topItems", topItems);	
		return "layout/home";
	}	
}
