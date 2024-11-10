package com.ezen.spring.dao;

import java.util.List;

import com.ezen.spring.domain.AuthVO;
import com.ezen.spring.domain.UserVO;

public interface UserDAO {

	int register(UserVO uvo);

	long getLastId();

	int registerAuthInit(long uno);

	UserVO selectName(String username);

	List<AuthVO> selectAuths(String username);

	int updateLastLogin(String authUsername);

	List<UserVO> getUserList();

}
