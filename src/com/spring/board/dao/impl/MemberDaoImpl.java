package com.spring.board.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.board.dao.MemberDao;
import com.spring.board.vo.MemberVo;


@Repository
public class MemberDaoImpl implements MemberDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int memberInsert(MemberVo memberVo) throws Exception {
		return sqlSession.insert("member.memberInsert", memberVo);
	}

	@Override
	public MemberVo userInfo(MemberVo memberVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.userInfo", memberVo);
	}
	
	
	
}
