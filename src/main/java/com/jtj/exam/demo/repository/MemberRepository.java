package com.jtj.exam.demo.repository;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.jtj.exam.demo.vo.Member;

@Mapper
public interface MemberRepository {

	@Select("""
			SELECT *
			FROM `member` AS M
			WHERE M.loginId = #{loginId}
			""")
	public Member getMemberByLoginId(String loginId);

	@Select("""
			SELECT *
			FROM `member` AS M
			WHERE M.id = #{id}
			""")
	public Member getMemberById(int id);

}
