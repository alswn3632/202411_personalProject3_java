package com.ezen.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.spring.domain.BoardVO;
import com.ezen.spring.domain.PagingVO;
import com.ezen.spring.domain.handler.PagingHandler;
import com.ezen.spring.service.BoardService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/board/*")
@Controller
public class BoardController {
	
	private final BoardService bsv;

	@GetMapping("/register")
	public void register() {
		
	}
	
	@PostMapping("/insert")
	public String insert(BoardVO bvo) {
		log.info(">>>> bvo > {}", bvo);
		int isOk = bsv.insert(bvo);
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
		
		int totalCount = bsv.getTotal(pgvo);
		PagingHandler ph = new PagingHandler(totalCount, pgvo);
		
		m.addAttribute("list", list);
		m.addAttribute("ph", ph);
		
		return "/board/list";
	}
	
	@GetMapping({"/detail","/modify"})
	public void detail(HttpServletRequest request, Model m, int id) {
		String path = request.getServletPath();
		BoardVO bvo = bsv.getDetail(id);
		m.addAttribute("bvo", bvo);
	}
	
	@PostMapping("/update")
	public String update(BoardVO bvo) {
		int isOk = bsv.update(bvo);
		log.info(">>>> update > {}", (isOk>0? "성공" : "실패"));

		return "redirect:/board/detail?id=" + bvo.getId();
	}
	
	@GetMapping("/delete")
	public String delete(int id) {
		int isOk = bsv.delete(id);
		log.info(">>>> delete > {}", (isOk>0? "성공" : "실패"));

		return "redirect:/board/list";
	}
}
