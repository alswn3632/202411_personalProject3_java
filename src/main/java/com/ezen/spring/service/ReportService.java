package com.ezen.spring.service;

import com.ezen.spring.domain.ReportVO;

public interface ReportService {

	int register(ReportVO rvo);

	int adminDel(long bno, long id);

	int adminHod(long bno, long id);

	
}
