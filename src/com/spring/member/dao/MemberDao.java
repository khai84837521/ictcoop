package com.spring.member.dao;

import com.spring.member.vo.MemberVo;

public interface MemberDao {
	public int memberInsert(MemberVo memberVo) throws Exception;
}
