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

import com.kh.tsp.common.ParkingCeoPageInfo;
import com.kh.tsp.common.ParkingCeoPagination;
import com.kh.tsp.customer.model.vo.Member;
import com.kh.tsp.parkingceo.model.service.ParkingService;
import com.kh.tsp.parkingceo.model.service.PromotionService;

@Controller
public class ParkingReservation {
	
	@Autowired
	private PromotionService promotion;
	
	@Autowired
	private ParkingService ps;

	public ParkingReservation() {
		// TODO Auto-generated constructor stub
	}
	
	
	@RequestMapping(value="/parkingceoReservation.pc",method=RequestMethod.GET)
	public String parkingReservationPage(HttpSession session,Model model) {
		
		Member m = (Member)session.getAttribute("loginUser");		
		try {
			//현재 보유중인 주차장 검색
			ArrayList<HashMap<String, Object>> list = promotion.selectCurrentParkingList(m);
			model.addAttribute("CurrentParkinglist", list);
		}catch(Exception e) {
			model.addAttribute("message", "주차장 조회 실패!");
			return "common/errorPage";
		}
		return "parkingceo/parking/ParkingReveration";
	}
	
	
	@RequestMapping(value="/searchParkingReservation.pc",method=RequestMethod.POST)
	public ModelAndView selectSearchParkingReservation(HttpSession session,ModelAndView mv, @RequestParam String vtnValue,
			@RequestParam String parkingSelectBox,@RequestParam String reverationSelectBox,@RequestParam String currentPage) {
		
		//Mybtis로 조회할 값 Hashmap 생성
		HashMap<String, Object> selectHmap = new HashMap<String, Object>();
		selectHmap.put("vtnValue", vtnValue);
		selectHmap.put("parkingSelectBox", parkingSelectBox);
		selectHmap.put("reverationSelectBox", reverationSelectBox);
		
		int resultCurrentPage = 1;
		if(currentPage != null) {
			resultCurrentPage = Integer.parseInt(currentPage);		
		}
		
		
		try {
			int listCount = ps.elctSearchParkingReservationListCount(selectHmap,reverationSelectBox);
			ParkingCeoPageInfo pi = ParkingCeoPagination.getPageInfo(resultCurrentPage, listCount);
			ArrayList<HashMap<String, Object>> list = ps.selctSearchParkingReservation(pi,selectHmap,reverationSelectBox);
			mv.addObject("pi", pi);
			mv.addObject("list", list);
		}catch(Exception e) {
			mv.addObject("message", "예약 내역 조회 실패");
			return mv;
		}
		return mv;
	}
	

}
