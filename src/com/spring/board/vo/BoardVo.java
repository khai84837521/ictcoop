package com.spring.board.vo;

import java.util.List;

public class BoardVo {
	
	private String boardType;
	private int 	boardNum;
	private String boardTitle;
	private String boardComment;
	private String 	creator;
	private String	modifier;
	private int totalCnt;
	private String codeName;
	
	//게시판 다중 insert
	private String[] boardTypeArr;
	private String[] boardTitleArr;
	private String[] boardCommentArr;
	
	private List<BoardVo> boardVoList;
	
	public List<BoardVo> getBoardVoList() {
		return boardVoList;
	}
	public void setBoardVoList(List<BoardVo> boardVoList) {
		this.boardVoList = boardVoList;
	}
	
	
	public String[] getBoardTypeArr() {
		return boardTypeArr;
	}
	public void setBoardTypeArr(String[] boardTypeArr) {
		this.boardTypeArr = boardTypeArr;
	}
	public String[] getBoardTitleArr() {
		return boardTitleArr;
	}
	public void setBoardTitleArr(String[] boardTitleArr) {
		this.boardTitleArr = boardTitleArr;
	}
	public String[] getBoardCommentArr() {
		return boardCommentArr;
	}
	public void setBoardCommentArr(String[] boardCommentArr) {
		this.boardCommentArr = boardCommentArr;
	}
	public String getBoardType() {
		return boardType;
	}
	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardComment() {
		return boardComment;
	}
	public void setBoardComment(String boardComment) {
		this.boardComment = boardComment;
	}
	public String getCodeName() {
		return codeName;
	}
	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}
	public int getTotalCnt() {
		return totalCnt;
	}
	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}

	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
	public String getModifier() {
		return modifier;
	}
	public void setModifier(String modifier) {
		this.modifier = modifier;
	}
	
	
}
