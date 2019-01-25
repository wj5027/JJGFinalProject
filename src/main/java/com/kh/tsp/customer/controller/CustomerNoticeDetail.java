package com.kh.tsp.customer.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CustomerNoticeDetail {

	public CustomerNoticeDetail() {}
	
	@RequestMapping(value="customerNoticeDetail.cu", method=RequestMethod.GET)
	public String CustomerNoticeDetail() {
		
		return "customer/board/Customer_notice_detail";
	}
}
