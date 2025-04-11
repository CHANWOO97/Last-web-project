package com.green.Lupang.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.Lupang.dto.Items;
import com.green.Lupang.dto.User;
import com.green.Lupang.mapper.ItemsMapper;
import com.green.Lupang.service.BoardService;
import com.green.Lupang.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class BoardController {
	@Autowired
	private BoardService bs;
	@Autowired
	private UserService us;
	@Autowired
	private ItemsMapper im;

	@GetMapping("/board/boardForm")
	public String boardForm(HttpSession session, Model model) {
		String id = (String)session.getAttribute("id");
	    // id 존재 시 User 객체 조회 및 seller_role 설정
		if (id != null) {
	        User user = us.select(id); // 유저 1명 조회
	        model.addAttribute("seller_role", user.getSeller_role());
		}
	        return "/board/boardForm";
	}

	@GetMapping("/board/saleQuestionForm")
	public void saleQuestionForm() {

	}

	@GetMapping("/board/qAndAForm")
	public void qAndAForm() {
	}
}
