package com.spring.board.dao;

import com.spring.board.vo.MemberVo;

public interface MemberDao {
	public int memberInsert(MemberVo memberVo) throws Exception;
	
	public MemberVo userInfo(MemberVo memberVo) throws Exception;
}
