package com.ezen.spring.service;

import java.util.List;

import com.ezen.spring.domain.AlertVO;
import com.ezen.spring.domain.UserDTO;
import com.ezen.spring.domain.UserVO;

public interface UserService {

	int register(UserVO uvo);

	List<AlertVO> getAlertList();

	List<UserVO> getUserList();

	UserDTO getUdto(long id);

}
