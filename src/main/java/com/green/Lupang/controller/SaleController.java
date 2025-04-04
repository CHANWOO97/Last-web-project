package com.green.Lupang.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.Lupang.dto.Items;
import com.green.Lupang.dto.ItemsCategory;
import com.green.Lupang.dto.Sale;
import com.green.Lupang.dto.SaleItems;
import com.green.Lupang.dto.User;
import com.green.Lupang.service.CartService;
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
			saleItems.add(si);			
		}
		model.addAttribute("user", user);
		model.addAttribute("ic_list", ic_list);
		model.addAttribute("saleItems", saleItems);
		return "itemsOrder/order"; // order.jsp로 이동
	}
	
	@PostMapping("/itemsOrder/orderSuccess")
	public String orderSuccess(@RequestParam("selectedItems") List<String> selectedItems,
				Sale sale,	HttpSession session, Model model) {
		String id = (String)session.getAttribute("id");
		String cartId = cs.getOrCreateCartId(id);
		String saleId = UUID.randomUUID().toString(); // saleid 랜덤값으로 만듬
		Sale sale2 = new Sale();
		sale2.setS_id(saleId); sale2.setC_id(cartId);
		// 수령인 정보 (이름, 전화, 주소) sale table 및 dto 에 추가 
		sale2.setReceiver(sale.getReceiver()); sale2.setTel(sale.getTel());
		sale2.setAddress(sale.getAddress()); 
		ss.saleSave(sale2); // 구매 코드와 장바구니 코드 저장
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
		return "itemsOrder/orderSuccess";
	}
}
