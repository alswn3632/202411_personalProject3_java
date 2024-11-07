package com.ezen.spring.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@EnableWebMvc
@ComponentScan(basePackages = {"com.ezen.spring.controller", "com.ezen.spring.service", "com.ezen.spring.handler"})
public class ServletConfiguration implements WebMvcConfigurer{

	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		// 리소스 경로 간단하게 변경하기
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	}

	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		// view 경로로 갈 앞 뒤 주소 붙여주기
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		viewResolver.setPrefix("/WEB-INF/views/");
		viewResolver.setSuffix(".jsp");
		
		// 화면에 뷰를 구성할 때 JSTL을 사용하는 JSP 쓸 경우
		viewResolver.setViewClass(JstlView.class);
		
		registry.viewResolver(viewResolver);
	}
	
}
