package com.kh.tsp.customer.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

@SessionAttributes("loginUser")
@Controller
public class CustomerMap {
	
	public CustomerMap() {
		
	}
	
	@RequestMapping(value="/moveParkingSpot.cu", method=RequestMethod.GET)
	public String moveParkingSpot(HttpServletRequest request) {
		System.out.println(request.getParameter("requestLat"));
		System.out.println(request.getParameter("requestlon"));
		
		request.setAttribute("requestLat", request.getParameter("requestLat"));
		request.setAttribute("requestlon", request.getParameter("requestlon"));
		return "customer/main/Customer_main";
	}
	
}
