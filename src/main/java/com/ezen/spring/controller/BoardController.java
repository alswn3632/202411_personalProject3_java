package com.ezen.spring.controller;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ezen.spring.domain.BoardDTO;
import com.ezen.spring.domain.BoardVO;
import com.ezen.spring.domain.FileVO;
import com.ezen.spring.domain.PagingVO;
import com.ezen.spring.handler.FileHandler;
import com.ezen.spring.handler.PagingHandler;
import com.ezen.spring.service.BoardService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/board/*")
@Controller
public class BoardController {
	
	private final BoardService bsv;
	private final FileHandler fh;

	@GetMapping("/register")
	public void register() {
		
	}
	
	@PostMapping("/insert")
	public String insert(BoardVO bvo, MultipartFile[] files) {
		List<FileVO> flist = null;
		if(files[0].getSize() > 0) {
			flist = fh.uploadFiles(files);
			log.info(">>>> flist > {}", flist);
		}
		BoardDTO bdto = new BoardDTO(bvo, flist);

		int isOk = bsv.insert(bdto);
		log.info(">>>> insert > {}", (isOk>0? "성공" : "실패"));
		
		return "redirect:/board/list";
	}
	
	@GetMapping("/list")
	public String list(Model m, PagingVO pgvo) {
//		List<BoardVO> list = bsv.getList();
//		m.addAttribute("list", list);
//		
//		return "/board/list";
//		PagingVO pgvo = new PagingVO();
		List<BoardVO> list = bsv.getList(pgvo);
		
		String today = LocalDate.now().toString();
		// 2024-11-11
		for(BoardVO bvo : list) {
			// 2024-11-11 09:37:30
			String bDate = bvo.getRegDate().substring(0, bvo.getRegDate().indexOf(" "));
			if(today.equals(bDate)) {
				bvo.setCustomTime(bvo.getRegDate().substring(bvo.getRegDate().indexOf(" ")+1, bvo.getRegDate().indexOf(" ")+6));
			}else {
				bvo.setCustomTime(bDate.substring(bDate.indexOf("-")+1));
			}
		}
		
		int totalCount = bsv.getTotal(pgvo);
		PagingHandler ph = new PagingHandler(totalCount, pgvo);
		
		m.addAttribute("list", list);
		m.addAttribute("ph", ph);
		
		return "/board/list";
	}
	
	@GetMapping({"/detail","/modify"})
	public void detail(HttpServletRequest request, Model m, long id) {
		String path = request.getServletPath();
		
		if(path.equals("/board/detail")) {
			int isOk = bsv.readCount(id);
		}
		
		BoardDTO bdto = bsv.getDetail(id);
		m.addAttribute("bdto", bdto);
	}
	
	@PostMapping("/update")
	public String update(BoardVO bvo, @RequestParam(name="files", required = false) MultipartFile[] files) {
		List<FileVO> flist = null;
		
		if(files[0].getSize() > 0) {
			// 파일이 있다면...
			flist = fh.uploadFiles(files);
		}
		int isOk = bsv.update(new BoardDTO(bvo, flist));
		log.info(">>>> update > {}", (isOk>0? "성공" : "실패"));
		
		// detail.jsp로 이동하는게 아닌 내부 controller의 detail mapping으로 이동
		return "redirect:/board/detail?id=" + bvo.getId();
	}
	
	@GetMapping("/delete")
	public String delete(long id) {
		int isOk = bsv.delete(id);
		log.info(">>>> delete > {}", (isOk>0? "성공" : "실패"));

		return "redirect:/board/list";
	}
	
	@ResponseBody
	@DeleteMapping(value="/file/{uuid}/{bno}")
	public String fileDelete(@PathVariable("uuid") String uuid, @PathVariable("bno") long bno) {
		log.info(">>>> uuid > {}", uuid);
		// file table 데이터 삭제
		int isOk = bsv.deleteFile(uuid, bno);
		log.info(">>>> delete uuid > {}", (isOk>0? "성공" : "실패"));
		// 실제 폴더 내 파일 삭제
		
		return isOk>0? "1" : "0";
	}
	
	@ResponseBody
	@GetMapping(value="/isLike/{bno}/{uno}")
	public String isLike(@PathVariable("bno") long bno, @PathVariable("uno") long uno) {
		log.info(">>>> bno, uno > {},{}", bno, uno);
		int isOk = bsv.isLike(bno, uno);
		return isOk>0? "1" : "0";
	}
	
	@ResponseBody
	@GetMapping(value="/regLike/{bno}/{uno}")
	public String regLike(@PathVariable("bno") long bno, @PathVariable("uno") long uno) {
		int isOk = bsv.regLike(bno, uno);
		return isOk>0? "1" : "0";
	}
	
	@ResponseBody
	@GetMapping(value="/delLike/{bno}/{uno}")
	public String delLike(@PathVariable("bno") long bno, @PathVariable("uno") long uno) {
		int isOk = bsv.delLike(bno, uno);
		return isOk>0? "1" : "0";
	}
	
	
}
