package com.ezen.spring.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ezen.spring.domain.ReportVO;
import com.ezen.spring.service.ReportService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/report/*")
@RestController
public class ReportController {
	
	private final ReportService rsv;
	
	@PostMapping("/register")
	public ResponseEntity<String> register(@RequestBody ReportVO rvo) {
		log.info(">>>> post cvo > {}", rvo);
		int isOk = rsv.register(rvo);
		if(isOk == 1) {
			return new ResponseEntity<String>("1", HttpStatus.OK);			
		}else if(isOk == -1){
			return new ResponseEntity<String>("-1", HttpStatus.OK);			
		}else {
			return new ResponseEntity<String>("0", HttpStatus.INTERNAL_SERVER_ERROR);			
		}
	}
	
	
	
}
