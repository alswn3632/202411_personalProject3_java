package com.ezen.spring.service;

import org.springframework.stereotype.Service;

import com.ezen.spring.dao.ReportDAO;
import com.ezen.spring.domain.ReportVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class ReportServiceImpl implements ReportService{
	
	private final ReportDAO rdao;

	@Override
	public int register(ReportVO rvo) {
		int isOk = rdao.isReported(rvo);
		if(isOk != 0) {
			return -1;
		}else {
			return rdao.register(rvo);
		}
	}
}
