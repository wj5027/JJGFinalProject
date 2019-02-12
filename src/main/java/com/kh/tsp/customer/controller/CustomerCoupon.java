package com.kh.tsp.customer.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.tsp.customer.model.service.CustomerMainService;
import com.kh.tsp.customer.model.vo.CCoupon;
import com.kh.tsp.customer.model.vo.Member;
import com.kh.tsp.customer.model.vo.Reservation;

@SessionAttributes("loginUser")
@Controller
public class CustomerCoupon {

	@Autowired
	private CustomerMainService cms;
	
	public CustomerCoupon() {
		
	}

	@RequestMapping(value="/coupon.cu", method=RequestMethod.GET)
	public String selectCoupon(HttpServletRequest request, HttpSession session) {
		Member member = (Member) session.getAttribute("loginUser");
		System.out.println(member);
		if (member != null) {
			
			ArrayList<CCoupon> list = cms.selectUserCoupon(member);
			
			for (int i = 0; i < list.size(); i++) {
				System.out.println(list.get(i));
				list.get(i).setStartDay(list.get(i).getCouponStartDate().toString().substring(2));
				list.get(i).setEndDay(list.get(i).getCouponEndDate().toString().substring(2));
			}
			
			request.setAttribute("CouponList", list);
		} else {
			System.out.println("로그인 정보가 없습니다!");
		}
		
		return "customer/member/Customer_coupon";
	}
	
}
