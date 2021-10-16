package com.jtj.exam.demo.service;

import org.springframework.stereotype.Service;

import com.jtj.exam.demo.repository.MemberRepository;
import com.jtj.exam.demo.vo.Member;
import com.jtj.exam.demo.vo.ResultData;

@Service
public class MemberService {

	private MemberRepository memberRepository;

	public MemberService(MemberRepository memberRepository) {
		this.memberRepository = memberRepository;
	}
	
	public Member getMemberById(int id) {
		return memberRepository.getMemberById(id);
	}

	public Member getMemberByLoginId(String loginId) {
		return memberRepository.getMemberByLoginId(loginId);
	}

	public ResultData join(String loginId, String loginPw, String name, String nickname, String email,
			String cellphoneNo) {
		Member member = getMemberByLoginId(loginId);
		
		if(member != null) {
			return new ResultData("F-1", "이미 존재하는 로그인 아이디 입니다.");
		}
		
		Member oldMeber = getMemberByNameAndEmail(name, email);
		
		if(oldMeber != null) {
			return new ResultData("F-2", "이미 존재하는 회원정보 입니다.");
		}
		
		int id = memberRepository.join(loginId, loginPw, name, nickname, email, cellphoneNo);
		
		return new ResultData("S-1", "회원가입이 완료되었습니다.", "id", id);
	}

	private Member getMemberByNameAndEmail(String name, String email) {
		return memberRepository.getMemberByNameAndEmail(name, email);
	}

}
