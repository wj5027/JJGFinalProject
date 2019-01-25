package com.kh.tsp.parkingceo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class InsertParking {

	public InsertParking() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping(value="/insertParkingPage.pc", method=RequestMethod.GET)
	public String insertParkingPage(){
		
		return "parkingceo/parking/InsertParking";
	}

}
