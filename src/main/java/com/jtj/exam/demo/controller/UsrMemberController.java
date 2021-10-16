package com.jtj.exam.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jtj.exam.demo.service.MemberService;
import com.jtj.exam.demo.util.Ut;
import com.jtj.exam.demo.vo.Member;
import com.jtj.exam.demo.vo.Rq;

@Controller
public class UsrMemberController {
	private Rq rq;
	private MemberService memberService;

	public UsrMemberController(MemberService memberService, Rq rq) {
		this.memberService = memberService;
		this.rq = rq;
	}
	@RequestMapping("/usr/member/login")
	public String showLogin() {
		return "usr/member/login";
	}
	
	@RequestMapping("/usr/member/doLogin")
	@ResponseBody
	public String doLogin(String loginId, String loginPwReal) {
		if(Ut.empty(loginId)) {
			return rq.jsHistoryBack("loginId(을)를 입력해주세요.");
		}
		
		if(Ut.empty(loginPwReal)) {
			return rq.jsHistoryBack("loginPw(을)를 입력해주세요.");
		}
		
		Member member = memberService.getMemberByLoginId(loginId);
		
		if(member == null) {
			return rq.jsHistoryBack("존재하지 않는 로그인 아이디 입니다.");
		}
		
		if(member.getLoginPw().equals(loginPwReal) == false) {
			return rq.jsHistoryBack("비밀번호가 일치하지 않습니다.");
		}
		
		rq.login(member);
		return rq.jsReplace(Ut.f("%s님 환영합니다.", member.getNickname()), "/");
	}
	
}
