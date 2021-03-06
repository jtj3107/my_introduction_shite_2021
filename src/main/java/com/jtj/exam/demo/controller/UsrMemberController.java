package com.jtj.exam.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jtj.exam.demo.service.MemberService;
import com.jtj.exam.demo.util.Ut;
import com.jtj.exam.demo.vo.Member;
import com.jtj.exam.demo.vo.ResultData;
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
	
	@RequestMapping("/usr/member/doLogout")
	@ResponseBody
	public String doLogout() {
		if(!rq.isLogined()) {
			return rq.jsHistoryBack("이미 로그아웃 상태입니다.");
		}

		rq.logout();
		
		return rq.jsReplace("로그아웃 되었습니다.", "/");
	}
	
	@RequestMapping("/usr/member/join")
	public String showJoin() {
		return "usr/member/join";
	}
	
	@RequestMapping("/usr/member/doJoin")
	@ResponseBody
	public String doJoin(String loginId, String loginPwReal, String name, String nickname, String email, String cellphoneNo) {
		if(Ut.empty(loginId)) {
			return rq.jsHistoryBack("loginId(을)를 입력해주세요.");
		}
		
		if(Ut.empty(loginPwReal)) {
			return rq.jsHistoryBack("loginPw(을)를 입력해주세요.");
		}
		
		if(Ut.empty(name)) {
			return rq.jsHistoryBack("name(을)를 입력해주세요.");
		}
		
		if(Ut.empty(nickname)) {
			return rq.jsHistoryBack("nickname(을)를 입력해주세요.");
		}
		
		if(Ut.empty(email)) {
			return rq.jsHistoryBack("email(을)를 입력해주세요.");
		}
		
		if(Ut.empty(cellphoneNo)) {
			return rq.jsHistoryBack("cellphoneNo(을)를 입력해주세요.");
		}
		
		ResultData joinRd = memberService.join(loginId, loginPwReal, name, nickname, email, cellphoneNo);
		
		if(joinRd.isFail()) {
			return rq.jsHistoryBack(joinRd.getMsg());
		}
		
		return rq.jsReplace(joinRd.getMsg(), "../member/login");
	}
}
