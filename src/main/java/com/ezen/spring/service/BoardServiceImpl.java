package com.ezen.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ezen.spring.dao.BoardDAO;
import com.ezen.spring.domain.BoardVO;
import com.ezen.spring.domain.PagingVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class BoardServiceImpl implements BoardService{
	
	private final BoardDAO bdao;

	@Override
	public int insert(BoardVO bvo) {
		// TODO Auto-generated method stub
		return bdao.insert(bvo);
	}

//	@Override
//	public List<BoardVO> getList() {
//		// TODO Auto-generated method stub
//		return bdao.getList();
//	}

	@Override
	public List<BoardVO> getList(PagingVO pgvo) {
		// TODO Auto-generated method stub
		return bdao.getList(pgvo);
	}
	
	@Override
	public int getTotal(PagingVO pgvo) {
		// TODO Auto-generated method stub
		return bdao.getTotal(pgvo);
	}
	
	@Override
	public BoardVO getDetail(int id) {
		// TODO Auto-generated method stub
		return bdao.getDetail(id);
	}

	@Override
	public int update(BoardVO bvo) {
		// TODO Auto-generated method stub
		return bdao.update(bvo);
	}

	@Override
	public int delete(int id) {
		// TODO Auto-generated method stub
		return bdao.delete(id);
	}



}
