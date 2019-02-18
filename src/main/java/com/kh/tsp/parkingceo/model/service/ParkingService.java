package com.kh.tsp.parkingceo.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.tsp.common.ParkingCeoPageInfo;
import com.kh.tsp.customer.model.vo.Member;
import com.kh.tsp.parkingceo.model.vo.ParkingCeoAttachmentVo;
import com.kh.tsp.parkingceo.model.vo.ParkingCeoParkingListVo;
import com.kh.tsp.parkingceo.model.vo.ParkingCeoVo;

public interface ParkingService {

	int insertParkingCeo(Member m);

	int selectNoteListCount(String selectBox, Member m);

	HashMap<String, Object> selectNoteList(String selectBox, ParkingCeoPageInfo pi, Member m);

	int selectSearchParkingDetailListCount(String inOutputSelectBox, String parkingSelectBox);

	HashMap<String, Object> selectSearchParkingDetailList(String selectBox, ParkingCeoPageInfo pi,String parkingSelectBox);

	void insertParkingOne(ParkingCeoVo parking, ArrayList<ParkingCeoAttachmentVo> attachList);

	ParkingCeoParkingListVo selectSearchParkingOne(ParkingCeoVo parking);

	

}
