package com.kh.tsp.customer.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tsp.customer.model.dao.AccountDao;
import com.kh.tsp.customer.model.vo.Member;

@Service
public class AccountServiceImpl implements AccountService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private AccountDao ad;
	
	//내 정보 리스트
	@Override
	public Member selectMyInfo(Member m) {

		return ad.selectMyInfo(sqlSession, m);
	}
	//비밀번호 제외한 내 정보 수정
	@Override
	public int changeInfo(Member m) {

		return ad.changeInfo(sqlSession, m);
	}
	//비밀번호 포함한 내 정보 수정
	@Override
	public int changePwd(Member m) {

		return ad.changePwd(sqlSession, m);
	}

}
