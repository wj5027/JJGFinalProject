package com.kh.tsp.customer.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tsp.customer.model.dao.CustomerMainDao;
import com.kh.tsp.customer.model.vo.Member;
import com.kh.tsp.customer.model.vo.Parking;

@Service
public class CustomerMainServiceImpl implements CustomerMainService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private CustomerMainDao cmd;
	
	
	
	public CustomerMainServiceImpl() {
		// 기본 생성자
	}

	@Override
	public Member selectCheckMember(Member m) {
		
		return cmd.selectCheckMember(sqlSession,m);
	}

	@Override
	public ArrayList<Parking> getnearParkings() {
		return cmd.selectnearParkings(sqlSession);
	}
	
	
	

}
