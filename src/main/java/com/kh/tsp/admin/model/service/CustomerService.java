package com.kh.tsp.admin.model.service;

import java.util.ArrayList;

import com.kh.tsp.admin.model.exception.CustomerSelectListException;
import com.kh.tsp.admin.model.vo.DateAdmin;
import com.kh.tsp.admin.model.vo.MemberAdmin;
import com.kh.tsp.admin.model.vo.OilListAdmin;
import com.kh.tsp.common.PageInfo;

public interface CustomerService {

	// 사용자 수
	int getListCount() throws CustomerSelectListException;

	// 사용자 리스트
	ArrayList<MemberAdmin> selectCustomerList(PageInfo pi) throws CustomerSelectListException;

	// 회원 탈퇴
	int deleteCustomer(MemberAdmin md) throws CustomerSelectListException;

	// 회원 복구
	int updateRecoverCustomer(MemberAdmin md) throws CustomerSelectListException;
	
	// 사용자 검색 수
	int getSearchListCount(String selectStatus, String memberId, String today, String startDate, String endDate) throws CustomerSelectListException;

	// 사용자 검색결과
	ArrayList<MemberAdmin> selectSearchCustomerList(PageInfo pi, String selectStatus, String memberId, String today,
			String startDate, String endDate) throws CustomerSelectListException;

	
	// 사용자 통계 리스트 수
	int getStatisticsListCount() throws CustomerSelectListException;

	// 사용자 통계 리스트
	ArrayList<OilListAdmin> selectStatisticsCustomerList(PageInfo pi) throws CustomerSelectListException;

	// 충전 합계
	ArrayList<OilListAdmin> selectStatisticsCustomerListNoPaging() throws CustomerSelectListException;

	// 사용자 통계 검색 수
	int getSearchStatisticsCustomerListCount(String selectStatus, String memberId, String startMoney, String endMoney,
			String today, String startDate, String endDate) throws CustomerSelectListException;

	// 사용자 통계 검색 리스트
	ArrayList<OilListAdmin> selectSearchStatisticsCustomerList(PageInfo pi, String selectStatus, String memberId,
			String startMoney, String endMoney, String today, String startDate, String endDate) throws CustomerSelectListException;

	// 충전 합계 (검색)
	ArrayList<OilListAdmin> selectSearchStatisticsCustomerList(String selectStatus, String memberId, String startMoney,
			String endMoney, String today, String startDate, String endDate) throws CustomerSelectListException;

	// 통꼐 그래프 (월별)
	DateAdmin selectStatisticsMonth() throws CustomerSelectListException;

	// 통꼐 그래프 (최근 7일)
	DateAdmin selectStatistics7Day() throws CustomerSelectListException;

	// 통계 리스트 (최근 24시간)
	DateAdmin selectStatisticsToday() throws CustomerSelectListException;


}
