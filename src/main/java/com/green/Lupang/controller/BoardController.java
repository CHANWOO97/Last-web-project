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
import com.green.Lupang.dto.Seller;
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
	public String boardForm(Model model, @RequestParam(value = "page", defaultValue = "1") int page) {
		// 페이징
		// 사용자 목록 가져오기
		int rowPerPage = 4;
		int startRow = (page - 1) * rowPerPage;
		// 게시판 메인화면에 보여줄 문의내역 가져오기
		List<SaleQuestion> Q_List = bs.getQuestionList(startRow, rowPerPage);
		// 총 문의 수
		int totalQuestion = bs.countAllQuestion();
		// 페이징 계산
		int totalPage = (int) Math.ceil((double) totalQuestion / rowPerPage);
		int pagePerBlock = 10;
		int startPage = page - (page - 1) % pagePerBlock;
		int endPage = Math.min(startPage + pagePerBlock - 1, totalPage);

		model.addAttribute("currentPage", page);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("Q_List", Q_List);
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
	// board/boardForm 게시판 메인페이지에서 최근 문의글 조회
	@GetMapping("/board/questionDetail")
	public void questionDetail(@RequestParam("q_id") int q_id, Model model) {
		List<SaleQuestion> question = bs.getQuestion(q_id);
		model.addAttribute("question", question);
	}
	@GetMapping("/board/myQuestion")
	public void myQuestion(HttpSession session, Model model, @RequestParam(value = "page", defaultValue = "1") int page) {
		String u_id = (String)session.getAttribute("id");
		
		// 페이징
		// 문의 목록 가져오기
		int rowPerPage = 10;
		int startRow = (page - 1) * rowPerPage;
		// /board/myQuestion => 내 문의 내역 가져오기
		List<SaleQuestion> myquestionList = bs.getMyQuestionByU_id(u_id, startRow, rowPerPage);
		// 내가 한 총 문의
		int myQCount = bs.myQuestionCount(u_id);
		// 페이징 계산
		int totalPage = (int) Math.ceil((double) myQCount / rowPerPage);
		int pagePerBlock = 10;
		int startPage = page - (page - 1) % pagePerBlock;
		int endPage = Math.min(startPage + pagePerBlock - 1, totalPage);

		model.addAttribute("currentPage", page);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("myquestionList", myquestionList);
	}
}
