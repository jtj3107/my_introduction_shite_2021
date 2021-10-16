package com.jtj.exam.demo.service;

import org.springframework.stereotype.Service;

import com.jtj.exam.demo.repository.MemberRepository;
import com.jtj.exam.demo.vo.Member;

@Service
public class MemberService {

	private MemberRepository memberRepository;

	public MemberService(MemberRepository memberRepository) {
		this.memberRepository = memberRepository;
	}
	
	public Member getMemberById(int loginedMemberId) {
		// TODO Auto-generated method stub
		return null;
	}

	public Member getMemberByLoginId(String loginId) {
		return memberRepository.getMemberByLoginId(loginId);
	}

}
