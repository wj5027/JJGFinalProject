package com.kh.tsp.parkingceo.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.tsp.customer.model.vo.Member;

public interface ParkingDao {

	int insertParkingCeo(SqlSessionTemplate sqlSession, Member m);

	int selectInsertParkingListCount(SqlSessionTemplate sqlSession, Member m);

	int exchangeParkingListCount(SqlSessionTemplate sqlSession, Member m);

	int insertCouponListCount(SqlSessionTemplate sqlSession, Member m);

	int insertExchangeMoneyListCount(SqlSessionTemplate sqlSession, Member m);


}
