package com.ezen.spring.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ezen.spring.dao.BoardDAO;
import com.ezen.spring.dao.ReportDAO;
import com.ezen.spring.domain.ReportVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class ReportServiceImpl implements ReportService{
	
	private final ReportDAO rdao;
	private final BoardDAO bdao;

	@Override
	public int register(ReportVO rvo) {
		int isOk = rdao.isReported(rvo);
		if(isOk != 0) {
			return -1;
		}else {
			return rdao.register(rvo);
		}
	}

	@Transactional
	@Override
	public int adminDel(long bno, long id) {
		// TODO Auto-generated method stub
		int isOk = bdao.adminDel(bno);
		if(isOk>0) {
			isOk *= rdao.adminDel(id);
		}
		return isOk;
	}

	@Override
	public int adminHod(long bno, long id) {
		
		return rdao.adminHod(id);
	}

}
