package com.green.Lupang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	@GetMapping({"/", "/layout/home"})
	public String main() {
		return "layout/home";
	}
}
