package com.green.Lupang.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.green.Lupang.dto.Sale;
import com.green.Lupang.service.SaleService;

@Controller
public class AdminController {
	@Autowired
	private SaleService ss;
	
	@GetMapping("/admin/adminForm")
    public String adminHome() {
        return "admin/adminForm";
    }
	
	// 향후 추가될 기능들
    @GetMapping("/admin/orders")
    public String adminOrderList(Model model) {
        List<Sale> orders = ss.getAdminOrderList();
        model.addAttribute("orders", orders);
        return "admin/orders";
    }

    @GetMapping("/admin/categories")
    public String categories() {
        return "admin/categories";
    }

    // 판매자, 회원 등 팀원 작업은 미리 경로만 잡아놓기
    @GetMapping("/sellers")
    public String sellers() {
        return "admin/sellers";
    }

    @GetMapping("/users")
    public String users() {
        return "admin/users";
    }
}
