package com.kh.tsp.customer.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CustomerAccount {

	public CustomerAccount() {
		
	}

	
	@RequestMapping(value="/customer_loginPage.cu", method=RequestMethod.GET)
	public String CustomerLogin() {
		
		
		return "customer/main/Customer_login";
	}
	
	@RequestMapping(value="/customer_joinInput.cu", method=RequestMethod.GET)
	public String CustomerjoinInput() {
		
		return "customer/main/Customer_joinInput";
	}
	
	@RequestMapping(value="/customer_join.cu", method=RequestMethod.GET)
	public String Customerjoin() {
		
		
		return "customer/main/Customer_join";
	}
	
	@RequestMapping(value="/customerInfo.cu", method=RequestMethod.GET)
	public String CustomerInfo() {
		
		
		return "customer/member/Customer_info";
	}
	
}
