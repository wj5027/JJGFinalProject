package com.kh.tsp.parkingceo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ParkingCeoNote {

	public ParkingCeoNote() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping(value="/goNotePage.pc", method=RequestMethod.GET)
	public String NotePage() {
		
		return "parkingceo/note/NotePage";
	}

}
