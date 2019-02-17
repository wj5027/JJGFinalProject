package com.kh.tsp.parkingceo.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.tsp.customer.model.vo.Member;
import com.kh.tsp.parkingceo.model.service.PromotionService;

@Controller
public class ParkingCeoExchange {
	
	
	@Autowired
	private PromotionService promotion;

	public ParkingCeoExchange() {
		
	}
	
	
	@RequestMapping(value="/parkingceoExchange.pc", method=RequestMethod.GET)
	public String ParkingExchangePage(Model model,HttpSession session) {
		Member m = (Member)session.getAttribute("loginUser");		
		try {
			//현재 보유중인 주차장 검색
			ArrayList<HashMap<String, Object>> list = promotion.selectCurrentParkingList(m);
			model.addAttribute("CurrentParkinglist", list);
		}catch(Exception e) {
			model.addAttribute("message", "주차장 조회 실패!");
			return "common/errorPage";
		}
		return "parkingceo/exchange/ExchangePage";
	}
	


}
