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



}
