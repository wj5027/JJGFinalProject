package com.kh.tsp.customer.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CustomerInfo {

	public CustomerInfo() {}
	
	@RequestMapping(value="customerInfo.cu", method=RequestMethod.POST)
	public String CustomerInfo() {
		
		return "customer/member/Customer_info";
	}



}
