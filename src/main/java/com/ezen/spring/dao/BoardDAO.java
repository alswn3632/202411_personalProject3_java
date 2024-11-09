package com.ezen.spring.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ezen.spring.domain.BoardVO;
import com.ezen.spring.domain.PagingVO;

public interface BoardDAO {

	int insert(BoardVO bvo);

//	List<BoardVO> getList();

	List<BoardVO> getList(PagingVO pgvo);
	
	BoardVO getDetail(long id);

	int update(BoardVO bvo);

	int delete(long id);

	int getTotal(PagingVO pgvo);

	long getLastId();

	int updateCommQty(@Param("bno")long bno, @Param("i")int i);

	int updateFileQty(@Param("bno")long bno, @Param("i")int i);

	int updateLikeQty(@Param("bno")long bno, @Param("i")int i);

}
