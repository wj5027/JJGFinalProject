package com.kh.tsp.admin.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.tsp.admin.model.exception.MainStatisticsException;
import com.kh.tsp.admin.model.vo.DateAdmin;

public interface MainDao {
	// 전체 사용자 회원 수 
	int getCustomerListCount(SqlSessionTemplate sqlSession) throws MainStatisticsException;

	// 전체 사업자 회원 수 
	int getCeoListCount(SqlSessionTemplate sqlSession) throws MainStatisticsException;

	// 올해 사용자 회원가입 수
	DateAdmin selectCustomerSignUpMonth(SqlSessionTemplate sqlSession) throws MainStatisticsException;

	// 최근 7일 사용자 회원가입 수
	DateAdmin selectCustomerSignUp7Days(SqlSessionTemplate sqlSession) throws MainStatisticsException;

	// 올해 사업자 회원가입 수
	DateAdmin selectCEOSignUpMonth(SqlSessionTemplate sqlSession) throws MainStatisticsException;

	// 최근 7일 사업자 회원가입 수
	DateAdmin selectCEOSignUp7Days(SqlSessionTemplate sqlSession) throws MainStatisticsException;

	// 관리자문의 게시판 수
	int getBoardAdminListCount(SqlSessionTemplate sqlSession) throws MainStatisticsException;

	// 사업자문의 게시판 수
	int getBoardCeoListCount(SqlSessionTemplate sqlSession) throws MainStatisticsException;

	// 후기 게시판 수
	int getBoardReplyListCount(SqlSessionTemplate sqlSession) throws MainStatisticsException;

	// 올해 관리자문의 수
	DateAdmin selectBoardAdminMonth(SqlSessionTemplate sqlSession) throws MainStatisticsException;

	// 최근 7일 관리자문의 수
	DateAdmin selectBoardAdmin7Days(SqlSessionTemplate sqlSession) throws MainStatisticsException;

	// 올해 사업자문의 수
	DateAdmin selectBoardCeoMonth(SqlSessionTemplate sqlSession) throws MainStatisticsException;

	// 최근 7일 사업자문의 수
	DateAdmin selectBoardCeo7Days(SqlSessionTemplate sqlSession) throws MainStatisticsException;

	// 올해 후기 수
	DateAdmin selectBoardReplyMonth(SqlSessionTemplate sqlSession) throws MainStatisticsException;

	// 최근 7일 후기 수
	DateAdmin selectBoardReply7Days(SqlSessionTemplate sqlSession) throws MainStatisticsException;

	// 올해 주차장 예약 수
	DateAdmin selectParkingReservationMonth(SqlSessionTemplate sqlSession) throws MainStatisticsException;

	// 최근 7일 주차장 예약 수
	DateAdmin selectParkingReservation7Days(SqlSessionTemplate sqlSession) throws MainStatisticsException;
	
	// 환불신청
	int getRequestRefundListCount(SqlSessionTemplate sqlSession) throws MainStatisticsException;

	// 환전신청
	int getRequestExchangeListCount(SqlSessionTemplate sqlSession) throws MainStatisticsException;

	// 사용자 회원가입 수 
	int getTodayCustomerListCount(SqlSessionTemplate sqlSession) throws MainStatisticsException;

	// 사업자 회원가입 수
	int getTodayCeoListCount(SqlSessionTemplate sqlSession) throws MainStatisticsException;

	// 주차장 신청
	int getRequestParkingLotListCount(SqlSessionTemplate sqlSession) throws MainStatisticsException;

	// 매출
	int getProfit(SqlSessionTemplate sqlSession) throws MainStatisticsException;

	// 사업자문의 게시판
	int getTodayBoardCeo(SqlSessionTemplate sqlSession) throws MainStatisticsException;

	// 관리자문의 게시판
	int getTodayBoardAdmin(SqlSessionTemplate sqlSession) throws MainStatisticsException;

	// 회원 주차장 예약 건수
	int getParkingReservationListCount(SqlSessionTemplate sqlSession) throws MainStatisticsException;

	// 환전
	int getExchangeListCount(SqlSessionTemplate sqlSession) throws MainStatisticsException;

	// 매출
	int getIncomeListCount(SqlSessionTemplate sqlSession) throws MainStatisticsException;


}
