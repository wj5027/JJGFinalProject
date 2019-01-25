package com.kh.tsp.parkingceo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class Promotion {

	public Promotion() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping(value="/goPromotionPage.pc" , method=RequestMethod.GET)
	public String promotionPage() {
		
		return "parkingceo/promotion/PromotionPage";	
	}

}
