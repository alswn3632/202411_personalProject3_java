package com.ezen.spring.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ezen.spring.domain.CommentVO;
import com.ezen.spring.domain.PagingVO;
import com.ezen.spring.domain.handler.PagingHandler;
import com.ezen.spring.service.CommentService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/comment/*")
@RestController
public class CommentController {
	
	private final CommentService csv;
	
	@PostMapping("/post")
	public ResponseEntity<String> post(@RequestBody CommentVO cvo) {
		log.info(">>>> post cvo > {}", cvo);
		int isOk = csv.post(cvo);
		
		if(isOk>0) {
			return new ResponseEntity<String>("1", HttpStatus.OK);			
		}else {
			return new ResponseEntity<String>("0", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@GetMapping(value="/{boardId}/{page}", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<PagingHandler> list(@PathVariable("boardId") long boardId, @PathVariable("page") int page){
		PagingVO pgvo = new PagingVO(page, 5);
		PagingHandler ph = csv.getList(boardId, pgvo);
		return new ResponseEntity<PagingHandler>(ph, HttpStatus.OK);
	}
	
	@ResponseBody
	@PutMapping("/modify")
	public String modify(@RequestBody CommentVO cvo) {
		int isOk = csv.modify(cvo);
		return isOk>0? "1" : "0";
	}
	
	@ResponseBody
	@DeleteMapping(value="/{id}")
	public String delete(@PathVariable("id") long id) {
		int isOk = csv.delete(id);
		return isOk>0? "1" : "0";
	}
	
	@ResponseBody
	@GetMapping(value="/listAns",  produces = MediaType.APPLICATION_JSON_VALUE)
	public List<CommentVO> listAns(long cno) {
		List<CommentVO> cmtList = csv.getListAns(cno);
		log.info(">>>> cmtList > {}", cmtList);
		return cmtList;
	}
}
