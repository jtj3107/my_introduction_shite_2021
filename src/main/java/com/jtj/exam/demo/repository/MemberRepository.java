package com.jtj.exam.demo.repository;

import org.apache.ibatis.annotations.Insert;
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

	@Select("""
			SELECT *
			FROM `member` AS M
			WHERE 1
			AND M.name = #{name}
			AND M.email = #{email}
			""")
	public Member getMemberByNameAndEmail(String name, String email);

	@Insert("""
			INSERT INTO `member`
			SET regDate = NOW(),
			updateDate = NOW(),
			loginId = #{loginId},
			loginPw = #{loginPw},
			`name` = #{name},
			nickname = #{nickname},
			email = #{email},
			cellphoneNo = #{cellphoneNo}
			""")
	public int join(String loginId, String loginPw, String name, String nickname, String email, String cellphoneNo);

}
