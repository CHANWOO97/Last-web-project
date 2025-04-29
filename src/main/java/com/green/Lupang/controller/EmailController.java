package com.green.Lupang.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.green.Lupang.dto.User;
import com.green.Lupang.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class EmailController {
	@Autowired
	private UserService us;
	@Autowired
	private BCryptPasswordEncoder bpe;
	
	@GetMapping("/email/mailToIdForm")
	public void mailToIdForm() {}
	
	@PostMapping("/email/mailToId")
	public void mailToId(User user, HttpSession session, Model model) {
		int result = 1;		
		String userid = us.selectId(user);
		if (userid == null || userid.equals("")) result = 0;
		model.addAttribute("id", userid);
		model.addAttribute("result", result);
	}
}
