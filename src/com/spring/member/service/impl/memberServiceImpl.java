package com.spring.member.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.member.dao.MemberDao;
import com.spring.member.service.memberService;
import com.spring.member.vo.MemberVo;

@Service
public class memberServiceImpl implements memberService{

	@Autowired
	MemberDao memberDao;
	
	@Override
	public int insertMember(MemberVo memberVo) throws Exception{
		// TODO Auto-generated method stub
		return memberDao.memberInsert(memberVo);
	}

}
