package com.green.Lupang.service;

import org.springframework.web.servlet.HandlerInterceptor;

import com.green.Lupang.dto.User;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class SessionChk implements HandlerInterceptor{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("🔍 SessionChk 실행됨");
		// 로그인 안한 사람은 로그인 폼으로 보내기
		HttpSession session = request.getSession();
		if (session == null || session.getAttribute("id") == null) {
			response.sendRedirect("/user/loginForm");
			return false;
		}
		
        String u_id = (String)session.getAttribute("id");

        String uri = request.getRequestURI();

        // admin 경로인 경우, id가 "admin"이 아닐 때 차단
        if (uri.contains("/admin") && !"admin".equals(u_id)) {
        	System.out.println(u_id);
            response.sendRedirect("/user/logout"); // 권한 없음 페이지로 리디렉트
            return false;
        }
		
		return true;
	}
}
