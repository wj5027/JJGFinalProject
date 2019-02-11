package com.kh.tsp.customer.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.tsp.customer.model.service.CustomerMainService;
import com.kh.tsp.customer.model.vo.Member;
import com.kh.tsp.customer.model.vo.Parking;
import com.kh.tsp.customer.model.vo.Reservation;

@SessionAttributes("loginUser")
@Controller
public class CustomerPayment {

	@Autowired
	private CustomerMainService cms;
	
	public CustomerPayment() {
		
	}
	
	@RequestMapping(value="/oil.cu", method=RequestMethod.GET)
	public String CustomerOil() {
		
		return "customer/member/Customer_oil";
	}
	
	@RequestMapping(value="/reserv.cu", method=RequestMethod.GET)
	public String showCustomerReserve(HttpServletRequest request, HttpSession session) {
		Member member = (Member) session.getAttribute("loginUser");
		
		if (member != null) {
			ArrayList<Reservation> reservList = cms.selectShowReserv(member);
			
			request.setAttribute("reservList", reservList);
			
			System.out.println(reservList);
		} else {
			System.out.println("로그인 정보가 없습니다!");
		}
		
		return "customer/promotion/Customer_reserv";
	}
	
	@RequestMapping("updateCancelReserve.cu")
	public void searchVoiceParking(@RequestParam String keyword, @RequestParam String type, HttpServletResponse response) {
		int result = 0;
		
		/*result = cms.searchVoiceParking(keyword, type);*/
    }
	
}
