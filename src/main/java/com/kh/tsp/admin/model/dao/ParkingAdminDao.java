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

	// 리스트 상세보기 ajax
	ParkingListAdmin detailParkingLot(SqlSessionTemplate sqlSession, ParkingListAdmin pl) throws ParkingException;

	// 승인 버튼
	int updateParkingLot(SqlSessionTemplate sqlSession, ParkingListAdmin pl) throws ParkingException;

	// 반송 버튼
	int updateReturnParkingLot(SqlSessionTemplate sqlSession, ParkingListAdmin pl) throws ParkingException;

	// 반송 사유 ajax
	ParkingListAdmin updateCancelReasonDetail(SqlSessionTemplate sqlSession, ParkingListAdmin pl) throws ParkingException;

	// 검색 수
	int getSearchListCount(SqlSessionTemplate sqlSession, String parkingListStatus, String memberId, String parkingAddress,
			String parkingListName, String today, String startDate, String endDate) throws ParkingException;

	// 검색 결과
	ArrayList<ParkingListAdmin> selectSearchParkingLotList(SqlSessionTemplate sqlSession, PageInfo pi, String parkingListStatus, String memberId,
			String parkingAddress, String parkingListName, String today, String startDate, String endDate) throws ParkingException;

	// 삭제 버튼
	int deleteRemoveParkingLot(SqlSessionTemplate sqlSession, ParkingListAdmin pl) throws ParkingException;

}
