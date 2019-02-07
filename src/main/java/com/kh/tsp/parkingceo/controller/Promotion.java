package com.kh.tsp.parkingceo.controller;

import java.util.ArrayList;
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
		}catch(Exception e) {
			model.addAttribute("message", "주차장 조회 실패!");
			return "common/errorPage";
		}
		return "parkingceo/promotion/PromotionPage";	
	}
	
	@RequestMapping(value="insertPromotion.pc",method=RequestMethod.POST)
	public String insertPromotion(Model model,@ModelAttribute PromotionVo pv,HttpSession session) {
		Member m = (Member)session.getAttribute("loginUser");
		pv.setMember_no(m.getMember_no());
		
		if(pv.getSelectDiscount().equals("oilMoney")) {
			pv.setoDiscountValue((int) (pv.getDiscountValue()));
			pv.setCoupon_type("오일할인");
		}else {
			pv.setpDiscountValue(pv.getDiscountValue());
			pv.setCoupon_type("퍼센트할인");
		}
		
		return null;
	}
	
}
