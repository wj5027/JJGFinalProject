package com.kh.tsp.parkingceo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.tsp.customer.model.vo.Member;
import com.kh.tsp.parkingceo.model.service.ExchangeMoneyService;
import com.kh.tsp.parkingceo.model.vo.ExchangeMoneyVo;

@SessionAttributes("loginUser")
@Controller
public class ExchangeMoney {
	
	private String exchangeChk = null;
	
	@Autowired
	ExchangeMoneyService es;

	public ExchangeMoney() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping(value="/goExchangeMoneyPage.pc", method=RequestMethod.GET)
	public String exchangeMoneyPage(Model model) {
		if (exchangeChk !=null) {
			model.addAttribute("exchangeChk", exchangeChk);
		}
		exchangeChk = null;
		return "parkingceo/exchange/ExchangeMoney";
	}
	

	@RequestMapping(value="/exchangeMoney.pc", method=RequestMethod.POST)
	public String exchangeMoney(Model model,@ModelAttribute ExchangeMoneyVo ev,HttpSession session) {
		Member m = (Member)session.getAttribute("loginUser");
		ev.setMember_no(m.getMember_no());
		ev.setStatus("진행중");
		ev.setCash(ev.getOil());
		try {
			//환전 신청 내역 삽입
			es.insertExchangeMoney(ev);
			//환전 신청 완료 후 사업자 오일 변경
			es.updateMemberExchangeMoney(ev);
			// 오일 변경후 사업자 데이터 조회 및 session 변경
			Member loginUser = es.selectCheckMember(m);
			model.addAttribute("loginUser", loginUser);
		}catch(Exception e) {
			model.addAttribute("message", "환전 신청 실패!");
			exchangeChk = "failed";
			return "common/errorPage";
		}
		exchangeChk = "success";
		return "redirect:goExchangeMoneyPage.pc";
	}
	
	
	

}
