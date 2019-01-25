package com.kh.tsp.parkingceo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ParkingDetailList {

	public ParkingDetailList() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping(value="/goParkingDetailListPage.pc", method=RequestMethod.GET)
	public String parkingDetailListPage() {
		
		return "parkingceo/parking/ParkingDetailPage";
	}

}
