package com.spring.board.vo;

public class PageVo {
	
	private int pageNo = 0;
	private String[] typeChk;

	public String[] getTypeChk() {
		return typeChk;
	}

	public void setTypeChk(String[] typeChk) {
		this.typeChk = typeChk;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	
}
