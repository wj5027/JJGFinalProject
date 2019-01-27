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
	
	@RequestMapping(value="/parkingceoLogin.pc", method=RequestMethod.GET)
	public String ParkingceoLogin() {
		
		
		return "parkingceo/main/Parkingceo_login";
	}
	
	@RequestMapping(value="/ceoServiceTerm.pc", method=RequestMethod.GET)
	public String ceoServiceTerm() {
		
		
		return "parkingceo/main/ceoServiceTerm";
	}
	
	@RequestMapping(value="/ceoJoin.pc", method=RequestMethod.GET)
	public String ceoJoin() {
		
		
		return "parkingceo/main/ceoJoin";
	}
	

}
