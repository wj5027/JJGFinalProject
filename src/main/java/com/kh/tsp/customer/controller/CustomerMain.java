package com.kh.tsp.customer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.tsp.customer.model.service.CustomerMainService;
import com.kh.tsp.customer.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class CustomerMain {
	
	
	@Autowired
	private CustomerMainService cms;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	public CustomerMain() {
		
	}

	@RequestMapping(value="/customer.cu", method=RequestMethod.GET)
	public String Customer() {
		
		
		return "customer/main/Customer_main";
	}
	
	
	//로그인 메소드
	@RequestMapping(value="allLogin.cu",method=RequestMethod.POST)
	public String allLogin(@ModelAttribute Member m,Model model) {
		try {
			Member loginUser = cms.selectCheckMember(m);
			model.addAttribute("loginUser", loginUser);
			
			if(loginUser.getMember_type().equals("U") || loginUser.getMember_type().equals("u")) {
				return "redirect:customer.cu";				
			}else if(loginUser.getMember_type().equals("A") || loginUser.getMember_type().equals("a")) {
				return "redirect:statisticsList.ad";	
			}else {
				return "redirect:parkingceoMain.pc";	
			}
		}catch(Exception e) {
			model.addAttribute("message", "로그인 실패!");
			return "common/errorPage";
		}
		
	}
	
	//로그 아웃 메소드
	@RequestMapping(value="customerLogOut.cu", method=RequestMethod.GET)
	public String customerLogOut(SessionStatus status) {
		status.setComplete();
		return "redirect:customer.cu";
	}
	
	//관리자 로그아웃 메소드
	@RequestMapping(value="adminLogout.ad")
	public String adminLogOut(SessionStatus status) {
		status.setComplete();
		return "redirect:customer.cu";
	}
	
	@RequestMapping(value="parkingCeoLogout.pc")
	public String parkingCeoLogOut(SessionStatus status) {
		status.setComplete();
		return "redirect:customer.cu";
	}
	
	
	
}
