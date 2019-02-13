package com.kh.tsp.parkingceo.model.service;

import java.util.HashMap;

import com.kh.tsp.common.ParkingCeoPageInfo;
import com.kh.tsp.customer.model.vo.Member;

public interface ParkingService {

	int insertParkingCeo(Member m);

	int selectNoteListCount(String selectBox, Member m);

	HashMap<String, Object> selectNoteList(String selectBox, ParkingCeoPageInfo pi, Member m);

	int selectSearchParkingDetailListCount(String selectBox);

	HashMap<String, Object> selectSearchParkingDetailList(String selectBox, ParkingCeoPageInfo pi);

	

}
