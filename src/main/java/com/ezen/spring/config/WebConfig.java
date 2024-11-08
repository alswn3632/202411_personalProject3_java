package com.ezen.spring.config;

import javax.servlet.Filter;
import javax.servlet.MultipartConfigElement;
import javax.servlet.ServletRegistration.Dynamic;

import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class WebConfig extends AbstractAnnotationConfigDispatcherServletInitializer{

	@Override
	protected Class<?>[] getRootConfigClasses() {
		// TODO Auto-generated method stub
		return new Class[] {RootConfig.class};
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		// TODO Auto-generated method stub
		return new Class[] {ServletConfiguration.class};
	}

	@Override
	protected String[] getServletMappings() {
		// TODO Auto-generated method stub
		return new String[] {"/"};
	}

	@Override
	protected Filter[] getServletFilters() {
		// 인코딩 설정
		CharacterEncodingFilter encoding = new CharacterEncodingFilter();
		encoding.setEncoding("UTF-8");
		encoding.setForceEncoding(true);
		
		return new Filter[] {encoding};
	}
	
	// 사용자 지정 설정
	@Override
	protected void customizeRegistration(Dynamic registration) {
		// 파일 업로드를 위한 설정 (경로, 크기, 최대크기)
		String uploadLocation = "D:\\_spproject\\_java\\_fileUpload";
		int maxFileSize = 1024 * 1024 * 20; // 20MB
		int maxRequest = maxFileSize * 3;
		int fileSizeThreshold = maxFileSize;
		
		MultipartConfigElement multipartConfig = 
				new MultipartConfigElement(uploadLocation, maxFileSize, maxRequest, fileSizeThreshold);
		
		registration.setMultipartConfig(multipartConfig);
	}
	
}
