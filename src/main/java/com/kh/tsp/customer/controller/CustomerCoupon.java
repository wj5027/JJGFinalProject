package com.kh.tsp.customer.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
		
		if ((Member)session.getAttribute("loginUser") != null) {
			int UserOilInfo = Integer.parseInt(cms.getRefreshMember((Member)session.getAttribute("loginUser")).getOil());
			
			request.setAttribute("UserOilInfo", UserOilInfo);
		}
		
		return "customer/member/Customer_coupon";
	}
	
	@RequestMapping("selectParkingCoupon.cu")
	public @ResponseBody CCoupon selectParkingCoupon(@RequestParam String parkingNo) {
		CCoupon selectResult = new CCoupon();
		
		selectResult.setCouponName("결과가 없어욤");
		
		CCoupon selectCoupon = cms.selectParkingCoupon(parkingNo);
		
		if (selectCoupon != null) {
			selectResult = selectCoupon;
		}
		
		return selectResult;
    }
	
	@RequestMapping(value="/getCoupon.cu", method=RequestMethod.GET)
	public String getCoupon(HttpServletRequest request, HttpSession session) {
		int requestCouponNo = Integer.parseInt(request.getParameter("couponNo"));
		
		CCoupon couponInfo = new CCoupon();
		Member m = (Member)session.getAttribute("loginUser");
		couponInfo.setCouponNo(requestCouponNo);
		couponInfo.setUserMemberNo(m.getMember_no());
		
		
		int result = 0;
		
		result = cms.insertGetCoupon(couponInfo);
		
		if (result > 0) {
			System.out.println("쿠폰 가져오기 성공");
			result = 0;
			
			result = cms.updateGetCoupon(requestCouponNo);
			if (result > 0) {
				System.out.println("갯수 차감 성공");
			}
		}
		
		return "redirect:coupon.cu";
	}
	
	
}
