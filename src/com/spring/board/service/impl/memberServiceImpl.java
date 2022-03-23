package com.spring.board.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.board.dao.MemberDao;
import com.spring.board.service.memberService;
import com.spring.board.vo.MemberVo;


@Service
public class memberServiceImpl implements memberService{

	@Autowired
	MemberDao memberDao;
	
	@Override
	public int insertMember(MemberVo memberVo) throws Exception{
		// TODO Auto-generated method stub
		return memberDao.memberInsert(memberVo);
	}

	@Override
	public MemberVo userInfo(MemberVo memberVo) throws Exception {
		// TODO Auto-generated method stub
		return memberDao.userInfo(memberVo);
	}

	
}
