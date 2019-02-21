package com.kh.tsp.admin.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.tsp.admin.model.exception.MainStatisticsException;
import com.kh.tsp.admin.model.vo.DateAdmin;

public interface MainDao {

	// 올해 사용자 회원가입 수
	DateAdmin selectCustomerSignUpMonth(SqlSessionTemplate sqlSession) throws MainStatisticsException;

	// 최근 7일 사용자 회원가입 수
	DateAdmin selectCustomerSignUp7Days(SqlSessionTemplate sqlSession) throws MainStatisticsException;

	// 올해 사업자 회원가입 수
	DateAdmin selectCEOSignUpMonth(SqlSessionTemplate sqlSession) throws MainStatisticsException;

	// 최근 7일 사업자 회원가입 수
	DateAdmin selectCEOSignUp7Days(SqlSessionTemplate sqlSession) throws MainStatisticsException;

}
