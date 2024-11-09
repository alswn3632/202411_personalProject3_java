package com.ezen.spring.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
public class UserVO {
	
	/*
	create table user (
	    id bigint auto_increment primary key,   
	    username varchar(100) not null unique,
	    password varchar(255) not null,       
	    email varchar(255),     
	    nickname varchar(100),            
	    reg_date datetime default now(),
		log_date datetime default now()
	); 
	 */
	
	private long id;
	private String username;
	private String password;
	private String email;
	private String nickname;
	private String regDate;
	private String logDate;
	
	private List<AuthVO> authList;

	
}
