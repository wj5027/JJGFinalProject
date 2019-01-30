package com.kh.tsp.parkingceo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.tsp.parkingceo.model.service.ExchangeMoneyService;

@Controller
public class ExchangeMoney {
	
	@Autowired
	ExchangeMoneyService es;

	public ExchangeMoney() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping(value="/goExchangeMoneyPage.pc", method=RequestMethod.GET)
	public String exchangeMoneyPage() {
		
		return "parkingceo/exchange/ExchangeMoney";
	}
	
	public String exchangeMoney() {
		
		int exchangeMoney = es.insertTestMethod();
		
		return null;
	}
	

}
