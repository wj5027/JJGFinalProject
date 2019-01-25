package com.kh.tsp.parkingceo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BestPakerStatistics {

	public BestPakerStatistics() {
		// TODO Auto-generated constructor stub
	}
	
	
	@RequestMapping (value="/goBestPakerStatisticsPage.pc", method=RequestMethod.GET)
	public String bestPakerStatisticsPage() {
		
		return "parkingceo/statistics/BestPakerPage";
	}

}
