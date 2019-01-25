package com.kh.tsp.parkingceo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ParkingListStatistics {

	public ParkingListStatistics() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping (value="/goParkingListStatisticsPage.pc", method=RequestMethod.GET)
	public String parkingListStatisticsPage() {
		
		return "parkingceo/statistics/ParkingListPage";
	}

}
