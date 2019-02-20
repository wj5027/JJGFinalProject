package com.kh.tsp.admin.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.tsp.admin.model.exception.ParkingCEOSelectListException;
import com.kh.tsp.admin.model.service.ParkingCEOService;
import com.kh.tsp.admin.model.vo.DateAdmin;
import com.kh.tsp.admin.model.vo.OilListAdmin;
import com.kh.tsp.common.PageInfo;
import com.kh.tsp.common.Pagination;


@Controller
public class statisticsCEOController {

	String nullCheck=null;
	
	@Autowired
	private ParkingCEOService ps;

	@RequestMapping("goSearchStatisticsCEOPage.ad")
	public String goMain() {
		return "admin/parkingceo/StatisticsCEO";
	}

	// 전체 통계 리스트 
	@RequestMapping(value = "/selectStatisticsCEO.ad", method = RequestMethod.GET)
	public String statisticsCEO(HttpServletRequest request, HttpServletResponse response) {

		int currentPage =1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		try {
			int listCount = ps.getStatisticsListCount();
			PageInfo pi = Pagination.getPageInfo(currentPage,listCount);
			ArrayList<OilListAdmin> list =ps.selectStatisticsCEOList(pi);
			ArrayList<OilListAdmin> listNoPaging =ps.selectStatisticsCEOListNoPaging();
			int sum = 0;
			for(int i=0; i<listNoPaging.size(); i++) {
				if(listNoPaging.get(i).getOilListType().equals("환전")) {
					sum += listNoPaging.get(i).getOil();
				}
			}		
			
			request.setAttribute("pi", pi);
			request.setAttribute("list", list);
			request.setAttribute("sum", sum);
			
			if(nullCheck != null) {
				request.setAttribute("nullCheck", nullCheck);
				nullCheck=null;
			}
			
			return "admin/parkingceo/StatisticsCEO";
			
		} catch (ParkingCEOSelectListException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}

	// 회원 검색
	@RequestMapping(value = "/selectSearchStatisticsCEOList.ad", method = {RequestMethod.GET, RequestMethod.POST})
	public String selectSearchStatisticsCEOList(HttpServletRequest request, HttpServletResponse response,
												String selectStatus, String memberId, String startMoney, String endMoney, String today, String startDate, String endDate) {
		
		int currentPage =1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		if(startMoney.equals("")) {
			startMoney = "0";
		}
		
		try {
			int listCount = ps.getSearchStatisticsCEOListCount(selectStatus, memberId, startMoney, endMoney, today, startDate, endDate);
			System.out.println("listCount : "+listCount);
			PageInfo pi = Pagination.getPageInfo(currentPage,listCount);
			ArrayList<OilListAdmin> list =ps.selectSearchStatisticsCEOList(pi, selectStatus, memberId, startMoney, endMoney,  today, startDate, endDate);
			ArrayList<OilListAdmin> listNoPaging =ps.selectSearchStatisticsCEOList(selectStatus, memberId, startMoney, endMoney,  today, startDate, endDate);
			
			int sum = 0;
			for(int i=0; i<listNoPaging.size(); i++) {
				if(listNoPaging.get(i).getOilListType().equals("환전")) {
					sum += listNoPaging.get(i).getOil();
				}
			}	
			
			request.setAttribute("pi", pi);
			request.setAttribute("list", list);
			request.setAttribute("sum", sum);

			request.setAttribute("selectStatus", selectStatus);
			request.setAttribute("memberId", memberId);
			request.setAttribute("startMoney", startMoney);
			request.setAttribute("endMoney", endMoney);
			request.setAttribute("today", today);
			request.setAttribute("startDate", startDate);
			request.setAttribute("endDate", endDate);
			
			if(listCount==0 || list == null) {
				nullCheck="nullCheck";
				return "redirect:selectStatisticsCEO.ad";
			}else {
				return "admin/parkingceo/StatisticsCEO2";		
			}
			
		} catch (ParkingCEOSelectListException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	// 통계 리스트 (월별)
	@RequestMapping(value = "/selectStatisticsMonth2.ad", method = RequestMethod.GET)
	public @ResponseBody DateAdmin selectStatisticsMonth(HttpServletRequest request, HttpServletResponse response) {
		
		DateAdmin da = new DateAdmin();
		
		try {
			da =ps.selectStatisticsMonth();			
		} catch (ParkingCEOSelectListException e) {}
		
		return da;
	}
	
	// 통계 리스트 (최근 7일)
	@RequestMapping(value = "/selectStatistics7Day2.ad", method = RequestMethod.GET)
	public @ResponseBody DateAdmin selectStatistics7Day(HttpServletRequest request, HttpServletResponse response) {
		
		DateAdmin da = new DateAdmin();
		
		try {
			da =ps.selectStatistics7Day();			
		} catch (ParkingCEOSelectListException e) {}
		
		return da;
	}
	
	// 통계 리스트 (최근 24시간)
	@RequestMapping(value = "/selectStatisticsToday2.ad", method = RequestMethod.GET)
	public @ResponseBody DateAdmin selectStatisticsToday(HttpServletRequest request, HttpServletResponse response) {
		
		DateAdmin da = new DateAdmin();
		
		try {
			da =ps.selectStatisticsToday();			
		} catch (ParkingCEOSelectListException e) {}
		
		return da;
	}
	
}
