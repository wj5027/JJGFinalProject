package com.kh.tsp.parkingceo.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.tsp.customer.model.vo.Member;

@Repository
public class ParkingDaoImpl implements ParkingDao{

	public ParkingDaoImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public int insertParkingCeo(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("ParkingCeo.insertParkingCeo",m);
	}

}
