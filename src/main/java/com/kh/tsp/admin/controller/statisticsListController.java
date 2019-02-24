package com.kh.tsp.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.tsp.admin.model.exception.MainStatisticsException;
import com.kh.tsp.admin.model.service.MainService;
import com.kh.tsp.admin.model.vo.DateAdmin;


@Controller
public class statisticsListController {

	@Autowired
	private MainService ms;

	@RequestMapping(value = "/selectStatisticsList.ad", method = {RequestMethod.GET, RequestMethod.POST})
	public String statisticsList(HttpServletRequest request, HttpServletResponse response) {

		try {
			// 전체 사용자 회원 수 
			int customerListCount = ms.getCustomerListCount();
			// 전체 사업자 회원 수 
			int ceoListCount = ms.getCeoListCount();

			// 관리자문의 게시판 수
			int boardAdminListCount = ms.getBoardAdminListCount();
			// 사업자문의 게시판 수
			int boardCeoListCount = ms.getBoardCeoListCount();
			// 후기 게시판 수
			int boardReplyListCount = ms.getBoardReplyListCount();
						
			// 환불신청
			int requestRefund = ms.getRequestRefundListCount();
			// 환전신청
			int requestExchange = ms.getRequestExchangeListCount();
			// 사용자 회원가입 수 
			int todayCustomerList = ms.getTodayCustomerListCount();
			// 사업자 회원가입 수
			int todayCeoList = ms.getTodayCeoListCount();
			// 주차장 신청
			int requestParkingLot = ms.getRequestParkingLotListCount();
			// 매출
			int profit = ms.getProfit();
			// 사업자문의 게시판
			int todayBoardCeo = ms.getTodayBoardCeo();
			// 관리자문의 게시판
			int todayBoardAdmin = ms.getTodayBoardAdmin();
			
			request.setAttribute("ceoListCount", ceoListCount);
			request.setAttribute("boardAdminListCount", boardAdminListCount);
			request.setAttribute("boardCeoListCount", boardCeoListCount);
			request.setAttribute("boardReplyListCount", boardReplyListCount);

			request.setAttribute("requestRefund", requestRefund);
			request.setAttribute("requestExchange", requestExchange);
			request.setAttribute("todayCustomerList", todayCustomerList);
			request.setAttribute("todayCeoList", todayCeoList);
			request.setAttribute("requestParkingLot", requestParkingLot);
			request.setAttribute("profit", profit);
			request.setAttribute("todayBoardCeo", todayBoardCeo);
			request.setAttribute("todayBoardAdmin", todayBoardAdmin);			
			
			return "admin/main/StatisticsList";
			
		} catch (MainStatisticsException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";		
		}
	}

	// 올해 사용자 회원가입 수
	@RequestMapping(value = "/selectCustomerSignUpMonth.ad", method = RequestMethod.GET)
	public @ResponseBody DateAdmin selectCustomerSignUpMonth(HttpServletRequest request, HttpServletResponse response) {
		
		DateAdmin da = new DateAdmin();
		
		try {
			da =ms.selectCustomerSignUpMonth();			
		} catch (MainStatisticsException e) {}
		
		return da;
	}

	// 최근 7일 사용자 회원가입 수
	@RequestMapping(value = "/selectCustomerSignUp7Days.ad", method = RequestMethod.GET)
	public @ResponseBody DateAdmin selectCustomerSignUp7Days(HttpServletRequest request, HttpServletResponse response) {
		
		DateAdmin da = new DateAdmin();
		
		try {
			da =ms.selectCustomerSignUp7Days();			
		} catch (MainStatisticsException e) {}
		
		return da;
	}

	// 올해 사업자 회원가입 수
	@RequestMapping(value = "/selectCEOSignUpMonth.ad", method = RequestMethod.GET)
	public @ResponseBody DateAdmin selectCEOSignUpMonth(HttpServletRequest request, HttpServletResponse response) {
		
		DateAdmin da = new DateAdmin();
		
		try {
			da =ms.selectCEOSignUpMonth();			
		} catch (MainStatisticsException e) {}
		
		return da;
	}

	// 최근 7일 사업자 회원가입 수
	@RequestMapping(value = "/selectCEOSignUp7Days.ad", method = RequestMethod.GET)
	public @ResponseBody DateAdmin selectCEOSignUp7Days(HttpServletRequest request, HttpServletResponse response) {
		
		DateAdmin da = new DateAdmin();
		
		try {
			da =ms.selectCEOSignUp7Days();			
		} catch (MainStatisticsException e) {}
		
		return da;
	}

	// 올해 관리자문의 수
	@RequestMapping(value = "/selectBoardAdminMonth.ad", method = RequestMethod.GET)
	public @ResponseBody DateAdmin selectBoardAdminMonth(HttpServletRequest request, HttpServletResponse response) {
		
		DateAdmin da = new DateAdmin();
		
		try {
			da =ms.selectBoardAdminMonth();			
		} catch (MainStatisticsException e) {}
		
		return da;
	}

	// 최근 7일 관리자문의 수
	@RequestMapping(value = "/selectBoardAdmin7Days.ad", method = RequestMethod.GET)
	public @ResponseBody DateAdmin selectBoardAdmin7Days(HttpServletRequest request, HttpServletResponse response) {
		
		DateAdmin da = new DateAdmin();
		
		try {
			da =ms.selectBoardAdmin7Days();			
		} catch (MainStatisticsException e) {}
		
		return da;
	}

	// 올해 사업자문의 수
	@RequestMapping(value = "/selectBoardCeoMonth.ad", method = RequestMethod.GET)
	public @ResponseBody DateAdmin selectBoardCeoMonth(HttpServletRequest request, HttpServletResponse response) {
		
		DateAdmin da = new DateAdmin();
		
		try {
			da =ms.selectBoardCeoMonth();			
		} catch (MainStatisticsException e) {}
		
		return da;
	}

	// 최근 7일 사업자문의 수
	@RequestMapping(value = "/selectBoardCeo7Days.ad", method = RequestMethod.GET)
	public @ResponseBody DateAdmin selectBoardCeo7Days(HttpServletRequest request, HttpServletResponse response) {
		
		DateAdmin da = new DateAdmin();
		
		try {
			da =ms.selectBoardCeo7Days();			
		} catch (MainStatisticsException e) {}
		
		return da;
	}

	// 올해 후기 수
	@RequestMapping(value = "/selectBoardReplyMonth.ad", method = RequestMethod.GET)
	public @ResponseBody DateAdmin selectBoardReplyMonth(HttpServletRequest request, HttpServletResponse response) {
		
		DateAdmin da = new DateAdmin();
		
		try {
			da =ms.selectBoardReplyMonth();			
		} catch (MainStatisticsException e) {}
		
		return da;
	}

	// 최근 7일 후기 수
	@RequestMapping(value = "/selectBoardReply7Days.ad", method = RequestMethod.GET)
	public @ResponseBody DateAdmin selectBoardReply7Days(HttpServletRequest request, HttpServletResponse response) {
		
		DateAdmin da = new DateAdmin();
		
		try {
			da =ms.selectBoardReply7Days();			
		} catch (MainStatisticsException e) {}
		
		return da;
	}

	
}
