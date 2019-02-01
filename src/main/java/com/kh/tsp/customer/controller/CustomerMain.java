package com.kh.tsp.customer.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.tsp.customer.model.vo.Member;

@Controller
public class CustomerMain {

	public CustomerMain() {
		
	}

	@RequestMapping(value="/customer.cu", method=RequestMethod.GET)
	public String Customer() {
		
		
		return "customer/main/Customer_main";
	}
	
	
	//로그인 메소드
	@RequestMapping(value="allLogin.cu",method=RequestMethod.POST)
	public String allLogin(@ModelAttribute Member m,Model model) {
		
		System.out.println(m);
		
		return "";
	}
	
	
}
