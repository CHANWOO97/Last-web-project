package com.green.Lupang.service;

import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class SessionChk implements HandlerInterceptor{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 로그인 안한 사람은 로그인 폼으로 보내기
		HttpSession session = request.getSession();
		if (session == null || session.getAttribute("id") == null) {
			response.sendRedirect("/user/loginForm");
			return false;
		}
		return true;
	}
}
