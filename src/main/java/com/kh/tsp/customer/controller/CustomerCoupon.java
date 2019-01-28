package com.kh.tsp.customer.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CustomerCoupon {

	public CustomerCoupon() {
		
	}

	@RequestMapping(value="/coupon.cu", method=RequestMethod.GET)
	public String CustomerCoupon() {
		
		return "customer/member/Customer_coupon";
	}
	
}
