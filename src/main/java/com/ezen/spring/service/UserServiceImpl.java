package com.ezen.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ezen.spring.dao.ReportDAO;
import com.ezen.spring.dao.UserDAO;
import com.ezen.spring.domain.AlertVO;
import com.ezen.spring.domain.UserVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class UserServiceImpl implements UserService{
	
	private final UserDAO udao;
	private final ReportDAO rdao;

	@Transactional
	@Override
	public int register(UserVO uvo) {
		// 1. user 테이블에 정보 insert
		int isOk = udao.register(uvo);
		// 2. 성공했다면..
		if(isOk>0) {
			// 가장 마지막 id 값 가져와서
			long uno = udao.getLastId();
			// 3. auth 테이블에 권한과 함께 저장
			isOk *= udao.registerAuthInit(uno);	
		}
		
		return isOk;
	}

	@Override
	public List<AlertVO> getAlertList() {
		// TODO Auto-generated method stub
		return rdao.getAlertList();
	}

	@Override
	public List<UserVO> getUserList() {
		// TODO Auto-generated method stub
		return udao.getUserList();
	}


}
