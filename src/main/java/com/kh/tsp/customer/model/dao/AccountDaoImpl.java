package com.kh.tsp.customer.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.tsp.customer.model.vo.Member;

@Repository
public class AccountDaoImpl implements AccountDao{
	public AccountDaoImpl() {
		//기본 생성자
	}

	//내 정보 리스트
	@Override
	public Member selectMyInfo(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectOne("Member.selectMyInfo", m);
	}
	//비밀번호 제외한 정보 수정
	@Override
	public int changeInfo(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.update("Member.changeInfo", m);
	}
	//비밀번호 포함한 정보 수정
	@Override
	public int changePwd(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.update("Member.changePwd", m);
	}

	@Override
	public Member getRefreshMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("Member.getRefreshMember", m);
	}

}
