package com.kh.tsp.customer.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.tsp.customer.model.service.BoardService;
import com.kh.tsp.customer.model.vo.Board;

@Controller
public class CustomerBoardDetail {
	@Autowired
	private BoardService bs;
	
	public CustomerBoardDetail() {}
	
	@RequestMapping(value="customerNoticeDetail.cu", method=RequestMethod.GET)
	public String CustomerNoticeDetail(HttpServletRequest request, HttpServletResponse response) {
		int bno = Integer.parseInt(request.getParameter("num"));
		
		System.out.println("bno: "+bno);
		
		Board b = bs.selectOneNotice(bno); 
		
		request.setAttribute("b", b);
		return "customer/board/Customer_notice_detail";
	}
	
	@RequestMapping(value="reviewDetail.cu", method=RequestMethod.GET)
	public String MyReviewDetail() {
		
		return "customer/board/My_review_detail";
	}
	
}
