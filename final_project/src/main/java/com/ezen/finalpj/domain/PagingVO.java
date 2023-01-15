package com.ezen.finalpj.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class PagingVO {
	private int pageNo;
	private int qty;
	
	private String type;
	private String keyword;
	
	public PagingVO() {
		this(1,8);
	}
	
	public PagingVO(int pageNo) {
		this.pageNo=pageNo;
		this.qty=5;
	}
	
	public PagingVO(int pageNo, int qty) {
		this.pageNo = pageNo;
		this.qty = qty;
	}
	
	public int getPageStart() {
		return (this.pageNo -1)*qty;
	}
	
	public String[] getTypeToArray() {
		return this.type == null ? new String[] {} : this.type.split("");
	}

}
