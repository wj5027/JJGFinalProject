package com.kh.tsp.admin.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class searchCustomerListController {

	@RequestMapping(value = "/searchCustomerList.ad", method = RequestMethod.GET)
	public String searchCustomerList() {
		
		return "admin/customer/SearchCustomerList";
	}
	
}
