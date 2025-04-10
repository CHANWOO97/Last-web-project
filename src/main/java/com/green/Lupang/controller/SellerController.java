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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.green.Lupang.dto.Items;
import com.green.Lupang.dto.ItemsCategory;
import com.green.Lupang.dto.Seller;
import com.green.Lupang.dto.SellerItems;
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
	    }
	    seller.setSr_state("n");
	    seller.setSrq_at(new Date());
	    seller.setU_id(u_id);
	    int result = ss.insert(seller);  
	    int sr_id = ss.getsrid(u_id);	    
	    
	    User user = new User();
	    user.setSr_id(sr_id);
	    user.setU_id(u_id);
	    us.updateSr_id(user);
	    model.addAttribute("result", result);
		return "/seller/sellerRequest";
	}
	@GetMapping("seller/sellerItmes")
	public void seller(HttpSession session, Model model, @RequestParam("sr_id") String sr_id) {
		String u_id = (String) session.getAttribute("id");
		Seller seller = ss.select_id(sr_id); // ic_name 담음
		model.addAttribute("seller", seller);
	}
	@PostMapping("/seller/sellerItmesComplete")
		public String sellerItmesComplete(Items items, Model model, HttpSession session, @RequestParam("sr_id") String sr_id) throws IllegalStateException, IOException {
		// 파일 저장 처리
	    MultipartFile file = items.getFile(); // DTO에 MultipartFile 필드 있어야 함
	    if (file != null && !file.isEmpty()) {
	        String originalFileName = file.getOriginalFilename();
	        String extension = originalFileName.substring(originalFileName.lastIndexOf("."));
	        String savedFileName = UUID.randomUUID().toString() + extension;

	        String uploadPath = session.getServletContext().getRealPath("/resources/images/items_photo");
	        File uploadFile = new File(uploadPath, savedFileName);
	        file.transferTo(uploadFile); // 저장

	        items.setPhoto(savedFileName); // DB 저장용 파일명 설정
	    }
	    // 기본값 설정 (예: 등록일자 자동, 필요 시 session에서 u_id 등도 세팅)
	    int result = is.insert(items);
	    SellerItems sellerItems = new SellerItems();
	    String  i_id = is.getmaxi_id();
	    sellerItems.setI_id(i_id);
	    sellerItems.setSr_id(sr_id);
	    
	    ss.insetSellrItems(sellerItems);
	    model.addAttribute("result", result);
	    return "/seller/sellerItmesComplete";
	}
	@GetMapping("/seller/sellerItemsChk")
	public void sellerItemsChk() {
	}
}
