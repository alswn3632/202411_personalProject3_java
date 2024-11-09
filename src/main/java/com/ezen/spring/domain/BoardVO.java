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
public class BoardVO {
	/*
	create table board (
	    id bigint auto_increment primary key,   
	    title varchar(255) not null,           
	    content text not null, 
	    writer varchar(100) not null,                               
	    user_id bigint,                      
	    reg_date datetime default now(),
	    is_del varchar(5) default 'N' 
	); 
	alter table board add comm_qty bigint default 0;
	alter table board add like_qty bigint default 0;
	alter table board add read_qty bigint default 0;
	alter table board add has_file int default 0;
	 */
	
	private long id;
	private String title;
	private String content;
	private String writer;
	private long userId;
	private String regDate;
	private String isDel;
	private long commQty;
	private long likeQty;
	private long readQty;
	private int hasFile;
	
}
