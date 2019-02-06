package com.kh.tsp.admin.model.service;

import java.util.ArrayList;

import com.kh.tsp.admin.model.exception.ParkingCEOSelectListException;
import com.kh.tsp.admin.model.vo.MemberAdmin;
import com.kh.tsp.common.PageInfo;

public interface ParkingCEOService {

	// 사업자 수
	int getListCount() throws ParkingCEOSelectListException;

	// 사업자 리스트
	ArrayList<MemberAdmin> selectParkingCEOList(PageInfo pi) throws ParkingCEOSelectListException;

	// 회원 탈퇴
	int deleteParkingCEO(MemberAdmin md) throws ParkingCEOSelectListException;

	// 회원 복구
	int updateRecoverParkingCEO(MemberAdmin md) throws ParkingCEOSelectListException;
	
	// 사업자 검색 수
	int getSearchListCount(String selectStatus, String memberId, String today, String startDate, String endDate) throws ParkingCEOSelectListException;

	// 사업자 검색결과
	ArrayList<MemberAdmin> selectSearchParkingCEOList(PageInfo pi, String selectStatus, String memberId, String today,
			String startDate, String endDate) throws ParkingCEOSelectListException;


}
