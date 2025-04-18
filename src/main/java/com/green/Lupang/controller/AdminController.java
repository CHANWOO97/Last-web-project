package com.green.Lupang.controller;

import java.lang.ProcessBuilder.Redirect;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.green.Lupang.dto.Items;
import com.green.Lupang.dto.ItemsCategory;
import com.green.Lupang.dto.Sale;
import com.green.Lupang.dto.SaleQuestion;
import com.green.Lupang.dto.Seller;
import com.green.Lupang.dto.TopSaleItemDTO;
import com.green.Lupang.dto.User;
import com.green.Lupang.service.BoardService;
import com.green.Lupang.service.ItemsService;
import com.green.Lupang.service.SaleService;
import com.green.Lupang.service.SellerService;
import com.green.Lupang.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {
	@Autowired
	private SaleService ss;
	@Autowired
	private ItemsService is;
	@Autowired
	private SellerService ses;
	@Autowired
	private UserService us;
	@Autowired
	private BoardService bs;

	// 향후 추가될 기능들
	// 주문 관리
	@GetMapping("/admin/orders")
	public String adminOrderList(Model model, @RequestParam(value = "page", defaultValue = "1") int page) {
		int pageSize = 12; // 한 페이지당 보여줄 상품 수
		int offset = (page - 1) * pageSize;

		List<Sale> ordersList = ss.getAdminOrderList(offset, pageSize);
		int totalCount = ss.saleCountByOrderAll(); // 전체 주문 수량
		int totalPage = (int) Math.ceil((double) totalCount / pageSize);
		int blockSize = 10; // 보여줄 블록 패이지 수 1, 2, 3, 4
		int startPage = ((page - 1) / blockSize) * blockSize + 1;
		int endPage = Math.min(startPage + blockSize - 1, totalPage);

		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("orders", ordersList);
		return "admin/orders";
	}

	// 주문 관리 업데이트
	@PostMapping("/admin/orderUpdate")
	public String orderUpdate(Model model, Sale sale) {
		int result = ss.updateStatus(sale);
		model.addAttribute("result", result);
		return "/admin/orderUpdate";
	}

	// 카테고리 목록 조회
	@GetMapping("/admin/categories")
	public String categories(Model model) {
		List<ItemsCategory> categories = is.ic_list();
		String lastId = categories.get(categories.size() - 1).getIc_id();
		int number = Integer.parseInt(lastId.substring(3)) + 1;
		String newId = String.format("cat%03d", number);
		model.addAttribute("categories", categories);
		model.addAttribute("newIc_id",newId);
		return "admin/categories";
	}

	// 카테고리 추가
	@PostMapping("/admin/categories/add")
	public String addCategory(@RequestParam("ic_id") String ic_id, @RequestParam("ic_name") String ic_name) {
		ItemsCategory ic = new ItemsCategory();
		ic.setIc_id(ic_id);
		ic.setIc_name(ic_name);
		is.insertCategory(ic);
		return "redirect:/admin/categories";
	}

	// 카테고리 삭제
	@PostMapping("/admin/categories/delete")
	public String deleteCategory(@RequestParam("ic_id") String ic_id) {
		is.deleteCategory(ic_id);
		return "redirect:/admin/categories";
	}

	// 판매자, 회원, 상품 팀원 작업은 미리 경로만 잡아놓기
		@GetMapping("/admin/sellers")
		public String sellers(Model model, @RequestParam(value = "page", defaultValue = "1") int page) {
			// 페이징
			// 사용자 목록 가져오기
			int rowPerPage = 10;
			int startRow = (page - 1) * rowPerPage;
			List<Seller> sellerRequests = ses.seller_list(startRow, rowPerPage);
			// 총 유저 수
			int totalUser = us.countAllUser();
			// 페이징 계산
			int totalPage = (int) Math.ceil((double) totalUser / rowPerPage);
			int pagePerBlock = 10;
			int startPage = page - (page - 1) % pagePerBlock;
			int endPage = Math.min(startPage + pagePerBlock - 1, totalPage);

			model.addAttribute("currentPage", page);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("totalPage", totalPage);
			model.addAttribute("sellerRequests", sellerRequests);
			return "admin/sellers";
		}

	// 판매자 요청 승인시
	@GetMapping("/admin/approveSeller")
	public String approveSeller(HttpSession session, Model model, @RequestParam("sr_id") int sr_id,
			@RequestParam("u_id") String u_id) {
		// DB에 승인 처리
		ses.approve(sr_id); // 판매자 승인 (sr_state = 'y')
		us.updateSellerRole_Y(u_id); // 유저 테이블 승인 (seller_role = 'y')
		model.addAttribute("sr_id",sr_id);
		return "redirect:/admin/sellers";
	}
	// 판매자 승인 취소시
	@GetMapping("/admin/rejectSeller")
	public String rejectSeller(HttpSession session, Model model, @RequestParam("sr_id") int sr_id,
			@RequestParam("u_id") String u_id) {
		// DB에 승인 처리
		ses.reject(sr_id); // 판매자 승인 (sr_state = 'y')
		us.updateSellerRole_N(u_id); // 유저 테이블 승인 (seller_role = 'y')
		
		// 승인 취소 후 mypage에 전달할 msg 저장
		Seller seller = new Seller();
		seller.setSr_id(sr_id); // 어떤 행을 수정할 것인지 지정
		seller.setCn_msg("관리자에 의해 판매자 신청이 거절되었습니다.");
		ses.updateCnMsg(seller);
		
		model.addAttribute("sr_id",sr_id);
		return "redirect:/admin/sellers";
	}
	// 상품 관리
	@GetMapping("/admin/items")
	public String items(Model model, @RequestParam(value = "page", defaultValue = "1") int page) {
		int pageSize = 12; // 한 페이지당 보여줄 상품 수
		int offset = (page - 1) * pageSize;
		
		List<Items> adminItemsList = is.adminItemsList(offset, pageSize);
		int totalCount = is.allItemCount();
		int totalPage = (int) Math.ceil((double) totalCount / pageSize);
		int blockSize = 10; // 보여줄 블록 패이지 수 1, 2, 3, 4
		int startPage = ((page - 1) / blockSize) * blockSize + 1;
		int endPage = Math.min(startPage + blockSize - 1, totalPage);
		
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("adminItemsList", adminItemsList);
		return "admin/items";
	}
	
	@PostMapping("/admin/updateItemStatus")
	public String updateItemStatus(@RequestParam("i_id") String i_id,
	                               @RequestParam("deleted") boolean deleted,
	                               Model model) {
	    // 1. 상품 삭제 상태 업데이트
	    Items item = new Items();
	    item.setI_id(i_id);
	    item.setDeleted(deleted);
	    int result = is.updateItemStatusDeleted(item); // → update items set is_deleted = ? where i_id = ?
	    model.addAttribute("result", result);
	    // 2. 목록 페이지 이동하기전 업데이트 완료 페이지로 리다이렉트
	    return "admin/itemsUpdate";
	}

	@GetMapping("/admin/users")
	public String users(Model model, @RequestParam(value = "page", defaultValue = "1") int page) {
		// 페이징
		// 사용자 목록 가져오기
		int rowPerPage = 10;
		int startRow = (page - 1) * rowPerPage;
		List<User> adminUserList = us.user_list(startRow, rowPerPage);
		model.addAttribute("adminUserList", adminUserList);
		// 총 유저 수
		int totalUser = us.countAllUser();
		// 페이징 계산
		int totalPage = (int) Math.ceil((double) totalUser / rowPerPage);
		int pagePerBlock = 10;
		int startPage = page - (page - 1) % pagePerBlock;
		int endPage = Math.min(startPage + pagePerBlock - 1, totalPage);

		model.addAttribute("currentPage", page);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("totalUser", totalUser);
		return "admin/users";
	}
	
	@PostMapping("/admin/updateDel")
	public String updateDel(@RequestParam("u_id") String u_id,
			@RequestParam("del") String del) {
		User user = new User();
		user.setU_id(u_id);
		user.setDel(del);
		int result = us.updateDel(user);
		return "redirect:/admin/users";
	}
	@GetMapping("/admin/question")
	public String question(Model model, @RequestParam(value = "page", defaultValue = "1") int page) {
		// 전체 문의 리스트 가져오기
		// 페이징
		int rowPerPage = 10;
		int startRow = (page - 1) * rowPerPage;
		// 페이징을 위한 문의내역 가져오기(0~10개씩)
		List<SaleQuestion> QuestionListPage = bs.getQuestionListPage(startRow, rowPerPage);
		// 총 댓글 수
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
		model.addAttribute("QuestionListPage", QuestionListPage);		
		return "/admin/question";
	} 
		// admin/question 답변처리 => 답변하기
		@GetMapping("/admin/approveQuestionForm")
		public String approveQuestion(@RequestParam("q_id") int q_id,
				@RequestParam("u_id") String u_id, @RequestParam("itemName") String itemName, Model model) {
		List<SaleQuestion> questionListByq_id = bs.getQuestion(q_id);
		model.addAttribute("questionListByq_id",questionListByq_id);
		model.addAttribute("itemName",itemName);	
		return "/admin/approveQuestionForm";
		}
		// admin/approveQuestionForm 문의 답변페이지
		@PostMapping("/admin/approveQuestion")
		public String approveQuestion(Model model, 
				@RequestParam("q_id") int q_id,
                @RequestParam("u_id") String u_id,
                @RequestParam("answer") String answer,
                @RequestParam("answer_state") String answer_state) {
			
		SaleQuestion sqAnswer = new SaleQuestion();
		sqAnswer.setQ_id(q_id);
		sqAnswer.setU_id(u_id);
		sqAnswer.setAnswer_state(answer_state);
		sqAnswer.setAnswer(answer);
		
		int result = bs.updateAnswer(sqAnswer);
		model.addAttribute("result", result);
		return "/admin/approveQuestion";
		}
		// admin/question 답변 수정하기
		@GetMapping("/admin/rejectQuestionForm")
		public String rejectQuestionForm(@RequestParam("q_id") int q_id,
				@RequestParam("u_id") String u_id, @RequestParam("itemName") String itemName, Model model) {
		List<SaleQuestion> questionListByq_id = bs.getQuestion(q_id);
		model.addAttribute("questionListByq_id",questionListByq_id);
		model.addAttribute("itemName",itemName);	
		return "/admin/rejectQuestionForm";
		}
		// admin/approveQuestionForm 문의 답변페이지
		@PostMapping("/admin/rejectQuestion")
		public String rejectQuestion(Model model, 
				@RequestParam("q_id") int q_id,
                @RequestParam("u_id") String u_id,
                @RequestParam("answer") String answer,
                @RequestParam("answer_state") String answer_state) {
			
		SaleQuestion sqAnswer = new SaleQuestion();
		sqAnswer.setQ_id(q_id);
		sqAnswer.setU_id(u_id);
		sqAnswer.setAnswer_state(answer_state);
		sqAnswer.setAnswer(answer);
		
		int result = bs.updateAnswer(sqAnswer);
		model.addAttribute("result", result);
		return "/admin/rejectQuestion";
		}
	/// 여기부터는 관리자 통합 그래프 용도	
	// 📍 AdminAnalyticsController.java
	@GetMapping("/admin/adminForm")
	public String analytics1(Model model) {
	    List<TopSaleItemDTO> topItems = ss.getTopSellingItems();
	    model.addAttribute("topItems", topItems);
	    return "admin/adminForm";
	}
	@GetMapping("/admin/analytics2")
	public String analytics2(Model model, @RequestParam(value = "page", defaultValue = "1") int page) {
		
		int pageSize = 10; // 한 페이지당 보여줄 상품 수
		int offset = (page - 1) * pageSize;
		List<Items> adminItemsList = is.adminItemsList(offset, pageSize);
		int totalCount = is.allItemCount();
		int totalPage = (int) Math.ceil((double) totalCount / pageSize);
		int blockSize = 10; 
		int startPage = ((page - 1) / blockSize) * blockSize + 1;
		int endPage = Math.min(startPage + blockSize - 1, totalPage);
		
		// 총 매출액 계산 => totalPrice
		List<Integer> priceList = (List<Integer>) adminItemsList.stream()
			.map(Items::getPrice)
			.collect(Collectors.toList());
		int totalPrice = 0; 
		for(int p : priceList) {
			totalPrice += p;
		}
		// 총 매출일 => totalPriceDay
		List<Sale> getAdminOrderList = ss.getAdminOrderList(offset, pageSize);
		List totalPriceDay = (List) getAdminOrderList.stream()
			.map(Sale::getS_date)	
			.collect(Collectors.toList());
		// 월 별 수익 총합 => monthTotalMap
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		Map<Object, Integer> monthTotalMap = getAdminOrderList.stream()
			    .collect(Collectors.groupingBy(sale ->
			        sdf.format(sale.getS_date()), // ← 여기에서 월 단위 문자열로 포맷
			        Collectors.summingInt(Sale::getTotal)
			    ));
			
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("adminItemsList", adminItemsList);
		model.addAttribute("monthTotalMap", monthTotalMap);
		model.addAttribute("totalPrice",totalPrice);
		return "admin/analytics2";
	}
}
