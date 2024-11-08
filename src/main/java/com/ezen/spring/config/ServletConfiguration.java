package com.ezen.spring.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@EnableScheduling
@EnableWebMvc
@ComponentScan(basePackages = {"com.ezen.spring.controller", "com.ezen.spring.service", "com.ezen.spring.handler"})
public class ServletConfiguration implements WebMvcConfigurer{

	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		// 리소스 경로 간단하게 변경하기
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
		// 파일 경로 간단하게 변경하기
		registry.addResourceHandler("/upload/**").addResourceLocations("file:///D:\\_spproject\\_java\\_fileUpload\\");

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
	
	// **파일 업로드를 위한 리졸버
	@Bean(name = "multipartResolver")
	public MultipartResolver getMultipartResolver() {
		StandardServletMultipartResolver multipartResolver = new StandardServletMultipartResolver();
		return multipartResolver;
	}
	
}
