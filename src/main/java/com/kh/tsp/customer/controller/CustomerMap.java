package com.kh.tsp.customer.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.tsp.customer.model.service.CustomerMainService;
import com.kh.tsp.customer.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class CustomerMap {
	
	@Autowired
	private CustomerMainService cms;
	
	public CustomerMap() {
		
	}
	
	@RequestMapping(value="/moveParkingSpot.cu", method=RequestMethod.GET)
	public String moveParkingSpot(HttpServletRequest request, HttpSession session) {
		System.out.println(request.getParameter("requestLat"));
		System.out.println(request.getParameter("requestlon"));
		
		request.setAttribute("requestLat", request.getParameter("requestLat"));
		request.setAttribute("requestlon", request.getParameter("requestlon"));
		
		// 오일 조회
		if ((Member)session.getAttribute("loginUser") != null) {
			int UserOilInfo = Integer.parseInt(cms.getRefreshMember((Member)session.getAttribute("loginUser")).getOil());
			
			request.setAttribute("UserOilInfo", UserOilInfo);
		}
		
		return "customer/main/Customer_main";
	}
	
}
