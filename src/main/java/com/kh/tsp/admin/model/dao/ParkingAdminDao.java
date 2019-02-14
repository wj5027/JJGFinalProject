package com.kh.tsp.admin.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.tsp.admin.model.exception.ParkingException;
import com.kh.tsp.admin.model.vo.ParkingListAdmin;
import com.kh.tsp.common.PageInfo;

public interface ParkingAdminDao {

	// 주차장 전체 수
	int getListCount(SqlSessionTemplate sqlSession) throws ParkingException;

	// 주차장 전체 리스트
	ArrayList<ParkingListAdmin> selectParkingList(SqlSessionTemplate sqlSession, PageInfo pi) throws ParkingException;

/*	// 쿠폰 전체 수
	int getListCount(SqlSessionTemplate sqlSession) throws CouponListException;

	// 쿠폰 전체 리스트
	ArrayList<CouponRequestList> selectCouponList(SqlSessionTemplate sqlSession, PageInfo pi) throws CouponListException;

	// 쿠폰 발급
	int updateCoupon(SqlSessionTemplate sqlSession, CouponRequestList crl) throws CouponListException;

	// 쿠폰 반송
	int deleteCoupon(SqlSessionTemplate sqlSession, CouponRequestList crl) throws CouponListException;

	// 반송 사유 ajax
	CouponRequestList selectRefuseReason(SqlSessionTemplate sqlSession, CouponRequestList c) throws CouponListException;

	// 쿠폰 검색 수
	int getSearchListCount(SqlSessionTemplate sqlSession, String selectStatus, String selectCoupon, String memberId,
			String parkingName) throws CouponListException;

	// 쿠폰 검색 결과
	ArrayList<CouponRequestList> selectSearchCouponList(SqlSessionTemplate sqlSession, PageInfo pi, String selectStatus,
			String selectCoupon, String memberId, String parkingName) throws CouponListException;
*/
}
