package com.kh.tsp.customer.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.tsp.customer.model.vo.Member;

public interface CustomerMainDao {

	Member selectCheckMember(SqlSessionTemplate sqlSession, Member m);

}
