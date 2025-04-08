package com.green.Lupang.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.green.Lupang.dto.ItemsCategory;
import com.green.Lupang.dto.Seller;
import com.green.Lupang.dto.User;
import com.green.Lupang.service.ItemsService;
import com.green.Lupang.service.SellerService;
import com.green.Lupang.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class SellerController {
	@Autowired
	private SellerService ss;
	@Autowired
	private UserService us;
	@Autowired
	private ItemsService is;

	@GetMapping("seller/sellerRequestForm")
	public void sellerRequestForm(Seller seller, Model model, HttpSession session) {
		String u_id = (String) session.getAttribute("id");
		User user = us.select(u_id);
		List<ItemsCategory> ic_list = is.ic_list();
			model.addAttribute("ic_list", ic_list);	
			model.addAttribute("user", user);	
	}
	@PostMapping("/seller/sellerRequest")
	public String sellerRequest(HttpSession session, Model model, Seller seller) throws IOException {
		String u_id = (String) session.getAttribute("id");
		Seller existingSeller = ss.selectByUid(u_id);  // 판매자 정보 가져오기
	    String fileName = seller.getFile().getOriginalFilename();
	    if (fileName != null && !fileName.equals("")) {
	        UUID uuid = UUID.randomUUID();
	        String fileName1 = uuid + fileName.substring(fileName.lastIndexOf("."));
	        seller.setSrw_pev(fileName1); // DB에 저장할 파일명
	        String real = session.getServletContext().getRealPath("/resources/images/seller_photo");
	        FileOutputStream fos = new FileOutputStream(new File(real + "/" + fileName1));
	        fos.write(seller.getFile().getBytes());
	        fos.close();
	    }else {
	        // 새 파일 없으면 기존 사진 유지
	        seller.setSrw_pev(existingSeller.getSrw_pev());
	    }
	    seller.setSr_state("n");
	    seller.setSrq_at(new Date());
	    int result = ss.insert(seller);
	    model.addAttribute("result", result);
		return "/seller/sellerRequest";
	}
}
