package com.ezen.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezen.spring.domain.AlertVO;
import com.ezen.spring.domain.UserVO;
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

}
