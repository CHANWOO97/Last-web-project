package com.green.Lupang.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.Lupang.dto.User;
import com.green.Lupang.service.SellerService;
import com.green.Lupang.service.UserService;

import ch.qos.logback.core.model.Model;
import jakarta.servlet.http.HttpSession;

@Controller
public class SellerController {
	@Autowired SellerService ss;
	@Autowired UserService us;
	@GetMapping("/seller/sellerForm")
	public void SellerForm(HttpSession session, String u_id, Model model ) {
		String id = (String)session.getAttribute("id");
	}
}
