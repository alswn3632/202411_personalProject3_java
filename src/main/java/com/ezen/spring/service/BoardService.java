package com.ezen.spring.service;

import java.util.List;

import com.ezen.spring.domain.BoardVO;
import com.ezen.spring.domain.PagingVO;

public interface BoardService {

	int insert(BoardVO bvo);

//	List<BoardVO> getList();

	List<BoardVO> getList(PagingVO pgvo);
	
	int getTotal(PagingVO pgvo);
	
	BoardVO getDetail(int id);

	int update(BoardVO bvo);

	int delete(int id);



}
