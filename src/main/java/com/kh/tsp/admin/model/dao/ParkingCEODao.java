package com.kh.tsp.admin.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.tsp.admin.model.exception.ParkingCEOSelectListException;
import com.kh.tsp.admin.model.exception.ParkingCEOSelectListException;
import com.kh.tsp.admin.model.vo.DateAdmin;
import com.kh.tsp.admin.model.vo.MemberAdmin;
import com.kh.tsp.admin.model.vo.OilListAdmin;
import com.kh.tsp.common.PageInfo;

public interface ParkingCEODao {

	// 사업자 수
	int getListCount(SqlSessionTemplate sqlSession) throws ParkingCEOSelectListException;

	// 사업자 리스트
	ArrayList<MemberAdmin> selectParkingCEOList(SqlSessionTemplate sqlSession, PageInfo pi) throws ParkingCEOSelectListException;

	// 회원 탈퇴
	int deleteParkingCEO(SqlSessionTemplate sqlSession, MemberAdmin md) throws ParkingCEOSelectListException;

	// 회원 복구
	int updateRecoverParkingCEO(SqlSessionTemplate sqlSession, MemberAdmin md) throws ParkingCEOSelectListException;

	// 사업자 검색 수
	int getSearchListCount(SqlSessionTemplate sqlSession, String selectStatus, String memberId, String today,
			String startDate, String endDate) throws ParkingCEOSelectListException;

	// 사업자 검색 결과
	ArrayList<MemberAdmin> selectSearchParkingCEOList(SqlSessionTemplate sqlSession, PageInfo pi, String selectStatus,
			String memberId, String today, String startDate, String endDate) throws ParkingCEOSelectListException;

	
	
	// 사업자 통계 전체 리스트 수
	int getStatisticsListCount(SqlSessionTemplate sqlSession) throws ParkingCEOSelectListException;

	// 사업자 통계 전체 리스트
	ArrayList<OilListAdmin> selectStatisticsCEOList(SqlSessionTemplate sqlSession, PageInfo pi) throws ParkingCEOSelectListException;

	// 충전 합계
	ArrayList<OilListAdmin> selectStatisticsCEOListNoPaging(SqlSessionTemplate sqlSession) throws ParkingCEOSelectListException;

	// 사업자 통계 검색 수
	int getSearchStatisticsCEOListCount(SqlSessionTemplate sqlSession, String selectStatus, String startMoney,
			String endMoney, String memberId, String today, String startDate, String endDate) throws ParkingCEOSelectListException;

	// 사업자 통계 검색 리스트
	ArrayList<OilListAdmin> selectSearchStatisticsCEOList(SqlSessionTemplate sqlSession, PageInfo pi,
			String selectStatus, String startMoney, String endMoney, String memberId, String today, String startDate,
			String endDate) throws ParkingCEOSelectListException;

	// 충전 합계 (검색)
	ArrayList<OilListAdmin> selectSearchStatisticsCEOList(SqlSessionTemplate sqlSession, String selectStatus,
			String startMoney, String endMoney, String memberId, String today, String startDate, String endDate) throws ParkingCEOSelectListException;

	// 통꼐 그래프 (월별)
	DateAdmin selectStatisticsMonth(SqlSessionTemplate sqlSession) throws ParkingCEOSelectListException;

	// 통계 리스트 (최근 7일)
	DateAdmin selectStatistics7Day(SqlSessionTemplate sqlSession) throws ParkingCEOSelectListException;

	// 통계 리스트 (최근 24시간)
	DateAdmin selectStatisticsToday(SqlSessionTemplate sqlSession) throws ParkingCEOSelectListException;

}
