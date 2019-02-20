package com.kh.tsp.parkingceo.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.tsp.common.ParkingCeoPageInfo;

public interface ParkingReservationDao {

	int selectResAllListCount(SqlSessionTemplate sqlSession, HashMap<String, Object> selectHmap);

	int selectResOkListCount(SqlSessionTemplate sqlSession, HashMap<String, Object> selectHmap);

	int selectResReadyListCount(SqlSessionTemplate sqlSession, HashMap<String, Object> selectHmap);

	int selectResCancelListCount(SqlSessionTemplate sqlSession, HashMap<String, Object> selectHmap);

	int selectResCompleteListCount(SqlSessionTemplate sqlSession, HashMap<String, Object> selectHmap);

	int selectResSelfCancelListCount(SqlSessionTemplate sqlSession, HashMap<String, Object> selectHmap);

	ArrayList<HashMap<String, Object>> selectResAllList(SqlSessionTemplate sqlSession,
			HashMap<String, Object> selectHmap, ParkingCeoPageInfo pi);

	ArrayList<HashMap<String, Object>> selectResOkList(SqlSessionTemplate sqlSession,
			HashMap<String, Object> selectHmap, ParkingCeoPageInfo pi);

	ArrayList<HashMap<String, Object>> selectResReadyList(SqlSessionTemplate sqlSession,
			HashMap<String, Object> selectHmap, ParkingCeoPageInfo pi);

	ArrayList<HashMap<String, Object>> selectResCancelList(SqlSessionTemplate sqlSession,
			HashMap<String, Object> selectHmap, ParkingCeoPageInfo pi);

	ArrayList<HashMap<String, Object>> selectResCompleteList(SqlSessionTemplate sqlSession,
			HashMap<String, Object> selectHmap, ParkingCeoPageInfo pi);

	ArrayList<HashMap<String, Object>> selectResSelfCancelList(SqlSessionTemplate sqlSession,
			HashMap<String, Object> selectHmap, ParkingCeoPageInfo pi);

}
