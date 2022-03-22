package com.spring.member.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.member.service.memberService;
import com.spring.member.vo.MemberVo;


@Controller
public class MemberController {

	@Autowired
	memberService memberService;
	
	@RequestMapping(value = "/member/join.do", method = RequestMethod.GET)
	public String memberJoin(MemberVo memberVo) throws Exception{

		return "member/join";
	}
	
	
	
	@RequestMapping(value = "/member/joinAction.do", method = RequestMethod.POST)
	public String memberJoinAction(MemberVo memberVo) throws Exception{

//		System.out.println(memberVo.getUserId());
		
		int resultCnt = memberService.insertMember(memberVo);
		
		return "redirect:/board/boardList.do";
	}
}
