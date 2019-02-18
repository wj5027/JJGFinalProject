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
			request.setAttribute("pi", pi);
			request.setAttribute("list", list);
			
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
	
}
