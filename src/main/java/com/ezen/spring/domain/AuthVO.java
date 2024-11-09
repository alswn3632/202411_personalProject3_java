package com.ezen.spring.domain;

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
public class AuthVO {
	
	/*
	create table auth (
		id bigint auto_increment primary key,
		user_id bigint not null,
		auth varchar(100) not null
	);
	 */
	
	private long id;
	private long userId;
	private String auth;
	
}
