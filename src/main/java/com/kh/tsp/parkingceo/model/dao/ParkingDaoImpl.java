package com.kh.tsp.parkingceo.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.tsp.customer.model.vo.Member;

@Repository
public class ParkingDaoImpl implements ParkingDao{

	public ParkingDaoImpl() {
		// TODO Auto-generated constructor stub
	}

	//사업자 회원가입
	@Override
	public int insertParkingCeo(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("ParkingCeo.insertParkingCeo",m);
	}

	//쪽지함 리스트 카운트 메소드
	@Override
	public int selectInsertParkingListCount(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("ParkingCeo.selectInsertParkingListCount", m);
	}

	@Override
	public int exchangeParkingListCount(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("ParkingCeo.exchangeParkingListCount", m);
	}

	@Override
	public int insertCouponListCount(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("ParkingCeo.insertCouponListCount", m);
	}

	@Override
	public int insertExchangeMoneyListCount(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("ParkingCeo.insertExchangeMoneyListCount", m);
	}



}
