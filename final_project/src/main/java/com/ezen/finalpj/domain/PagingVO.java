package com.ezen.finalpj.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PagingVO {
	private int pageNo;
	private int qty;
	
	public PagingVO() {
		this(1,5);
	}
	public PagingVO(int pageNo) {
		this.pageNo=pageNo;
		this.qty=5;
	}
	public PagingVO(int pageNo,int qty) {
		this.pageNo=pageNo;
		this.qty=qty;
	}
	public int getPageStart() {
		return (this.pageNo-1)*qty;
	}
}
