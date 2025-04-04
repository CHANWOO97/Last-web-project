package com.green.Lupang.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.green.Lupang.dto.User;
import com.green.Lupang.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
	@Autowired
	private UserService us;
	@Autowired
	private BCryptPasswordEncoder bpe;
	@GetMapping("/user/loginForm")
	public String loginForm() {
		return "user/loginForm";
	}
	@PostMapping("/user/login")
	public void login(User user, HttpSession session, Model model) {
		int result = 0;
		User user2 = us.select(user.getU_id());
		if (user2 == null || user2.getDel().equals("y"))
			result = -1; // 없는 아이디
		// 암호화 안한 것을 앞에쓰면 암호화 한 후에 뒤에 값과 비교
		else if (bpe.matches(user.getPassword(), user2.getPassword())) {
			result = 1; // id와 암호가 일치
			session.setAttribute("id", user.getU_id());
			User user3 = us.u_id(user.getU_id());
			if ( user3.getPhoto() == null ||  user3.getPhoto().equals(""))
				session.setAttribute("photo", "user_base_photo.png");
			else session.setAttribute("photo", user3.getPhoto());
		}
		model.addAttribute("result", result);
	}	
	@GetMapping("/user/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "/user/logout";
	}
	@GetMapping("/user/joinForm")
	public void joinForm() {}
	@PostMapping("/user/join") 
	public String join(User user, Model model, MultipartHttpServletRequest mhr) throws IOException {
		int result = 0;
		User user2 = us.select(user.getU_id());
		if (user2 == null) {
			List<MultipartFile> list = mhr.getFiles("file");
			List<User> photo = new ArrayList<>();
			String real = mhr.getServletContext().getRealPath("/resources/images/user_photo");
			for(MultipartFile mf : list) {
				User mp = new User();
				String fileName1 = mf.getOriginalFilename();
				UUID uuid = UUID.randomUUID();
				String fileName = uuid+fileName1.substring(fileName1.lastIndexOf("."));
				mp.setPhoto(fileName);
				mp.setU_id(user.getU_id());
				photo.add(mp);
				FileOutputStream fos = new FileOutputStream(new File(real+"/"+fileName));
				fos.write(mf.getBytes());
				fos.close();
//				user.setFileName(fileName);  // 하나만 member저장
			}
			// 암호화
			String encPass = bpe.encode(user.getPassword());
			user.setPassword(encPass);
			result = us.insert(user);
			if (result > 0 && photo.size() > 0) {
			    us.insertPhoto(photo);}
		} else result = -1; // 이미 있는 데이터
		model.addAttribute("result", result);
		return "/user/join";
	}
	@PostMapping(value = "/user/idChk", produces = "text/html;charset=utf-8")
	@ResponseBody
	public String idChk(@RequestParam(value = "u_id", defaultValue = "") String u_id) {
		String msg = "";
		User user = us.select(u_id);
		if (user == null) msg = "사용 가능한 아이디입니다";
		else msg = "사용중인 아이디 입니다";
		return msg;
	}
	@GetMapping("/user/mypage")
	public void mypage(HttpSession session, Model model) {
		 String u_id = (String) session.getAttribute("id");
		    User user = us.select(u_id);
		    model.addAttribute("user", user);		
	}
	
}
