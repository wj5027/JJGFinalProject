package com.kh.tsp.parkingceo.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.tsp.common.ParkingCeoPageInfo;

public interface ParkingMainDao {

	int selectListCountInsertParkingSystemList(SqlSessionTemplate sqlSession, HashMap<String, Object> selectHmap);

	ArrayList<HashMap<String, Object>> selectSearchInsertParkingSystemList(SqlSessionTemplate sqlSession,
			HashMap<String, Object> selectHmap, ParkingCeoPageInfo pi);

	int selectListCountResParkingList(SqlSessionTemplate sqlSession, HashMap<String, Object> selectParkingBox);

	ArrayList<HashMap<String, Object>> selectSearchResParkingList(SqlSessionTemplate sqlSession,
			HashMap<String, Object> selectParkingBox, ParkingCeoPageInfo pi);



}
