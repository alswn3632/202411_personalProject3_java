package com.ezen.spring.service;

import java.util.List;

import com.ezen.spring.domain.BoardDTO;
import com.ezen.spring.domain.BoardVO;
import com.ezen.spring.domain.PagingVO;

public interface BoardService {

	int insert(BoardDTO bdto);

//	List<BoardVO> getList();

	List<BoardVO> getList(PagingVO pgvo);
	
	int getTotal(PagingVO pgvo);
	
	BoardDTO getDetail(long id);

	int update(BoardDTO boardDTO);

	int delete(long id);

	int deleteFile(String uuid);



}
