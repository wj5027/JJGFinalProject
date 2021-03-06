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
public class ParkingDetailList {
	
	@Autowired
	private ParkingService ps;
	@Autowired
	private PromotionService promotion;

	public ParkingDetailList() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping(value="/goParkingDetailListPage.pc", method=RequestMethod.GET)
	public String parkingDetailListPage(HttpSession session,Model model) {
		Member m = (Member)session.getAttribute("loginUser");		
		try {
			//현재 보유중인 주차장 검색
			ArrayList<HashMap<String, Object>> list = promotion.selectCurrentParkingList(m);
			model.addAttribute("CurrentParkinglist", list);
		}catch(Exception e) {
			model.addAttribute("message", "주차장 조회 실패!");
			return "common/errorPage";
		}
		return "parkingceo/parking/ParkingDetailPage";
	}
	
	
	@RequestMapping(value="/searchParkingDetail.pc" , method=RequestMethod.POST)
	public ModelAndView searchParkingDetailList (@RequestParam String currentPage,@RequestParam String btnValue,
			@RequestParam String inOutputSelectBox,@RequestParam String parkingSelectBox,ModelAndView mv,HttpSession session) {
		
		//현재 사용자 객체 변수
		Member m = (Member)session.getAttribute("loginUser");
		
		
		//현재 페이지 변수
		int resultCurrentPage = 1;
		
		if(currentPage != null) {
			resultCurrentPage = Integer.parseInt(currentPage);
		}
		
		try {
			int listCount = ps.selectSearchParkingDetailListCount(inOutputSelectBox,parkingSelectBox,btnValue);
			ParkingCeoPageInfo pi = ParkingCeoPagination.getPageInfo(resultCurrentPage, listCount);
			HashMap<String, Object> hmap = ps.selectSearchParkingDetailList(inOutputSelectBox,pi,parkingSelectBox,btnValue);
			mv.addObject("pi", pi);
			mv.addObject("hmap", hmap);
		}catch(Exception e) {
			mv.addObject("message", "입출차 조회에 실패했습니다.");
			mv.setViewName("jsonView");
			return mv;
		}
		mv.setViewName("jsonView");
		return mv;
	}

}
