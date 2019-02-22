package com.kh.tsp.admin.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tsp.admin.model.dao.MainDao;
import com.kh.tsp.admin.model.exception.MainStatisticsException;
import com.kh.tsp.admin.model.vo.DateAdmin;

@Service
public class MainServiceImpl implements MainService{

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private MainDao md;
	
	///////////////////////////////////////// 회원 ///////////////////////////////////
	// 전체 사용자 회원 수 
	@Override
	public int getCustomerListCount() throws MainStatisticsException {
		int customerListCount = md.getCustomerListCount(sqlSession);
		return customerListCount;
	}

	// 전체 사업자 회원 수 
	@Override
	public int getCeoListCount() throws MainStatisticsException {
		int ceoListCount = md.getCeoListCount(sqlSession);
		return ceoListCount;
	}

	// 올해 사용자 회원가입 수
	@Override
	public DateAdmin selectCustomerSignUpMonth() throws MainStatisticsException {
		DateAdmin da = md.selectCustomerSignUpMonth(sqlSession);
		return da;
	}

	// 최근 7일 사용자 회원가입 수
	@Override
	public DateAdmin selectCustomerSignUp7Days() throws MainStatisticsException {
		DateAdmin da = md.selectCustomerSignUp7Days(sqlSession);
		return da;
	}

	// 올해 사업자 회원가입 수
	@Override
	public DateAdmin selectCEOSignUpMonth() throws MainStatisticsException {
		DateAdmin da = md.selectCEOSignUpMonth(sqlSession);
		return da;
	}

	// 최근 7일 사업자 회원가입 수
	@Override
	public DateAdmin selectCEOSignUp7Days() throws MainStatisticsException {
		DateAdmin da = md.selectCEOSignUp7Days(sqlSession);
		return da;
	}

	//////////////////////////////////// 게시판 /////////////////////////////////////////
	// 관리자문의 게시판 수
	@Override
	public int getBoardAdminListCount() throws MainStatisticsException {
		int boardAdminListCount = md.getBoardAdminListCount(sqlSession);
		return boardAdminListCount;
	}

	// 사업자문의 게시판 수
	@Override
	public int getBoardCeoListCount() throws MainStatisticsException {
		int boardCeoListCount = md.getBoardCeoListCount(sqlSession);
		return boardCeoListCount;
	}

	// 후기 게시판 수
	@Override
	public int getBoardReplyListCount() throws MainStatisticsException {
		int boardReplyListCount = md.getBoardReplyListCount(sqlSession);
		return boardReplyListCount;
	}

	// 올해 관리자문의 수
	@Override
	public DateAdmin selectBoardAdminMonth() throws MainStatisticsException {
		DateAdmin da = md.selectBoardAdminMonth(sqlSession);
		return da;
	}

	// 최근 7일 관리자문의 수
	@Override
	public DateAdmin selectBoardAdmin7Days() throws MainStatisticsException {
		DateAdmin da = md.selectBoardAdmin7Days(sqlSession);
		return da;
	}

	// 올해 사업자문의 수
	@Override
	public DateAdmin selectBoardCeoMonth() throws MainStatisticsException {
		DateAdmin da = md.selectBoardCeoMonth(sqlSession);
		return da;
	}

	// 최근 7일 사업자문의 수
	@Override
	public DateAdmin selectBoardCeo7Days() throws MainStatisticsException {
		DateAdmin da = md.selectBoardCeo7Days(sqlSession);
		return da;
	}

	// 올해 후기 수
	@Override
	public DateAdmin selectBoardReplyMonth() throws MainStatisticsException {
		DateAdmin da = md.selectBoardReplyMonth(sqlSession);
		return da;
	}

	// 최근 7일 후기 수
	@Override
	public DateAdmin selectBoardReply7Days() throws MainStatisticsException {
		DateAdmin da = md.selectBoardReply7Days(sqlSession);
		return da;
	}

	//////////////////////////////////// 오늘 현황 /////////////////////////////////////////
	// 환불신청
	@Override
	public int getRequestRefundListCount() throws MainStatisticsException {
		int requestRefundListCount = md.getRequestRefundListCount(sqlSession);
		return requestRefundListCount;
	}

	// 환전신청
	@Override
	public int getRequestExchangeListCount() throws MainStatisticsException {
		int requestExchangeListCount = md.getRequestExchangeListCount(sqlSession);
		return requestExchangeListCount;
	}

	// 사용자 회원가입 수 
	@Override
	public int getTodayCustomerListCount() throws MainStatisticsException {
		int todayCustomerListCount = md.getTodayCustomerListCount(sqlSession);
		return todayCustomerListCount;
	}

	// 사업자 회원가입 수
	@Override
	public int getTodayCeoListCount() throws MainStatisticsException {
		int todayCeoListCount = md.getTodayCeoListCount(sqlSession);
		return todayCeoListCount;
	}

	// 주차장 신청
	@Override
	public int getRequestParkingLotListCount() throws MainStatisticsException {
		int requestParkingLotListCount = md.getRequestParkingLotListCount(sqlSession);
		return requestParkingLotListCount;
	}

	// 매출
	@Override
	public int getProfit() throws MainStatisticsException {
		int profit = md.getProfit(sqlSession);
		return profit;
	}

	// 사업자문의 게시판
	@Override
	public int getTodayBoardCeo() throws MainStatisticsException {
		int todayBoardCeo = md.getTodayBoardCeo(sqlSession);
		return todayBoardCeo;
	}

	// 관리자문의 게시판
	@Override
	public int getTodayBoardAdmin() throws MainStatisticsException {
		int todayBoardAdmin = md.getTodayBoardAdmin(sqlSession);
		return todayBoardAdmin;
	}

}
