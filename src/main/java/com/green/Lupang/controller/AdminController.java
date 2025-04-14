package com.green.Lupang.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.Lupang.dto.ItemsCategory;
import com.green.Lupang.dto.Sale;
import com.green.Lupang.service.ItemsService;
import com.green.Lupang.service.SaleService;

@Controller
public class AdminController {
	@Autowired
	private SaleService ss;
	@Autowired
	private ItemsService is;
	
	@GetMapping("/admin/adminForm")
    public String adminHome() {
        return "admin/adminForm";
    }
	
	// 향후 추가될 기능들
	// 주문 관리
    @GetMapping("/admin/orders")
    public String adminOrderList(Model model, @RequestParam(value = "page", defaultValue = "1") int page) {
    	int pageSize = 12; // 한 페이지당 보여줄 상품 수
		int offset = (page - 1) * pageSize;
		
    	List<Sale> ordersList = ss.getAdminOrderList(offset, pageSize);
    	int totalCount = ss.saleCountByOrderAll(); // 전체 주문 수량
    	int totalPage = (int) Math.ceil((double)totalCount / pageSize);
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
        model.addAttribute("categories", categories);
        return "admin/categories";
    }
    // 카테고리 추가
    @PostMapping("/admin/categories/add")
    public String addCategory(@RequestParam("ic_id") String ic_id,
                              @RequestParam("ic_name") String ic_name) {
    	ItemsCategory ic = new ItemsCategory();
    	ic.setIc_id(ic_id); ic.setIc_name(ic_name);
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
    public String sellers() {
        return "admin/sellers";
    }

    @GetMapping("/admin/users")
    public String users() {
        return "admin/users";
    }
    
    @GetMapping("/admin/items")
    public String items() {
        return "admin/items";
    }
    
    
}
