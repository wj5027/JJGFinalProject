package com.kh.tsp.parkingceo.controller;

import java.util.ArrayList;
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
public class ParkingCeoNote {
	
	@Autowired
	private ParkingService ps;

	public ParkingCeoNote() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping(value="/goNotePage.pc", method=RequestMethod.GET)
	public String NotePage() {
		
		return "parkingceo/note/NotePage";
	}
	
	
	//쪽지함 조회 메소드
	@RequestMapping(value="/selectNoteList.pc",method=RequestMethod.POST)
	public ModelAndView selectNoteList(@RequestParam String btnValue, @RequestParam String selectBox,@RequestParam String currentPage,ModelAndView mv,HttpSession session) {
		

		Member m = (Member)session.getAttribute("loginUser");
		m.setBtnValue(Integer.parseInt(btnValue));
		
		//현재 페이지 변수
		int ResultcurrentPage = 1;
		//현재 페이지가 ajax 통신으로 넘어 왔을시
		if(currentPage != null) {
			ResultcurrentPage = Integer.parseInt(currentPage);
		}
		
		try {
			//리스트 카운트 구하기
			int listCount = ps.selectNoteListCount(selectBox,m);
			//페이징 처리용 객체 생성 후 수식 계산
			ParkingCeoPageInfo pi = ParkingCeoPagination.getPageInfo(ResultcurrentPage, listCount);
			//가져온 데이터를 해쉬맵에 담아 mybatis로 전송
			HashMap<String,Object> hmap = ps.selectNoteList(selectBox,pi,m);
			mv.addObject("pi", pi);
			mv.addObject("hmap", hmap);
		}catch(Exception e) {
			mv.addObject("message", "실패");
			mv.setViewName("jsonView");
			return mv;
		}
		mv.setViewName("jsonView");
		return mv;
	}
	

}
