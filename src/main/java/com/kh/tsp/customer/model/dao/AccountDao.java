package com.kh.tsp.customer.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.tsp.customer.model.vo.Member;

public interface AccountDao {

	Member selectMyInfo(SqlSessionTemplate sqlSession, Member m);

	int changeInfo(SqlSessionTemplate sqlSession, Member m);

	int changePwd(SqlSessionTemplate sqlSession, Member m);

}
