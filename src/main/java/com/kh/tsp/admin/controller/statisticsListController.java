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

	@RequestMapping(value = "/statisticsList.ad", method = RequestMethod.GET)
	public String statisticsList() {
		
		return "admin/main/StatisticsList";
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

	
}
