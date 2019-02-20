package com.kh.tsp.admin.model.service;

import java.util.ArrayList;

import com.kh.tsp.admin.model.exception.ParkingCEOSelectListException;
import com.kh.tsp.admin.model.exception.ParkingCEOSelectListException;
import com.kh.tsp.admin.model.vo.DateAdmin;
import com.kh.tsp.admin.model.vo.MemberAdmin;
import com.kh.tsp.admin.model.vo.OilListAdmin;
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


	
	// 사업자 통계 리스트 수
	int getStatisticsListCount() throws ParkingCEOSelectListException;

	// 사업자 통계 리스트
	ArrayList<OilListAdmin> selectStatisticsCEOList(PageInfo pi) throws ParkingCEOSelectListException;

	// 충전 합계
	ArrayList<OilListAdmin> selectStatisticsCEOListNoPaging() throws ParkingCEOSelectListException;

	// 사업자 통계 검색 수
	int getSearchStatisticsCEOListCount(String selectStatus, String memberId, String startMoney, String endMoney,
			String today, String startDate, String endDate) throws ParkingCEOSelectListException;

	// 사업자 통계 검색 리스트
	ArrayList<OilListAdmin> selectSearchStatisticsCEOList(PageInfo pi, String selectStatus, String memberId,
			String startMoney, String endMoney, String today, String startDate, String endDate) throws ParkingCEOSelectListException;

	// 충전 합계 (검색)
	ArrayList<OilListAdmin> selectSearchStatisticsCEOList(String selectStatus, String memberId, String startMoney,
			String endMoney, String today, String startDate, String endDate) throws ParkingCEOSelectListException;

	// 통꼐 그래프 (월별)
	DateAdmin selectStatisticsMonth() throws ParkingCEOSelectListException;

	// 통꼐 그래프 (최근 7일)
	DateAdmin selectStatistics7Day() throws ParkingCEOSelectListException;

	// 통계 리스트 (최근 24시간)
	DateAdmin selectStatisticsToday() throws ParkingCEOSelectListException;
}
