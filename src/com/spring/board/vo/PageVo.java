package com.spring.board.vo;

public class PageVo {
	//현재 페이지
	private int pageNo = 0;
	//시작 페이지
	private int startPage;
	//끝페이지
	private int endPage;
	//한번에 표시할 페이지 개수
	private int displayPageNum;
	//한페이지당 표시할 글 개수
	private int postsPerPage;
	//모든 글 개수 
	private int totlaPosts;
	
	private boolean prev;
	private boolean next;
	
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
