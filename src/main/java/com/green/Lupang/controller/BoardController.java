package com.green.Lupang.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.Lupang.dto.Items;
import com.green.Lupang.dto.User;
import com.green.Lupang.dto.SaleQuestion;
import com.green.Lupang.mapper.ItemsMapper;
import com.green.Lupang.service.BoardService;
import com.green.Lupang.service.SaleService;
import com.green.Lupang.service.SellerService;
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
	@Autowired
	private SaleService ss;
	@Autowired 
	private SellerService ses;

	@GetMapping("/board/boardForm")
	public String boardForm() {
	        return "/board/boardForm";
	}

	@GetMapping("/board/saleQuestionForm")
	public String saleQuestionForm(HttpSession session, Model model) {
		String u_id = (String) session.getAttribute("id");
		User user = us.select(u_id);
		// 구매한 상품 목록 (아이디 기준 조회)
		List<Items> buyItems = ss.getbuyItems(u_id);
		model.addAttribute("buyItems", buyItems);
		model.addAttribute("user",user);
		return "/board/saleQuestionForm";
	}
	@PostMapping("/board/saleQues")
	public void saleQues(SaleQuestion salequestion , HttpSession session, Model model) {
		// 구매문의 SaleQues DTO
		String u_id = (String) session.getAttribute("id");
		salequestion.setU_id(u_id); // 세션에서 가져온 사용자 ID 저장 -> not null이어야 하기때문에
		if (salequestion.getI_id() == null || salequestion.getI_id().isEmpty()) {
			salequestion.setI_id(null); // 상품코드가 없는 경우 null로 처리(특정 상품을 지정하지 않고 일반적인 문의만 할 수있도록)
		}
	    int result = bs.insertSaleQuestion(salequestion); // DB에 저장
	    model.addAttribute("result", result); // 성공 여부 전달
	}
	
	@GetMapping("/board/qAndAForm")
	public void qAndAForm() {
	}
}
