package com.ezen.spring.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@AllArgsConstructor
@Setter
@Getter
public class PagingVO {
	
	//멤버변수
	// paging 기본 도구
	private int pageNo;
	private int qty;
	// search 변수 포함
	private String type;
	private String keyword;
	
	// 유저 정보를 위한
	private long userId;

	//생성자 - 초기값을 위한 임의 설정
	public PagingVO() {
		this.pageNo = 1;
		this.qty = 10;
	}
	
	public PagingVO(int pageNo, int qty) {
		this.pageNo = pageNo;
		this.qty = qty;
	}
	
	//메서드
	public int getPageStart() {
		// limit * , qty 에서 * 구하기
		return (this.pageNo-1)*this.qty;
	}
	
	public String[] getTypeToArray() {
		return this.type == null? new String[] {} : this.type.split("");
	}
	
}
