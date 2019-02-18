package com.kh.tsp.parkingceo.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.tsp.customer.model.vo.Member;
import com.kh.tsp.parkingceo.model.service.ParkingService;
import com.kh.tsp.parkingceo.model.service.PromotionService;
import com.kh.tsp.parkingceo.model.vo.ParkingCeoParkingListVo;
import com.kh.tsp.parkingceo.model.vo.ParkingCeoVo;

@Controller
public class ParkingCeoExchange {
	
	
	@Autowired
	private PromotionService promotion;
	
	@Autowired
	private ParkingService ps;

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
	
	@RequestMapping(value="/searchParkingOne.pc",method=RequestMethod.POST)
	public ModelAndView searchParkingOne(ModelAndView mv,@RequestParam String parkingSelectBox, HttpSession session) {
		
		//주차장 조회를 위한 데이터 조회 및 삽입
		Member m = (Member)session.getAttribute("loginUser");
		ParkingCeoVo parking = new ParkingCeoVo();
		parking.setMemberNo(m.getMember_no());
		parking.setParkingNo(parkingSelectBox);
		
		//주차장 데이터 조회
		ParkingCeoParkingListVo searchParkingOne = ps.selectSearchParkingOne(parking);
		System.out.println(searchParkingOne);
		
		
		mv.setViewName("jsonView");
		return mv;
	}


}
