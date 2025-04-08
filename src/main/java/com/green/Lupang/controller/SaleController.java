package com.green.Lupang.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.Lupang.dto.Items;
import com.green.Lupang.dto.ItemsCategory;
import com.green.Lupang.dto.Sale;
import com.green.Lupang.dto.SaleItems;
import com.green.Lupang.dto.User;
import com.green.Lupang.service.CartService;
import com.green.Lupang.service.IamportService;
import com.green.Lupang.service.ItemsService;
import com.green.Lupang.service.SaleService;
import com.green.Lupang.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class SaleController {
	@Autowired
	private SaleService ss;
	@Autowired
	private CartService cs;
	@Autowired
	private ItemsService is;
	@Autowired
	private UserService us;
	@Autowired
	private IamportService ims;
	
	@PostMapping("/itemsOrder/order")
	public String itemsOrder(@RequestParam("selectedItems") List<String> selectedItems, Model model, HttpSession session) {
		String id = (String)session.getAttribute("id");
		User user = us.select(id);
		List<SaleItems> saleItems = new ArrayList<>();	
		List<ItemsCategory> ic_list = is.ic_list();		
		for (String selectItem : selectedItems) { // selectedItems 값을 ${item.i_id}_${item.quantity} 이렇게 받아옴
			String [] parts = selectItem.split("_");
			String i_id = parts[0];			
			int quantity = Integer.parseInt(parts[1]);
			Items item = is.select(i_id);
			
			SaleItems si = new SaleItems();
			si.setName(item.getName()); si.setPhoto(item.getPhoto());
			si.setPrice(item.getPrice()); si.setQuantity(quantity);
			si.setI_id(item.getI_id());
			saleItems.add(si);		
		}
		model.addAttribute("user", user);
		model.addAttribute("ic_list", ic_list);
		model.addAttribute("saleItems", saleItems);
		return "itemsOrder/order"; // order.jsp로 이동
	}
	@PostMapping("/itemsOrder/pay")
	public String pay(@RequestParam("selectedItems") List<String> selectedItems,
			Sale sale,	HttpSession session, Model model) {
		String id = (String)session.getAttribute("id");
		User user = us.select(id);
		String cartId = cs.getOrCreateCartId(id);
		String saleId = UUID.randomUUID().toString(); // saleid 랜덤값으로 만듬
		sale.setS_id(saleId); sale.setC_id(cartId); 
		ss.saleSave(sale); // 구매 코드와 장바구니 코드 저장
		for (String selectItem : selectedItems) { // selectedItems 값을 ${item.i_id}_${item.quantity} 이렇게 받아옴
			String [] parts = selectItem.split("_");
			String i_id = parts[0];
			int quantity = Integer.parseInt(parts[1]);
			String saleItemId = UUID.randomUUID().toString(); // sale_items id 랜덤값으로 만듬
			SaleItems si = new SaleItems();
			si.setSi_id(saleItemId); si.setS_id(saleId);
			si.setI_id(i_id); si.setQuantity(quantity);
			ss.saleItemSave(si);
		}		
		model.addAttribute("s_id", saleId);
		model.addAttribute("sale", sale);
		model.addAttribute("email", user.getEmail());
		return "itemsOrder/pay";
	}
	@GetMapping("/itemsOrder/orderSuccess")
	public String orderSuccess(@RequestParam("saleId") String s_id , @RequestParam("imp_uid") String impUid,
            					@RequestParam("merchant_uid") String merchantUid,	Model model) {
		// 1. 주문 상태 업데이트
		Sale sale = ss.findById(s_id);
		// 결제를 위한 결제 서비스 로직 메서드
		boolean isPaid = ims.verifyPayment(impUid, merchantUid, sale.getTotal());
		if (!isPaid) {
	        model.addAttribute("error", "결제 검증 실패");
	        return "error/paymentError";
	    }
		sale.setS_status("y"); // 주문 상태 y 로 바꿈
		ss.updateStatus(sale);
		Sale sale2 = ss.findById(sale.getS_id());
		
		// 2. 주문 상세 보여주기 위해 조회
	    List<SaleItems> saleItems = ss.getSaleItems(s_id);		
		model.addAttribute("s_id", s_id);
		model.addAttribute("saleItems", saleItems);
		model.addAttribute("sale", sale2);
		return "itemsOrder/orderSuccess";
	}
	@GetMapping("/itemsOrder/orderList")
	public String orderList(HttpSession session, Model model, @RequestParam(value = "page", defaultValue = "1") int page) {
		String id = (String)session.getAttribute("id");
		int pageSize = 12; // 한 페이지당 보여줄 상품 수
		int offset = (page - 1) * pageSize;
		
		List<Sale> orderList = ss.findAllByUserId(id, offset, pageSize); // 페이징된 상품 목록
		int totalCount = ss.saleCountByOrder(id); // 전체 주문 수량
		int totalPage = (int) Math.ceil((double)totalCount / pageSize);
		int blockSize = 10; // 보여줄 블록 패이지 수 1, 2, 3, 4
		int startPage = ((page - 1) / blockSize) * blockSize + 1;
		int endPage = Math.min(startPage + blockSize - 1, totalPage);
		
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("orderList", orderList);
		return "itemsOrder/orderList";
	}
}
