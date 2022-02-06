package kr.or.ddasum.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.or.ddasum.member.model.vo.Member;

@Repository
public class MemberDAO {

	@Autowired
	@Qualifier(value="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	public Member memberLogin(Member member) {

		return sqlSession.selectOne("member.memberLogin", member);
		
	}

	public int memberInfoUpdate(Member m) {

		return sqlSession.update("member.memberInfoUpdate",m);
		
	}
}
