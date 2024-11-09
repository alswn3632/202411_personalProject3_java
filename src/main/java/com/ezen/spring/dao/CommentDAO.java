package com.ezen.spring.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ezen.spring.domain.CommentVO;
import com.ezen.spring.domain.PagingVO;

public interface CommentDAO {

	int post(CommentVO cvo);

	int postAns(CommentVO cvo);
	
//	List<CommentVO> getList(long bno);

	List<CommentVO> getList(@Param("boardId") long boardId, @Param("pgvo") PagingVO pgvo);
	
	int modify(CommentVO cvo);

	int delete(long id);

	int getTotalCount(long boardId);

	List<CommentVO> getListAns(long cno);


}
