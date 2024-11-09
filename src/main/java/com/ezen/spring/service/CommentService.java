package com.ezen.spring.service;

import java.util.List;

import com.ezen.spring.domain.CommentVO;
import com.ezen.spring.domain.PagingVO;
import com.ezen.spring.handler.PagingHandler;

public interface CommentService {

	int post(CommentVO cvo);

//	List<CommentVO> getList(long bno);

	PagingHandler getList(long boardId, PagingVO pgvo);
	
	int modify(CommentVO cvo);

	int delete(long id, long bno);

	List<CommentVO> getListAns(long cno);


}
