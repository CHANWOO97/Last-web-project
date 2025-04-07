package com.green.Lupang.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.Lupang.dto.Items;
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
	public void boardForm() {
		
	}
	@GetMapping("/board/saleQuestionForm")
	public void saleQuestionForm(HttpSession session, @RequestParam("i_id") String i_id, Model model) {
		if(i_id != null) { // 로그인 되어있으면
			Items items = im.select(i_id);
			model.addAttribute("items", items);
		}
	}
}
