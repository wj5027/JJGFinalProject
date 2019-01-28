package com.kh.tsp.customer.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CustomerPayment {

	public CustomerPayment() {
		
	}
	
	@RequestMapping(value="/oil.cu", method=RequestMethod.GET)
	public String CustomerOil() {
		
		return "customer/member/Customer_oil";
	}
	
	@RequestMapping(value="/reserv.cu", method=RequestMethod.GET)
	public String CustomerReserve() {
		
		return "customer/promotion/Customer_reserv";
	}
	
	
}
