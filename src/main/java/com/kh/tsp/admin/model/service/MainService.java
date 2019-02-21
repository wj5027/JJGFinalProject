package com.kh.tsp.admin.model.service;

import com.kh.tsp.admin.model.exception.MainStatisticsException;
import com.kh.tsp.admin.model.vo.DateAdmin;

public interface MainService {

	// 올해 사용자 회원가입 수
	DateAdmin selectCustomerSignUpMonth() throws MainStatisticsException;

	// 최근 7일 사용자 회원가입 수
	DateAdmin selectCustomerSignUp7Days() throws MainStatisticsException;

	// 올해 사업자 회원가입 수
	DateAdmin selectCEOSignUpMonth() throws MainStatisticsException;

	// 최근 7일 사업자 회원가입 수
	DateAdmin selectCEOSignUp7Days() throws MainStatisticsException;

}
