package com.kh.tsp.parkingceo.controller;

import javax.servlet.http.HttpSession;
import javax.xml.ws.RequestWrapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.tsp.parkingceo.model.service.ParkingService;

@Controller
public class ParkingDetailList {
	
	@Autowired
	private ParkingService ps;

	public ParkingDetailList() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping(value="/goParkingDetailListPage.pc", method=RequestMethod.GET)
	public String parkingDetailListPage() {
		
		return "parkingceo/parking/ParkingDetailPage";
	}
	
	
	@RequestMapping(value="/searchParkingDetail.pc" , method=RequestMethod.POST)
	public ModelAndView searchParkingDetailList (@RequestParam String currentPage,@RequestParam String vtnValue,
			@RequestParam String selectBox,ModelAndView mv,HttpSession session) {
		int resultCurrentPage = 1;
		
		if(currentPage != null) {
			resultCurrentPage = Integer.parseInt(currentPage);
		}
		
		return mv;
	}

}
