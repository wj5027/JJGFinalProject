package com.kh.tsp.customer.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.tsp.customer.model.service.AccountService;
import com.kh.tsp.customer.model.vo.Member;

@Controller
public class CustomerAccount {
	@Autowired
	private AccountService as;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	public CustomerAccount() {
		
	}

	
	@RequestMapping(value="/customer_loginPage.cu", method=RequestMethod.GET)
	public String CustomerLogin() {
		
		
		return "customer/main/Customer_login";
	}
	
	@RequestMapping(value="/customer_joinInput.cu", method=RequestMethod.GET)
	public String CustomerjoinInput() {
		
		return "customer/main/Customer_joinInput";
	}
	
	@RequestMapping(value="/customer_join.cu", method=RequestMethod.GET)
	public String Customerjoin() {
		
		
		return "customer/main/Customer_join";
	}
	
	@RequestMapping(value="/customerInfo.cu", method=RequestMethod.GET)
	public String CustomerInfo(Member m, Model model, HttpServletRequest request ) {
		HttpSession session = request.getSession();				
		Member loginUser = (Member)session.getAttribute("loginUser");
		System.out.println("컨트롤러 loginUser: "+loginUser);
		
		m = new Member();
		m.setMember_id(loginUser.getMember_id());
		
		Member myInfo = as.selectMyInfo(m); 
		
		if(myInfo != null) {
			model.addAttribute("list", myInfo);
			
			return "customer/member/Customer_info";
			
		}else {
			model.addAttribute("message", "로그인이 필요한 서비스입니다.");
			
			return "common/errorPage";
		}
		
	}
	//내 정보 수정
	@RequestMapping(value="changeMyInfo.cu", method= {RequestMethod.POST, RequestMethod.GET})
	public String changeMyInfo(@ModelAttribute Member m, Model model) {
		System.out.println("정보 수정 컨트롤러 : "+m);
		int result=0;
		System.out.println("m.getMember_pwd(): "+m.getMember_pwd());
		if(m.getMember_pwd() == "") {
			result = as.changeInfo(m);
			System.out.println("비밀번호 제외한 정보수정");
			
		}else {
			String encPassword = passwordEncoder.encode(m.getMember_pwd());
			m.setMember_pwd(encPassword);
			System.out.println("비밀번호 포함한 정보수정");
			result = as.changePwd(m);
			
		}

		if(result > 0) {
			System.out.println("result1: "+result);
			model.addAttribute("list", m);
			
			return "customer/member/Customer_info";
		}else {
			System.out.println("result2: "+result);

			model.addAttribute("message", "수정 실패");
			
			return "common/errorPage";
		}
		
	}
	
	
}
