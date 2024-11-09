package com.ezen.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ezen.spring.dao.BoardDAO;
import com.ezen.spring.dao.FileDAO;
import com.ezen.spring.dao.LikesDAO;
import com.ezen.spring.domain.BoardDTO;
import com.ezen.spring.domain.BoardVO;
import com.ezen.spring.domain.FileVO;
import com.ezen.spring.domain.PagingVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class BoardServiceImpl implements BoardService{
	
	private final BoardDAO bdao;
	private final FileDAO fdao;
	private final LikesDAO ldao;

	@Transactional
	@Override
	public int insert(BoardDTO bdto) {
		// 1. bvo 넣기
		int isOk = bdao.insert(bdto.getBvo());
		
		// 2. 방금 넣은 bvo에서 bno 가져오기
		if(bdto.getFlist() == null) {
			// 첨부파일이 없다면? 여기서 끝
			return isOk;
		}
		
		// 3. bno 가지고 file 등록
		if(isOk>0 && bdto.getFlist().size() > 0) {
			// bvo 잘 들어갔고, flist도 잘 갖춰져있다면?
			long bno = bdao.getLastId(); // 가장 마지막에 저장된 튜플의 bno
			for(FileVO fvo : bdto.getFlist()) {
				fvo.setBoardId(bno);
				// 하나라도 실패하면 롤백
				isOk *= fdao.insertFile(fvo);
				isOk *= bdao.updateFileQty(bno, 1);
			}
			// 4. 등록한 파일 개수만큼 업데이트
			// isOk *= fdao.countUp(bdto.getBvo().getId());
		}
		
		return isOk;

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
	
	@Transactional
	@Override
	public BoardDTO getDetail(long id) {
		// TODO Auto-generated method stub
		BoardVO bvo = bdao.getDetail(id);
		
		List<FileVO> flist = fdao.getList(id);
		
		BoardDTO bdto = new BoardDTO(bvo, flist);
		return bdto;
	}

//	@Override
//	public int update(BoardVO bvo) {
//		// TODO Auto-generated method stub
//		return bdao.update(bvo);
//	}

	@Override
	public int delete(long id) {
		// TODO Auto-generated method stub
		return bdao.delete(id);
	}

	@Transactional
	@Override
	public int deleteFile(String uuid, long bno) {
		int isOk = bdao.updateFileQty(bno, -1);
		if(isOk>0) {
			isOk *= fdao.deleteFile(uuid);
		}
		return isOk;
	}

	@Transactional
	@Override
	public int update(BoardDTO boardDTO) {
		// insert와 달리 bno가 이미 존재함
		int isOk = bdao.update(boardDTO.getBvo());
		if(boardDTO.getFlist() == null) {
			return isOk;
		}
		
		if(isOk>0 && boardDTO.getFlist().size()>0) {
			for(FileVO fvo : boardDTO.getFlist()) {
				long bno = boardDTO.getBvo().getId();
				fvo.setBoardId(bno);
				isOk *= fdao.insertFile(fvo);
				isOk *= bdao.updateFileQty(bno, 1);
			}
		}
		return isOk;
	}

	@Override
	public int isLike(long bno, long uno) {
		// TODO Auto-generated method stub
		return ldao.isLike(bno, uno);
	}

	@Transactional
	@Override
	public int regLike(long bno, long uno) {
		int isOk = ldao.regLike(bno, uno);
		if(isOk>0) {
			isOk *= bdao.updateLikeQty(bno, 1);
		}
		return isOk;
	}

	@Transactional
	@Override
	public int delLike(long bno, long uno) {
		int isOk = ldao.delLike(bno, uno);
		if(isOk>0) {
			isOk *= bdao.updateLikeQty(bno, -1);
		}
		return isOk;
	}

}
