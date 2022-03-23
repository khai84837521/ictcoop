package com.spring.board.service;

import com.spring.board.vo.MemberVo;

public interface memberService {
	public int insertMember(MemberVo memberVo) throws Exception;
	
	public MemberVo userInfo(MemberVo memberVo) throws Exception;
}
