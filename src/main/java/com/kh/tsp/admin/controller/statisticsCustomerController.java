package com.kh.tsp.admin.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.tsp.admin.model.exception.CustomerSelectListException;
import com.kh.tsp.admin.model.service.CustomerService;
import com.kh.tsp.admin.model.vo.MemberAdmin;
import com.kh.tsp.admin.model.vo.OilListAdmin;
import com.kh.tsp.common.PageInfo;
import com.kh.tsp.common.Pagination;


@Controller
public class statisticsCustomerController {

	String nullCheck=null;
	
	@Autowired
	private CustomerService cs;

	@RequestMapping("goSearchStatisticsCustomerPage.ad")
	public String goMain() {
		return "admin/customer/StatisticsCustomer";
	}
	
	// 전체 통계 리스트 
	@RequestMapping(value = "/selectStatisticsCustomer.ad", method = RequestMethod.GET)
	public String statisticsCustomer(HttpServletRequest request, HttpServletResponse response) {

		int currentPage =1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		try {
			int listCount = cs.getStatisticsListCount();
			PageInfo pi = Pagination.getPageInfo(currentPage,listCount);
			ArrayList<OilListAdmin> list =cs.selectStatisticsCustomerList(pi);
			ArrayList<OilListAdmin> listNoPaging =cs.selectStatisticsCustomerListNoPaging();
			int sum = 0;
			for(int i=0; i<listNoPaging.size(); i++) {
				if(listNoPaging.get(i).getOilListType().equals("충전")) {
					sum += listNoPaging.get(i).getOil();
				}else {
					sum -= listNoPaging.get(i).getOil();
				}
			}		
			
			request.setAttribute("pi", pi);
			request.setAttribute("list", list);
			request.setAttribute("sum", sum);
			System.out.println("list 확인 : "+list);
			System.out.println("nullCheck : "+nullCheck);
			
			if(nullCheck != null) {
				request.setAttribute("nullCheck", nullCheck);
				nullCheck=null;
			}

			return "admin/customer/StatisticsCustomer";
			
		} catch (CustomerSelectListException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}

	// 회원 검색
	@RequestMapping(value = "/selectSearchStatisticsCustomerList.ad", method = {RequestMethod.GET, RequestMethod.POST})
	public String selectSearchStatisticsCustomerList(HttpServletRequest request, HttpServletResponse response,
												String selectStatus, String memberId, String startMoney, String endMoney, String today, String startDate, String endDate) {
		
		int currentPage =1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		if(startMoney.equals("")) {
			startMoney = "0";
		}
		
		try {
			int listCount = cs.getSearchStatisticsCustomerListCount(selectStatus, memberId, startMoney, endMoney, today, startDate, endDate);
			System.out.println("listCount : "+listCount);
			PageInfo pi = Pagination.getPageInfo(currentPage,listCount);
			ArrayList<OilListAdmin> list =cs.selectSearchStatisticsCustomerList(pi, selectStatus, memberId, startMoney, endMoney,  today, startDate, endDate);
			ArrayList<OilListAdmin> listNoPaging =cs.selectSearchStatisticsCustomerList(selectStatus, memberId, startMoney, endMoney,  today, startDate, endDate);
			
			int sum = 0;
			for(int i=0; i<listNoPaging.size(); i++) {
				if(listNoPaging.get(i).getOilListType().equals("충전")) {
					sum += listNoPaging.get(i).getOil();
				}else {
					sum -= listNoPaging.get(i).getOil();
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
				return "redirect:selectStatisticsCustomer.ad";
			}else {
				return "admin/customer/StatisticsCustomer2";		
			}
			
		} catch (CustomerSelectListException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
}
