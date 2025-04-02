package com.green.Lupang.configuration;

import java.util.ArrayList;
import java.util.List;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import com.green.Lupang.service.SessionChk;


@Configuration
public class WebConfiguration implements WebMvcConfigurer{
	@Override // session 체크가 필요한 경로만 list 에 추가	
	public void addInterceptors(InterceptorRegistry registry) {
		List<String> list = new ArrayList<>();
		//ex) list.add("/**/layout/home");
		registry.addInterceptor(new SessionChk()).addPathPatterns(list);
		// addPathPatterns()에 추가된 경로는 인터셉터를 적용할 경로 (session 체크)
	}
	@Bean
	public BCryptPasswordEncoder bCryptPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}
}
