package com.kh.tsp.admin.model.service;

import com.kh.tsp.admin.model.exception.MainStatisticsException;
import com.kh.tsp.admin.model.vo.DateAdmin;

public interface MainService {

	// 전체 사용자 회원가입 수 
	int getCustomerListCount() throws MainStatisticsException;

	// 전체 사업자 회원가입 수 
	int getCeoListCount() throws MainStatisticsException;

	// 올해 사용자 회원가입 수
	DateAdmin selectCustomerSignUpMonth() throws MainStatisticsException;

	// 최근 7일 사용자 회원가입 수
	DateAdmin selectCustomerSignUp7Days() throws MainStatisticsException;

	// 올해 사업자 회원가입 수
	DateAdmin selectCEOSignUpMonth() throws MainStatisticsException;

	// 최근 7일 사업자 회원가입 수
	DateAdmin selectCEOSignUp7Days() throws MainStatisticsException;

	// 관리자문의 게시판 수
	int getBoardAdminListCount() throws MainStatisticsException;

	// 사업자문의 게시판 수
	int getBoardCeoListCount() throws MainStatisticsException;

	// 후기 게시판 수
	int getBoardReplyListCount() throws MainStatisticsException;

	// 올해 관리자문의 수
	DateAdmin selectBoardAdminMonth() throws MainStatisticsException;

	// 최근 7일 관리자문의 수
	DateAdmin selectBoardAdmin7Days() throws MainStatisticsException;

	// 올해 사업자문의 수
	DateAdmin selectBoardCeoMonth() throws MainStatisticsException;

	// 최근 7일 사업자문의 수
	DateAdmin selectBoardCeo7Days() throws MainStatisticsException;

	// 올해 후기 수
	DateAdmin selectBoardReplyMonth() throws MainStatisticsException;

	// 최근 7일 후기 수
	DateAdmin selectBoardReply7Days() throws MainStatisticsException;

	// 환불신청
	int getRequestRefundListCount() throws MainStatisticsException;
	
	// 환전신청
	int getRequestExchangeListCount() throws MainStatisticsException;

	// 사용자 회원가입 수 
	int getTodayCustomerListCount() throws MainStatisticsException;

	// 사업자 회원가입 수
	int getTodayCeoListCount() throws MainStatisticsException;

	// 주차장 신청
	int getRequestParkingLotListCount() throws MainStatisticsException;

	// 매출
	int getProfit() throws MainStatisticsException;

	// 사업자문의 게시판
	int getTodayBoardCeo() throws MainStatisticsException;

	// 관리자문의 게시판
	int getTodayBoardAdmin() throws MainStatisticsException;
}
