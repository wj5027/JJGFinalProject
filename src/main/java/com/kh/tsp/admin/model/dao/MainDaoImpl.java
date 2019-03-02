package com.kh.tsp.admin.model.dao;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.tsp.admin.model.exception.MainStatisticsException;
import com.kh.tsp.admin.model.exception.ParkingCEOSelectListException;
import com.kh.tsp.admin.model.exception.SelectBoardListException;
import com.kh.tsp.admin.model.exception.ParkingCEOSelectListException;
import com.kh.tsp.admin.model.vo.DateAdmin;
import com.kh.tsp.admin.model.vo.MemberAdmin;
import com.kh.tsp.admin.model.vo.OilListAdmin;
import com.kh.tsp.common.PageInfo;

@Repository
public class MainDaoImpl  implements MainDao{

	///////////////////////////////////////// 회원 ///////////////////////////////////
	// 전체 사용자 회원 수 
	@Override
	public int getCustomerListCount(SqlSessionTemplate sqlSession) throws MainStatisticsException {
		int customerListCount = sqlSession.selectOne("MainAdmin.getCustomerListCount");
		return customerListCount;
	}

	// 전체 사업자 회원 수 
	@Override
	public int getCeoListCount(SqlSessionTemplate sqlSession) throws MainStatisticsException {
		int ceoListCount = sqlSession.selectOne("MainAdmin.getCeoListCount");
		return ceoListCount;
	}

	// 올해 사용자 회원가입 수
	@Override
	public DateAdmin selectCustomerSignUpMonth(SqlSessionTemplate sqlSession) throws MainStatisticsException {
		
		DateAdmin da = sqlSession.selectOne("MainAdmin.selectCustomerSignUpMonth");
		
		if(da == null) {
			throw new MainStatisticsException("올해 사용자 회원가입 수 조회 실패");
		}
		return da;
	}

	// 최근 7일 사용자 회원가입 수
	@Override
	public DateAdmin selectCustomerSignUp7Days(SqlSessionTemplate sqlSession) throws MainStatisticsException {
		
		DateAdmin da = sqlSession.selectOne("MainAdmin.selectCustomerSignUp7Days");
		
		if(da == null) {
			throw new MainStatisticsException("최근 7알 사용자 회원가입 수 조회 실패");
		}
		return da;
	}

	// 올해 사용자 회원가입 수
	@Override
	public DateAdmin selectCEOSignUpMonth(SqlSessionTemplate sqlSession) throws MainStatisticsException {
		
		DateAdmin da = sqlSession.selectOne("MainAdmin.selectCEOSignUpMonth");
		
		if(da == null) {
			throw new MainStatisticsException("올해 사업자 회원가입 수 조회 실패");
		}
		return da;
	}

	// 최근 7일 사용자 회원가입 수
	@Override
	public DateAdmin selectCEOSignUp7Days(SqlSessionTemplate sqlSession) throws MainStatisticsException {
		
		DateAdmin da = sqlSession.selectOne("MainAdmin.selectCEOSignUp7Days");
		
		if(da == null) {
			throw new MainStatisticsException("최근 7알 사업자 회원가입 수 조회 실패");
		}
		return da;
	}

	//////////////////////////////////// 게시판 /////////////////////////////////////////
	// 관리자문의 게시판 수
	@Override
	public int getBoardAdminListCount(SqlSessionTemplate sqlSession) throws MainStatisticsException {
		int boardAdminListCount = sqlSession.selectOne("MainAdmin.getBoardAdminListCount");
		return boardAdminListCount;
	}

	// 사업자문의 게시판 수
	@Override
	public int getBoardCeoListCount(SqlSessionTemplate sqlSession) throws MainStatisticsException {
		int boardCeoListCount = sqlSession.selectOne("MainAdmin.getBoardCeoListCount");
		return boardCeoListCount;
	}

	// 후기 게시판 수
	@Override
	public int getBoardReplyListCount(SqlSessionTemplate sqlSession) throws MainStatisticsException {
		int boardReplyListCount = sqlSession.selectOne("MainAdmin.getBoardReplyListCount");
		return boardReplyListCount;
	}

	// 회원 주차장 예약 건수
	@Override
	public int getParkingReservationListCount(SqlSessionTemplate sqlSession) throws MainStatisticsException {
		int parkingReservationListCount = sqlSession.selectOne("MainAdmin.getParkingReservationListCount");
		return parkingReservationListCount;
	}

	// 올해 관리자문의 수
	@Override
	public DateAdmin selectBoardAdminMonth(SqlSessionTemplate sqlSession) throws MainStatisticsException {
		
		DateAdmin da = sqlSession.selectOne("MainAdmin.selectBoardAdminMonth");
		
		if(da == null) {
			throw new MainStatisticsException("올해 관리자문의 수 조회 실패");
		}
		return da;
	}

	// 최근 7일 관리자문의 수
	@Override
	public DateAdmin selectBoardAdmin7Days(SqlSessionTemplate sqlSession) throws MainStatisticsException {
		
		DateAdmin da = sqlSession.selectOne("MainAdmin.selectBoardAdmin7Days");
		
		if(da == null) {
			throw new MainStatisticsException("최근 7알 관리자문의 수 조회 실패");
		}
		return da;
	}

	// 올해 사업자문의 수
	@Override
	public DateAdmin selectBoardCeoMonth(SqlSessionTemplate sqlSession) throws MainStatisticsException {
		
		DateAdmin da = sqlSession.selectOne("MainAdmin.selectBoardCeoMonth");
		
		if(da == null) {
			throw new MainStatisticsException("올해 사업자문의 수 조회 실패");
		}
		return da;
	}

	// 최근 7일 사업자문의 수
	@Override
	public DateAdmin selectBoardCeo7Days(SqlSessionTemplate sqlSession) throws MainStatisticsException {
		
		DateAdmin da = sqlSession.selectOne("MainAdmin.selectBoardCeo7Days");
		
		if(da == null) {
			throw new MainStatisticsException("최근 7일 사업자문의 수 조회 실패");
		}
		return da;
	}

	// 올해 후기 수
	@Override
	public DateAdmin selectBoardReplyMonth(SqlSessionTemplate sqlSession) throws MainStatisticsException {
		
		DateAdmin da = sqlSession.selectOne("MainAdmin.selectBoardReplyMonth");
		
		if(da == null) {
			throw new MainStatisticsException("올해 후기 수 조회 실패");
		}
		return da;
	}

	// 최근 7일 후기 수
	@Override
	public DateAdmin selectBoardReply7Days(SqlSessionTemplate sqlSession) throws MainStatisticsException {
		
		DateAdmin da = sqlSession.selectOne("MainAdmin.selectBoardReply7Days");
		
		if(da == null) {
			throw new MainStatisticsException("최근 7일 후기 수 조회 실패");
		}
		return da;
	}


	//////////////////////////////////// 오늘 현황 /////////////////////////////////////////
	// 환불신청
	@Override
	public int getRequestRefundListCount(SqlSessionTemplate sqlSession) throws MainStatisticsException {
		int result = sqlSession.selectOne("MainAdmin.getRequestRefundListCount");
		return result;
	}

	// 환전신청
	@Override
	public int getRequestExchangeListCount(SqlSessionTemplate sqlSession) throws MainStatisticsException {
		int result = sqlSession.selectOne("MainAdmin.getRequestExchangeListCount");
		return result;
	}

	// 사용자 회원가입 수 
	@Override
	public int getTodayCustomerListCount(SqlSessionTemplate sqlSession) throws MainStatisticsException {
		int result = sqlSession.selectOne("MainAdmin.getTodayCustomerListCount");
		return result;
	}

	// 사업자 회원가입 수
	@Override
	public int getTodayCeoListCount(SqlSessionTemplate sqlSession) throws MainStatisticsException {
		int result = sqlSession.selectOne("MainAdmin.getTodayCeoListCount");
		return result;
	}

	// 주차장 신청
	@Override
	public int getRequestParkingLotListCount(SqlSessionTemplate sqlSession) throws MainStatisticsException {
		int result = sqlSession.selectOne("MainAdmin.getRequestParkingLotListCount");
		return result;
	}

	// 매출
	@Override
	public int getProfit(SqlSessionTemplate sqlSession) throws MainStatisticsException {
		int result = sqlSession.selectOne("MainAdmin.getProfit");
		return result;
	}

	// 사업자문의 게시판
	@Override
	public int getTodayBoardCeo(SqlSessionTemplate sqlSession) throws MainStatisticsException {
		int result = sqlSession.selectOne("MainAdmin.getTodayBoardCeo");
		return result;
	}

	// 관리자문의 게시판
	@Override
	public int getTodayBoardAdmin(SqlSessionTemplate sqlSession) throws MainStatisticsException {
		int result = sqlSession.selectOne("MainAdmin.getTodayBoardAdmin");
		return result;
	}

	// 올해 주차장 예약 수
	@Override
	public DateAdmin selectParkingReservationMonth(SqlSessionTemplate sqlSession) throws MainStatisticsException {
		
		DateAdmin da = sqlSession.selectOne("MainAdmin.selectParkingReservationMonth");
		
		if(da == null) {
			throw new MainStatisticsException("올해 주차장 예약 수 조회 실패");
		}
		return da;
	}

	// 최근 7일 주차장 예약 수
	@Override
	public DateAdmin selectParkingReservation7Days(SqlSessionTemplate sqlSession) throws MainStatisticsException {
		
		DateAdmin da = sqlSession.selectOne("MainAdmin.selectParkingReservation7Days");
		
		if(da == null) {
			throw new MainStatisticsException("최근 7일 주차장 예약 수 조회 실패");
		}
		return da;
	}

}
