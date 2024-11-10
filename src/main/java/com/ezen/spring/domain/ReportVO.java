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
public class ReportVO {

	/*
	create table report (
	    id bigint auto_increment primary key,    
	    board_id bigint not null,                    
	    user_id bigint not null,               
	    reason text not null,          
	    reg_date datetime default now(),
	    status varchar(20) default 'pending'
	);
	 */
	
	private long id;
	private long boardId;
	private long userId;
	private String reason;
	private String regDate;
	private String status;
	
}
