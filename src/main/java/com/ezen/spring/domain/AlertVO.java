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
public class AlertVO {

	/*
	create table alert (
	    id bigint auto_increment primary key,      
	    alert_msg text not null,                 
	    reg_date datetime default now(),
	    board_id bigint,                     
	    status varchar(20) default 'pending'
	);
	 */
	
	private long id;
	private String alertMsg;
	private String regDate;
	private long boardId;
	private String status;
	
}
