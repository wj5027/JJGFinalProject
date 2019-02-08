package com.kh.tsp.parkingceo.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.GregorianCalendar;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.tsp.customer.model.vo.Member;
import com.kh.tsp.parkingceo.model.service.PromotionService;
import com.kh.tsp.parkingceo.model.vo.PromotionVo;

@Controller
public class Promotion {
	
	private String promotionChk = null;
	
	@Autowired
	private PromotionService ps;

	public Promotion() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping(value="/goPromotionPage.pc" , method=RequestMethod.GET)
	public String promotionPage(HttpSession session,Model model) {
		Member m = (Member)session.getAttribute("loginUser");		
		try {
			//현재 보유중인 주차장 검색
			ArrayList<HashMap<String, Object>> list = ps.selectCurrentParkingList(m);
			model.addAttribute("CurrentParkinglist", list);
			if (promotionChk !=null) {
				model.addAttribute("promotionChk", promotionChk);
			}
		}catch(Exception e) {
			model.addAttribute("message", "주차장 조회 실패!");
			return "common/errorPage";
		}
		promotionChk = null;
		return "parkingceo/promotion/PromotionPage";	
	}
	
	@RequestMapping(value="insertPromotion.pc",method=RequestMethod.POST)
	public String insertPromotion(Model model,@ModelAttribute PromotionVo pv,HttpSession session) {
		Member m = (Member)session.getAttribute("loginUser");
		String[] startDateArr = null;
		String[] endDateArr = null;
		int startYear = 0;
		int startMonth = 0;
		int startDay = 0;
		int endYear = 0;
		int endMonth = 0;
		int endDay = 0;
		
		pv.setMember_no(m.getMember_no());
		
		if(pv.getSelectDiscount().equals("oilMoney")) {
			pv.setoDiscountValue((int) (pv.getDiscountValue()));
			pv.setpDiscountValue(0);
			pv.setCoupon_type("오일할인");
		}else {
			pv.setpDiscountValue(0.01*pv.getDiscountValue());
			pv.setoDiscountValue(0);
			pv.setCoupon_type("퍼센트할인");
		}
		startDateArr = pv.getStartDay().replace("월", "").split(" ");
		endDateArr = pv.getEndDay().replace("월", "").split(" ");
		for(int i = 0 ; i < startDateArr.length; i ++) {
			if(i == 0) {
				startYear = Integer.parseInt(startDateArr[i]);
			}else if (i == 1) {
				startMonth = Integer.parseInt(startDateArr[i]);
			}else {
				startDay = Integer.parseInt(startDateArr[i]);
			}
		}
		for(int i = 0 ; i < endDateArr.length; i ++) {
			if(i == 0) {
				endYear = Integer.parseInt(endDateArr[i]);
			}else if (i == 1) {
				endMonth = Integer.parseInt(endDateArr[i]);
			}else {
				endDay = Integer.parseInt(endDateArr[i]);
			}
		}
		pv.setCoupon_start_date(new Date(new GregorianCalendar(startYear, startMonth-1, startDay).getTimeInMillis()));
		pv.setCoupon_end_date(new Date(new GregorianCalendar(endYear, endMonth-1, endDay).getTimeInMillis()));
		
		try {
			ps.insertPromotion(pv);
			
		}catch(Exception e) {
			model.addAttribute("message", "쿠폰 신청 실패");
			promotionChk = "failed";
			return "redirect:goPromotionPage.pc";
		}
		promotionChk = "success";
		return "redirect:goPromotionPage.pc";
	}
	
}
