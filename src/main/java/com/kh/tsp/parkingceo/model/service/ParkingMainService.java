package com.kh.tsp.parkingceo.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.tsp.common.ParkingCeoPageInfo;
import com.kh.tsp.customer.model.vo.Member;

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

	Member selectNomalMemberInformation(HashMap<String, Object> selectHmap);

	HashMap<String, Object> selectNomalMemberMemberNo(HashMap<String, Object> member_idHmap);

	HashMap<String, Object> selectNomalMemberUseTiems(HashMap<String, Object> selectHmap);

	void updateNomalMemberCurrentPayment(HashMap<String, Object> data);

	HashMap<String, Object> selectSearchNomalMemberPoint(HashMap<String, Object> selectHmap);

	void updateNomalMemberPointPayment(HashMap<String, Object> data);

	void updateNomalMemberOil(HashMap<String, Object> data);

	HashMap<String, Object> searchResInformation(HashMap<String, Object> selectHmap);

	HashMap<String, Object> searchOutResInformation(HashMap<String, Object> selectHmap);

	void updateResMemberCurrentPayment(HashMap<String, Object> data);

	void updateResMemberEntryList(HashMap<String, Object> data);

	void updateResMemberOil(HashMap<String, Object> data);

	void updateResMemberParkingLeftSize(HashMap<String, Object> data);

	void AddNomalPointToPakringCeo(HashMap<String, Object> data);

	Member selectCheckMember(HashMap<String, Object> data);

	void updateCompleteResOil(HashMap<String, Object> data);

	void updateCancelResPoint(HashMap<String, Object> data);









	







}
