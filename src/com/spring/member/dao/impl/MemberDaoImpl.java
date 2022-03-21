package com.spring.member.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.member.dao.MemberDao;
import com.spring.member.vo.MemberVo;

@Repository
public class MemberDaoImpl implements MemberDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int memberInsert(MemberVo memberVo) throws Exception {
		return sqlSession.insert("member.memberInsert", memberVo);
	}
	
}
