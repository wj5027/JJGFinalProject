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
	
/*	// 쿠폰 전체 수
	int getCouponListCount() throws CouponListException;

	// 쿠폰 전체 리스트
	ArrayList<CouponRequestList> selectCouponList(PageInfo pi) throws CouponListException;

	// 쿠폰 발급
	int updateCoupon(CouponRequestList crl) throws CouponListException;

	// 쿠폰 반송
	int deleteCoupon(CouponRequestList crl) throws CouponListException;

	// 반송 사유 ajax
	CouponRequestList selectRefuseReason(CouponRequestList c) throws CouponListException;

	// 쿠폰 검색 수
	int getSearchListCount(String selectStatus, String selectCoupon, String memberId, String parkingName) throws CouponListException;

	// 쿠폰 검색 결과
	ArrayList<CouponRequestList> selectSearchCouponList(PageInfo pi, String selectStatus, String selectCoupon,
			String memberId, String parkingName) throws CouponListException;*/

}
