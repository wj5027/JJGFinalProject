package com.kh.tsp.customer.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.tsp.customer.model.vo.Member;

@Repository
public class CustomerMainDaoImpl implements CustomerMainDao {

	public CustomerMainDaoImpl() {
		// 기본 생성자
	}

	@Override
	public Member selectCheckMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("Member.selectCheckMember",m);
	}

}
