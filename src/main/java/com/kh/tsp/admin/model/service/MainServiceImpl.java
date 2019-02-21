package com.kh.tsp.admin.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tsp.admin.model.dao.MainDao;
import com.kh.tsp.admin.model.exception.MainStatisticsException;
import com.kh.tsp.admin.model.vo.DateAdmin;

@Service
public class MainServiceImpl implements MainService{

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private MainDao md;

	// 올해 사용자 회원가입 수
	@Override
	public DateAdmin selectCustomerSignUpMonth() throws MainStatisticsException {
		DateAdmin da = md.selectCustomerSignUpMonth(sqlSession);
		return da;
	}

	// 최근 7일 사용자 회원가입 수
	@Override
	public DateAdmin selectCustomerSignUp7Days() throws MainStatisticsException {
		DateAdmin da = md.selectCustomerSignUp7Days(sqlSession);
		return da;
	}

	// 올해 사업자 회원가입 수
	@Override
	public DateAdmin selectCEOSignUpMonth() throws MainStatisticsException {
		DateAdmin da = md.selectCEOSignUpMonth(sqlSession);
		return da;
	}

	// 최근 7일 사업자 회원가입 수
	@Override
	public DateAdmin selectCEOSignUp7Days() throws MainStatisticsException {
		DateAdmin da = md.selectCEOSignUp7Days(sqlSession);
		return da;
	}
	

}
