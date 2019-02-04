package com.kh.tsp.parkingceo.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.tsp.customer.model.vo.Member;

public interface ParkingDao {

	int insertParkingCeo(SqlSessionTemplate sqlSession, Member m);

}
