package com.green.Lupang.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.green.Lupang.service.BoardService;


@Controller
public class BoardController {
	@Autowired
	private BoardService bs;
	 @GetMapping("/board/boardForm")
	 public void boardForm() {    }
}
