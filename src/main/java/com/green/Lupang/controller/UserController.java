package com.green.Lupang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {
	@GetMapping("/user/loginForm")
	public String loginForm() {
		return "/user/loginForm";
	}
}
