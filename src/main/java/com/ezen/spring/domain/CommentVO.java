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
public class CommentVO {
	/*
	create table comment (
	    id bigint auto_increment primary key,    
	    board_id bigint,   
	    user_id bigint,       
	    writer varchar(100) not null,                                                      
	    content text not null,               
	    parent_id bigint,                
	    reg_date datetime default now(),
	    is_del varchar(5) default 'N'
	);
	 */
	
	private long id;
	private long boardId;
	private long userId;
	private String writer;
	private String content;
	private long parentId;
	private String regDate;
	private String isDel;

}
