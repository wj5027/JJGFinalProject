package com.kh.tsp.parkingceo.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.tsp.common.MailUtil;


@Controller
public class MailSender {

	@Autowired
	JavaMailSender SendingMail;
	
	
	public MailSender() {
		// TODO Auto-generated constructor stub
	}
	
	
	//이메일 인증 메소드
	@RequestMapping(value="mailSender.pc", method=RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> mailSenderMethod(@RequestParam String code,@RequestParam String userEmail,HttpServletResponse response) throws MessagingException, UnsupportedEncodingException{
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		//임시 5자리 번호
		System.out.println(code);
		//유저 이메일
		System.out.println(userEmail);
		MailUtil sendMail = new MailUtil(SendingMail);
		sendMail.setSubject("지주갑 사업자 회원 인증 메일입니다.");
		sendMail.setText(new StringBuffer().append("<h1>이메일 인증 번호입니다.</h1>").append("회원님의 인증 번호는 : "+code + "입니다.").toString());
		sendMail.setFrom("matthaeus5370@gmail.com", "관리자");
		sendMail.setTo(userEmail);
		sendMail.send();
		hmap.put("sendMail", "성공");
		return hmap;
	}
	
	
}
