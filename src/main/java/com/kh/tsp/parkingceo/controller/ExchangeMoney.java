package com.kh.tsp.parkingceo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ExchangeMoney {

	public ExchangeMoney() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping(value="/goExchangeMoneyPage.pc", method=RequestMethod.GET)
	public String exchangeMoneyPage() {
		
		return "parkingceo/exchange/ExchangeMoney";
	}

}
