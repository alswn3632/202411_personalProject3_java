package com.ezen.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ezen.spring.dao.CommentDAO;
import com.ezen.spring.domain.CommentVO;
import com.ezen.spring.domain.PagingVO;
import com.ezen.spring.domain.handler.PagingHandler;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class CommentServiceImpl implements CommentService{
	
	private final CommentDAO cdao;

	@Override
	public int post(CommentVO cvo) {
		// TODO Auto-generated method stub
		if(cvo.getParentId() != 0) {
			return cdao.postAns(cvo);
		}else {
			return cdao.post(cvo);
		}
	}

//	@Override
//	public List<CommentVO> getList(long bno) {
//		// TODO Auto-generated method stub
//		return cdao.getList(bno);
//	}
	
	@Override
	public PagingHandler getList(long boardId, PagingVO pgvo) {
		// ph 객체 안에 cmtList, TotalCount 구하기
		List<CommentVO> cmtList = cdao.getList(boardId, pgvo);
		for(CommentVO cvo : cmtList) {
			if(cvo.getIsDel().equals("Y")) {
				cvo.setContent("삭제된 댓글 입니다.");
				cvo.setWriter("알수없음");
			}
		}
		int totalCount = cdao.getTotalCount(boardId);
		PagingHandler ph = new PagingHandler(totalCount, pgvo, cmtList);
		return ph;
	}

	@Override
	public int modify(CommentVO cvo) {
		// TODO Auto-generated method stub
		return cdao.modify(cvo);
	}

	@Override
	public int delete(long id) {
		// TODO Auto-generated method stub
		return cdao.delete(id);
	}

	@Override
	public List<CommentVO> getListAns(long cno) {
		// TODO Auto-generated method stub
		List<CommentVO> cmtList = cdao.getListAns(cno);
		for(CommentVO cvo : cmtList) {
			if(cvo.getIsDel().equals("Y")) {
				cvo.setContent("삭제된 댓글 입니다.");
				cvo.setWriter("알수없음");
			}
		}
		return cmtList;
	}

}
