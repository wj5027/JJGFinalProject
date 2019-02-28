package com.kh.tsp.parkingceo.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.tsp.common.ParkingCeoPageInfo;
import com.kh.tsp.customer.model.vo.Member;

public interface ParkingMainDao {

	int selectListCountInsertParkingSystemList(SqlSessionTemplate sqlSession, HashMap<String, Object> selectHmap);

	ArrayList<HashMap<String, Object>> selectSearchInsertParkingSystemList(SqlSessionTemplate sqlSession,
			HashMap<String, Object> selectHmap, ParkingCeoPageInfo pi);

	int selectListCountResParkingList(SqlSessionTemplate sqlSession, HashMap<String, Object> selectParkingBox);

	ArrayList<HashMap<String, Object>> selectSearchResParkingList(SqlSessionTemplate sqlSession,
			HashMap<String, Object> selectParkingBox, ParkingCeoPageInfo pi);

	void updateResComplete(SqlSessionTemplate sqlSession, int completeResNo);

	void updateResCancel(SqlSessionTemplate sqlSession, int completeResNo);

	void updateResCancel(SqlSessionTemplate sqlSession, int completeResNo, String resCancelText);

	HashMap<String, Object> searchPakringSize(SqlSessionTemplate sqlSession,
			HashMap<String, Object> searchHmap);

	void insertNonMemberEntryList(SqlSessionTemplate sqlSession, HashMap<String, Object> searchHashmap);

	void insertNomalMemberEntryList(SqlSessionTemplate sqlSession, HashMap<String, Object> searchHashmap);

	int searchMemberNo(HashMap<String, Object> searchHashmap);

	void insertResMemberEntryList(SqlSessionTemplate sqlSession, HashMap<String, Object> searchHashmap);

	void updateLeftSize(SqlSessionTemplate sqlSession, HashMap<String, Object> searchHashmap);

	void updateNonMemberTimes(SqlSessionTemplate sqlSession,HashMap<String, Object> searchData);

	HashMap<String, Object> selectNonMemberUseTime(SqlSessionTemplate sqlSession,HashMap<String, Object> searchData);

	HashMap<String, Integer> selectNonMemberParkingUseTimeAndPrice(SqlSessionTemplate sqlSession, String selectParkingBox);

	void updateNonMemberResultData(SqlSessionTemplate sqlSession, HashMap<String, Object> addResultData);

	HashMap<String, Object> selectNonMemberResultData(SqlSessionTemplate sqlSession,
			HashMap<String, Object> searchData);

	void plusNonMemberParkingLeftSize(SqlSessionTemplate sqlSession, HashMap<String, Object> searchData);

	Member selectNomalMemberInformation(SqlSessionTemplate sqlSession, HashMap<String, Object> selectHmap);



	






}
