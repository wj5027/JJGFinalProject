package com.kh.tsp.parkingceo.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.tsp.common.ParkingCeoPageInfo;
import com.kh.tsp.common.ParkingCeoPagination;
import com.kh.tsp.customer.model.vo.Member;
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
		//현재 사용자 객체 변수
		Member m = (Member)session.getAttribute("loginUser");
		//기간 버튼 데이터 담음
		m.setBtnValue(Integer.parseInt(vtnValue));
		//현재 페이지 변수
		int resultCurrentPage = 1;
		
		if(currentPage != null) {
			resultCurrentPage = Integer.parseInt(currentPage);
		}
		
		try {
			int listCount = ps.selectSearchParkingDetailListCount(selectBox);
			System.out.println(listCount);
			ParkingCeoPageInfo pi = ParkingCeoPagination.getPageInfo(resultCurrentPage, listCount);
			HashMap<String, Object> hmap = ps.selectSearchParkingDetailList(selectBox,pi);
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
