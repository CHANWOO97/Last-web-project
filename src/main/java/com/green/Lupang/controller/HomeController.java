package com.green.Lupang.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.green.Lupang.dto.ItemsCategory;
import com.green.Lupang.service.ItemsService;

@Controller
public class HomeController {
	@Autowired
	private ItemsService is;
	
	@GetMapping({"/", "/layout/home"})
	public String main(Model model) {
		List<ItemsCategory> ic_list = is.ic_list();
		model.addAttribute("ic_list", ic_list);
		return "layout/home";
	}
}
