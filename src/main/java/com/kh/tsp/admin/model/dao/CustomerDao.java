package com.kh.tsp.admin.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.tsp.admin.model.exception.CustomerSelectListException;
import com.kh.tsp.admin.model.vo.DateAdmin;
import com.kh.tsp.admin.model.vo.MemberAdmin;
import com.kh.tsp.admin.model.vo.OilListAdmin;
import com.kh.tsp.common.PageInfo;

public interface CustomerDao {

	// 사용자 수
	int getListCount(SqlSessionTemplate sqlSession) throws CustomerSelectListException;

	// 사용자 리스트
	ArrayList<MemberAdmin> selectCustomerList(SqlSessionTemplate sqlSession, PageInfo pi) throws CustomerSelectListException;

	// 회원 탈퇴
	int deleteCustomer(SqlSessionTemplate sqlSession, MemberAdmin md) throws CustomerSelectListException;

	// 회원 복구
	int updateRecoverCustomer(SqlSessionTemplate sqlSession, MemberAdmin md) throws CustomerSelectListException;

	// 사용자 검색 수
	int getSearchListCount(SqlSessionTemplate sqlSession, String selectStatus, String memberId, String today,
			String startDate, String endDate) throws CustomerSelectListException;

	// 사용자 검색 결과
	ArrayList<MemberAdmin> selectSearchCustomerList(SqlSessionTemplate sqlSession, PageInfo pi, String selectStatus,
			String memberId, String today, String startDate, String endDate) throws CustomerSelectListException;

	
	
	// 사용자 통계 전체 리스트 수
	int getStatisticsListCount(SqlSessionTemplate sqlSession) throws CustomerSelectListException;

	// 사용자 통계 전체 리스트
	ArrayList<OilListAdmin> selectStatisticsCustomerList(SqlSessionTemplate sqlSession, PageInfo pi) throws CustomerSelectListException;

	// 충전 합계
	ArrayList<OilListAdmin> selectStatisticsCustomerListNoPaging(SqlSessionTemplate sqlSession) throws CustomerSelectListException;

	// 사용자 통계 검색 수
	int getSearchStatisticsCustomerListCount(SqlSessionTemplate sqlSession, String selectStatus, String startMoney,
			String endMoney, String memberId, String today, String startDate, String endDate) throws CustomerSelectListException;

	// 사용자 통계 검색 리스트
	ArrayList<OilListAdmin> selectSearchStatisticsCustomerList(SqlSessionTemplate sqlSession, PageInfo pi,
			String selectStatus, String startMoney, String endMoney, String memberId, String today, String startDate,
			String endDate) throws CustomerSelectListException;

	// 충전 합계 (검색)
	ArrayList<OilListAdmin> selectSearchStatisticsCustomerList(SqlSessionTemplate sqlSession, String selectStatus,
			String startMoney, String endMoney, String memberId, String today, String startDate, String endDate) throws CustomerSelectListException;

	// 통꼐 그래프 (월별)
	DateAdmin selectStatisticsMonth(SqlSessionTemplate sqlSession) throws CustomerSelectListException;

	// 통계 리스트 (최근 7일)
	DateAdmin selectStatistics7Day(SqlSessionTemplate sqlSession) throws CustomerSelectListException;

	// 통계 리스트 (최근 24시간)
	DateAdmin selectStatisticsToday(SqlSessionTemplate sqlSession) throws CustomerSelectListException;

}
