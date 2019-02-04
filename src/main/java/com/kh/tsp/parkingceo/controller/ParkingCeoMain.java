package com.kh.tsp.parkingceo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.tsp.customer.model.vo.Member;
import com.kh.tsp.parkingceo.model.service.ParkingService;

@Controller
public class ParkingCeoMain {
	
	
	@Autowired
	ParkingService ps;

	
	public ParkingCeoMain() {
		
	}
	
	
	//사업자 메인 페이지 메소드
	@RequestMapping(value="/parkingceoMain.pc", method=RequestMethod.GET)
	public String ParkingMainPage() {
		
		
		return "parkingceo/main/Parkingceo_main";
	}
	
	//사업자 로그인 페이지 메소드
	@RequestMapping(value="/parkingceoLogin.pc", method=RequestMethod.GET)
	public String ParkingceoLoginPage() {
		
		
		return "parkingceo/main/Parkingceo_login";
	}
	
	
	//사업자 이용약관 동의 페이지
	@RequestMapping(value="/ceoServiceTerm.pc", method=RequestMethod.GET)
	public String ceoServiceTermPage() {
		
		
		return "parkingceo/main/ceoServiceTerm";
	}
	
	//사업자 회원가입 페이지 
	@RequestMapping(value="/ceoJoin.pc", method=RequestMethod.GET)
	public String ceoJoinPage() {
		
		
		return "parkingceo/main/ceoJoin";
	}
	
	//사업자 회원가입 기능
	@RequestMapping(value="/insertParkinCeo.pc")
	public String inserParkingCeo(@ModelAttribute Member m, Model model ) {
		
		try {
			int insertParkingCeo = ps.insertParkingCeo(m);
		}catch(Exception e) {
			model.addAttribute("message", "사업자 회원가입 실패!");
			return "common/errorPage";
		}
		
		
		return null;
	}
	

}
