package com.kh.tsp.parkingceo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ParkingCeoExchange {

	public ParkingCeoExchange() {
		
	}
	
	
	@RequestMapping(value="/parkingceoExchange.pc", method=RequestMethod.GET)
	public String ParkingExchangePage() {
		
		
		return "parkingceo/exchange/ExchangePage";
	}
	
	@RequestMapping(value="/test.pc", method=RequestMethod.GET)
	public String ParkingTest() {
		
		
		return "parkingceo/exchange/tset";
	}

}
