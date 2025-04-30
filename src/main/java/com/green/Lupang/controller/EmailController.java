package com.green.Lupang.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.Lupang.dto.SettleStatement;
import com.green.Lupang.dto.User;
import com.green.Lupang.service.InvoiceService;
import com.green.Lupang.service.MailService;
import com.green.Lupang.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class EmailController {
	@Autowired
	private UserService us;
	@Autowired
	private BCryptPasswordEncoder bpe;
	@Autowired
	private InvoiceService is;
	@Autowired
	private MailService ms;
	
	@GetMapping("/email/mailToIdForm")
	public void mailToIdForm() {}
	
	@PostMapping("/email/mailToId")
	public void mailToId(User user, HttpSession session, Model model) {
		int result = 1;		
		String userid = us.selectId(user);
		if (userid == null || userid.equals("")) result = 0;
		model.addAttribute("id", userid);
		model.addAttribute("result", result);
	}
	//  MimeMessage 용 (html,pdf 등 복잡한 형식)
	@PostMapping("/admin/home/salemonthtab/settleInvoiceMsg")
	@ResponseBody
	public String sendMimeSettleInvoiceMail(Model model, SettleStatement settleStatement) {
	    try {
	        // 1. 메일 전송 로직 호출
	        ms.sendMimeInvoiceMail(settleStatement);

	        return "success";  // 프론트엔드에서 success 메시지로 처리
	    } catch (Exception e) {
	        e.printStackTrace();
	        return "fail";
	    }
	}
}
	
//	// simple message 용(단순 문자전송)
//	@PostMapping("/admin/home/salemonthtab/settleInvoiceMsg")
//	@ResponseBody
//	public String sendSettleInvoiceMail(Model model, SettleStatement settleStatement) {
//	    try {
//	        // 1. 메일 전송 로직 호출
//	        ms.sendSimpleInvoiceMail(settleStatement);
//
//	        return "success";  // 프론트엔드에서 success 메시지로 처리
//	    } catch (Exception e) {
//	        e.printStackTrace();
//	        return "fail";
//	    }
//	}
	
