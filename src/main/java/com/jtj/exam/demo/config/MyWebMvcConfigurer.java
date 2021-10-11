package com.jtj.exam.demo.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.jtj.exam.demo.interceptor.BeforeActionInterceptor;

@Configuration
public class MyWebMvcConfigurer implements WebMvcConfigurer{
	// beforeActionInterceptor 인터셉터 불러오기
		@Autowired
		BeforeActionInterceptor beforeActionInterceptor;

		// needLoginInterceptor 인터셉터 불러오기
		// @Autowired
		// NeedLoginInterceptor needLoginInterceptor;

		// needLogoutInterceptor 인터셉터 불러오기
		// @Autowired
		// NeedLogoutInterceptor needLogoutInterceptor;
		
		// 이 함수는 인터셉터를 적용하는 역할을 합니다.
		@Override
		public void addInterceptors(InterceptorRegistry registry) {
			InterceptorRegistration ir;

			ir = registry.addInterceptor(beforeActionInterceptor);
			ir.addPathPatterns("/**");
			ir.excludePathPatterns("/favicon.ico");
			ir.excludePathPatterns("/resource/**");
			ir.excludePathPatterns("/error");
			
		}
}
