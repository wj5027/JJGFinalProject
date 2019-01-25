package com.kh.tsp.parkingceo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class OilStatistics {

	public OilStatistics() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping(value="/goOilStatisticsPage.pc", method=RequestMethod.GET)
	public String oilStatisticsPage() {
		
		return "parkingceo/statistics/OilPage";
	}

}
