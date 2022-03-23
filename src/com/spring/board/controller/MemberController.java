package com.spring.board.controller;


import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.board.service.memberService;
import com.spring.board.vo.MemberVo;



@Controller
public class MemberController {

	@Autowired
	memberService memberService;
	
	@RequestMapping(value = "/member/join.do", method = RequestMethod.GET)
	public String memberJoin(MemberVo memberVo) throws Exception{

		return "member/join";
	}
	
	
	@RequestMapping(value = "/member/idCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public int idCheck(MemberVo memberVo) throws Exception{
		// data가  0이면 중복x 1이면 중복o
		
		
		int data = 0;
		
		memberVo = memberService.userInfo(memberVo);
		
		if (memberVo != null ) {
			data = 1;
		}
		
		
		return data;
	}
	
	
	
	@RequestMapping(value = "/member/joinAction.do", method = RequestMethod.POST)
	public String memberJoinAction(MemberVo memberVo) throws Exception{

//		System.out.println(memberVo.getUserId());
		
		int resultCnt = memberService.insertMember(memberVo);
		
		return "redirect:/board/boardList.do";
	}
	
	
	@RequestMapping(value = "/member/login.do", method = RequestMethod.GET)
	public String login(MemberVo memberVo) throws Exception{

		return "member/login";
	}
	
	
	@RequestMapping(value = "/member/loginAction.do", method = RequestMethod.POST)
	public String loginAction(MemberVo memberVo, Model model, HttpSession session) throws Exception{
		String loginPw = memberVo.getUserPw();
		memberVo = memberService.userInfo(memberVo);
		
		if (memberVo != null) {
			if(loginPw.equals(memberVo.getUserPw()) ) {
				session.setAttribute("user", memberVo);
				return "redirect:/board/boardList.do";
			}else {
				model.addAttribute("msg", "아이디 또는 비밀번호가 일치하지 않습니다");
				model.addAttribute("url", "/member/login.do");
				return "board/msgbox";
			}
		}else {
			model.addAttribute("msg", "아이디 또는 비밀번호가 일치하지 않습니다");
			model.addAttribute("url", "/member/login.do");
			return "board/msgbox";
		}
		
	}
	
	
	@RequestMapping(value = "/member/logOut.do", method = RequestMethod.GET)
	public String logOut(Model model, HttpSession session) throws Exception{
		session.invalidate();
		model.addAttribute("msg", "로그아웃을 완료했습니다.");
		model.addAttribute("url", "/board/boardList.do");
		
		return "board/msgbox";
		
	}
	
}
