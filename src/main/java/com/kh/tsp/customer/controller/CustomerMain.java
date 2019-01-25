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
	
	@RequestMapping(value="/coupon.cu", method=RequestMethod.GET)
	public String CustomerCoupon() {
		
		
		return "customer/main/Customer_main";
	}
	
	@RequestMapping(value="/oil.cu", method=RequestMethod.GET)
	public String CustomerOil() {
		
		
		return "customer/main/Customer_main";
	}
	
	@RequestMapping(value="/reserv.cu", method=RequestMethod.GET)
	public String CustomerReserve() {
		
		
		return "customer/promotion/Customer_reserv";
	}
	
	@RequestMapping(value="/map.cu", method=RequestMethod.GET)
	public String CustomerMap() {
		
		
		return "customer/map/Customer_map";
	}
	
	@RequestMapping(value="/notice.cu", method=RequestMethod.GET)
	public String CustomerNotice() {
		
		
		return "customer/main/Customer_main";
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
