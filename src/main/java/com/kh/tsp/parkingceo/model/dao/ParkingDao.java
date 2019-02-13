package com.kh.tsp.parkingceo.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.tsp.common.ParkingCeoPageInfo;
import com.kh.tsp.customer.model.vo.Member;

public interface ParkingDao {

	int insertParkingCeo(SqlSessionTemplate sqlSession, Member m);

	int selectParkingListCount(SqlSessionTemplate sqlSession, Member m);

	int exchangeParkingListCount(SqlSessionTemplate sqlSession, Member m);

	int selectCouponListCount(SqlSessionTemplate sqlSession, Member m);

	int selectExchangeMoneyListCount(SqlSessionTemplate sqlSession, Member m);

	ArrayList<HashMap<String, Object>> selectParkingList(SqlSessionTemplate sqlSession, ParkingCeoPageInfo pi,
			Member m);

	ArrayList<HashMap<String, Object>> selectExchangeParkingList(SqlSessionTemplate sqlSession, ParkingCeoPageInfo pi,
			Member m);

	ArrayList<HashMap<String, Object>> selectCouponList(SqlSessionTemplate sqlSession, ParkingCeoPageInfo pi, Member m);

	ArrayList<HashMap<String, Object>> selectExchangeMoneyList(SqlSessionTemplate sqlSession, ParkingCeoPageInfo pi,
			Member m);

	int selectInputCarListCount(SqlSessionTemplate sqlSession);

	int selectOutputCarListCount(SqlSessionTemplate sqlSession);

	int selectInputOutputCarListCount(SqlSessionTemplate sqlSession);

	ArrayList<HashMap<String, Object>> selectSearchParkingInputDetailList(SqlSessionTemplate sqlSession,
			ParkingCeoPageInfo pi);

	ArrayList<HashMap<String, Object>> selectSearchParkingOutputDetailList(SqlSessionTemplate sqlSession,
			ParkingCeoPageInfo pi);

	ArrayList<HashMap<String, Object>> selectSearchParkingInputOutputDetailList(SqlSessionTemplate sqlSession,
			ParkingCeoPageInfo pi);






}
