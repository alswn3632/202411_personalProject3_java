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
public class FileVO {
	/*
	create table file (
		uuid varchar(255) not null primary key,
		save_dir varchar(255) not null,
		file_name varchar(255) not null,
		board_id bigint,
		file_size bigint,
		reg_date datetime default now()
	);
	 */
	
	private String uuid;
	private String saveDir;
	private String fileName;
	private long boardId;
	private long fileSize;
	private String regDate;
	
}
