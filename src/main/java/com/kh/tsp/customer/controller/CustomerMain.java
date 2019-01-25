package com.kh.tsp.customer.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CustomerMain {

	public CustomerMain() {
		
	}
	
	
	
	@RequestMapping(value="/customer.cu", method=RequestMethod.GET)
	public String Customer() {
		
		
		return "customer/main/Customer_main";
	}
	
	
	@RequestMapping(value="/customerInfo.cu", method=RequestMethod.GET)
	public String CustomerInfo() {
		
		
		return "customer/member/Customer_info";
	}
	
	@RequestMapping(value="/coupon.cu", method=RequestMethod.GET)
	public String CustomerCoupon() {
		
		
		return "customer/member/Customer_coupon";
	}
	
	@RequestMapping(value="/oil.cu", method=RequestMethod.GET)
	public String CustomerOil() {
		
		
		return "customer/member/Customer_oil";
	}
	
	@RequestMapping(value="/reserv.cu", method=RequestMethod.GET)
	public String CustomerReserve() {
		
		
		return "customer/promotion/Customer_reserv";
	}
	
	@RequestMapping(value="/map.cu", method=RequestMethod.GET)
	public String CustomerMap() {
		
		
		return "customer/map/Customer_map";
	}
	
	@RequestMapping(value="/customerNotice.cu", method=RequestMethod.GET)
	public String CustomerNotice() {
		
		
		return "customer/board/Customer_notice";
	}
	
	@RequestMapping(value="/review.cu", method=RequestMethod.GET)
	public String CustomerReview() {
		
		
		return "customer/main/Customer_main";
	}
	
	@RequestMapping(value="/qna.cu", method=RequestMethod.GET)
	public String CustomerQnA() {
		
		
		return "customer/main/Customer_main";
	}
	

}
