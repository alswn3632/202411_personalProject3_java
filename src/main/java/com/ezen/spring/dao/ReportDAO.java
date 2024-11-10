package com.ezen.spring.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ezen.spring.domain.ReportVO;

public interface ReportDAO {

	int register(ReportVO rvo);

	int isReported(ReportVO rvo);

	List<Long> findReport();

	void insertAlert(@Param("boardId")long boardId, @Param("alertMsg")String alertMsg);

	void statusReview(Long bno);

}
