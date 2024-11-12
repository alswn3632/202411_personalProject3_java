package com.ezen.spring.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezen.spring.domain.AlertVO;
import com.ezen.spring.domain.PagingVO;
import com.ezen.spring.domain.UserDTO;
import com.ezen.spring.domain.UserVO;
import com.ezen.spring.handler.PagingHandler;
import com.ezen.spring.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/user/*")
@Controller
public class UserController {
	
	private final UserService usv;
	private final BCryptPasswordEncoder bcEncoder;

	@GetMapping("/register")
	public void register() {
		
	}
	
	@PostMapping("/register")
	public String register(UserVO uvo) {
		log.info(">>>> UserVO uvo > {}", uvo);
		
		// encode : 암호화
		uvo.setPassword(bcEncoder.encode(uvo.getPassword()));
		int isOk = usv.register(uvo);
		
		return "redirect:/";
	}
	
	@GetMapping("/login")
	public void login() {
		
	}
	
	@PostMapping("/login")
	public String login(HttpServletRequest request, RedirectAttributes re/*모델처럼 addAttribute 가능*/) {
		// 실제 로그인은 Security의 필터에서 가져감.
		// 로그인 실패시 다시 로그인 페이지로 돌아와서 오류 메세지를 출력하도록 하거나
		// 재로그인을 유도하기 위한 작업
		log.info(">>>> errMsg > {}", request.getAttribute("errMsg").toString());
		re.addAttribute("username", request.getAttribute("username"));
		re.addAttribute("errMsg", request.getAttribute("errMsg"));
		return "redirect:/user/login";
	}
	
	@GetMapping("/dashboard")
	public void dashboard() {
		
	}
	
	@GetMapping("/list")
	public void list(Model m) {
		List<UserVO> list = usv.getUserList();
		m.addAttribute("list", list);
	}
	
	@GetMapping("/alert")
	public void alert(Model m) {
		List<AlertVO> arList = usv.getAlertList();
		m.addAttribute("arList", arList);
	}
	
	@GetMapping("/detail")
	public void detail(Model m, PagingVO pgvo) {
		
//		pgvo.setPageNo(pageNo);
//		pgvo.setQty(qty);
//		pgvo.setUserId(id);
		pgvo.setQty(6);
		
		UserDTO udto = usv.getUdto(pgvo);
		
		int totalCount = usv.getUserTotal(pgvo);
		PagingHandler ph = new PagingHandler(totalCount, pgvo);
		m.addAttribute("udto", udto);
		m.addAttribute("ph", ph);
	}
	
	@GetMapping({"/modify", "/modifyPwd"})
	public void modify(long id, Model m) {
		log.info(">>>> userId > {}", id);
		
		UserVO uvo = usv.getUser(id);		
		m.addAttribute("uvo", uvo);
	}
	
	@PostMapping("/update")
	public void update(UserVO uvo) {
		log.info(">>>> uvo > {}", uvo);
	}
	
	@ResponseBody
	@GetMapping("/check/{username}")
	public String check(@PathVariable("username") String username) {
		log.info(">>>> username > {}", username);
		// file table 데이터 삭제
		int isOk = usv.check(username);
		// 실제 폴더 내 파일 삭제
		
		return isOk>0? "1" : "0";
	}

	
	@PostMapping("/modify")
	public String modify(UserVO uvo, HttpServletRequest request, HttpServletResponse response, RedirectAttributes re) {
		log.info(">>>> modify uvo > {}", uvo);
		int isOk = usv.modify(uvo);
		// 회원 정보 수정 후 로그아웃?
		if(isOk>0) {
			re.addFlashAttribute("modify_msg", "ok");			
		}else {
			re.addFlashAttribute("modify_msg", "fail");						
		}
		logout(request, response);
		return "redirect:/";
	}
	
	@PostMapping("/modifyPwd")
	public String modifyPwd(UserVO uvo, HttpServletRequest request, HttpServletResponse response, RedirectAttributes re) {
		uvo.setPassword(bcEncoder.encode(uvo.getPassword()));
		int isOk = usv.modifyPwd(uvo);
		
		// 회원 정보 수정 후 로그아웃?
		if(isOk>0) {
			re.addFlashAttribute("modifyPwd_msg", "ok");			
		}else {
			re.addFlashAttribute("modifyPwd_msg", "fail");						
		}
		logout(request, response);
		return "redirect:/";
	}
	
	private void logout(HttpServletRequest request, HttpServletResponse response) {
		// 내가 로그인 한 시큐리티의 authentication 객체
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		new SecurityContextLogoutHandler().logout(request, response, authentication);
	}
	

}
