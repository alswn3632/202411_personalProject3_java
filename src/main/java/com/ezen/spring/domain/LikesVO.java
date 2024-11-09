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
public class LikesVO {
	
	/*
	create table likes (
	    id bigint auto_increment primary key, 
	    board_id bigint,                         
	    user_id bigint
	);
	 */
	
	private long id;
	private long boardId;
	private long userId;
	
}
