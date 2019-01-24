package com.kh.tsp.parkingceo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ParkingCeoMain {

	
	public ParkingCeoMain() {
		
	}
	
	
	@RequestMapping(value="/parkingceoMain.pc", method=RequestMethod.GET)
	public String ParkingMain() {
		
		
		return "parkingceo/main/Parkingceo_main";
	}
	
	
	

}
