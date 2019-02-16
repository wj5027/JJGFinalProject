package com.kh.tsp.admin.model.service;

import java.util.ArrayList;

import com.kh.tsp.admin.model.exception.CouponListException;
import com.kh.tsp.admin.model.exception.ParkingException;
import com.kh.tsp.admin.model.exception.SelectBoardListException;
import com.kh.tsp.admin.model.vo.CouponRequestList;
import com.kh.tsp.admin.model.vo.ParkingAdmin;
import com.kh.tsp.admin.model.vo.ParkingListAdmin;
import com.kh.tsp.common.PageInfo;
import com.kh.tsp.customer.model.vo.Board;

public interface ParkingAdminService {

	// 주차장 전체 수
	int getParkingListCount() throws ParkingException;
	
	// 주차장 전체 리스트
	ArrayList<ParkingListAdmin> selectParkingList(PageInfo pi) throws ParkingException;

	// 리스트 상세보기 ajax
	ParkingListAdmin detailParkingLot(ParkingListAdmin pl) throws ParkingException;

	// 승인 버튼
	int updateParkingLot(ParkingListAdmin pl) throws ParkingException;

	// 반송 버튼
	int updateReturnParkingLot(ParkingListAdmin pl) throws ParkingException;

	// 반송 사유 ajax
	ParkingListAdmin updateCancelReasonDetail(ParkingListAdmin pl) throws ParkingException;

	// 검색 수
	int getSearchListCount(String parkingListStatus, String memberId, String parkingAddress, String parkingListName, String today,
			String startDate, String endDate) throws ParkingException;

	// 검색 결과
	ArrayList<ParkingListAdmin> selectSearchParkingLotList(PageInfo pi, String parkingListStatus, String memberId, String parkingAddress,
			String parkingListName, String today, String startDate, String endDate) throws ParkingException;
	

}
