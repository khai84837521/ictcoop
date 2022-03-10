package com.spring.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.board.dao.ComCodeDao;
import com.spring.board.service.comCodeService;
import com.spring.board.vo.ComCodeVo;

@Service
public class comCodeServiceImpl implements comCodeService{
	
	@Autowired
	ComCodeDao comCodeDao;

	@Override
	public List<ComCodeVo> SelectComCodeList() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("service pass");
		return comCodeDao.selectComCodeList();
	}
	
}
