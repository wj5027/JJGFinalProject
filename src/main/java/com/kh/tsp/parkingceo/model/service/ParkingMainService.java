package com.kh.tsp.parkingceo.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.tsp.common.ParkingCeoPageInfo;

public interface ParkingMainService {

	int selectListCountInsertParkingSystemList(HashMap<String, Object> selectHmap);

	ArrayList<HashMap<String, Object>> selectSearchInsertParkingSystemList(HashMap<String, Object> selectHmap,
			ParkingCeoPageInfo pi);

	int selectListCountResParkingList(HashMap<String, Object> mybatisHmap);

	ArrayList<HashMap<String, Object>> selectSearchResParkingList(HashMap<String, Object> mybatisHmap, ParkingCeoPageInfo pi);

	void updateResComplete(int parseInt);

	void updateResCancel(int parseInt, String resCancelText);

	HashMap<String, Object> searchPakringSize(HashMap<String, Object> searchHmap);

	void insertEntryList(HashMap<String, Object> searchHashmap, String resultMemberNo, String resultResNo);

	HashMap<String, Object> selectNonMemberUseTime(HashMap<String, Object> searchData);

	HashMap<String, Integer> selectNonMemberParkingUseTimeAndPrice(String selectParkingBox);

	void updateNonMemberResultData(HashMap<String, Object> addResultData);

	HashMap<String, Object> selectNonMemberResultData(HashMap<String, Object> searchData);

	void plusNonMemberParkingLeftSize(HashMap<String, Object> searchData);







	







}
