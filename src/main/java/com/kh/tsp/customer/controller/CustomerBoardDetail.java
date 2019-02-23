package com.kh.tsp.customer.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.tsp.customer.model.service.BoardService;
import com.kh.tsp.customer.model.service.CustomerMainService;
import com.kh.tsp.customer.model.vo.Board;
import com.kh.tsp.customer.model.vo.Member;
import com.kh.tsp.customer.model.vo.Reply;

@Controller
public class CustomerBoardDetail {
	@Autowired
	private BoardService bs;
	@Autowired
	private CustomerMainService cms;
	
	public CustomerBoardDetail() {}
	//공지사항 상세보기
	@RequestMapping(value="customerNoticeDetail.cu", method=RequestMethod.GET)
	public String CustomerNoticeDetail(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		int bno = Integer.parseInt(request.getParameter("num"));
		
		System.out.println("bno: "+bno);
		
		Board b = bs.selectOneNotice(bno); 
		
		request.setAttribute("b", b);
		
		// 오일 조회
		if ((Member)session.getAttribute("loginUser") != null) {
			int UserOilInfo = Integer.parseInt(cms.getRefreshMember((Member)session.getAttribute("loginUser")).getOil());
			
			request.setAttribute("UserOilInfo", UserOilInfo);
		}
		
		return "customer/board/Customer_notice_detail";
	}
	//후기 상세보기
	@RequestMapping(value="reviewDetail.cu", method=RequestMethod.GET)
	public String MyReviewDetail(String num, Model model, HttpSession session, HttpServletRequest request) {
		
		int bno = Integer.parseInt(num);
		
		System.out.println("후기 상세보기 bno: "+bno);
		
		Board b = bs.selectOneReview(bno);
		
		model.addAttribute("b", b);
		
		// 오일 조회
		if ((Member)session.getAttribute("loginUser") != null) {
			int UserOilInfo = Integer.parseInt(cms.getRefreshMember((Member)session.getAttribute("loginUser")).getOil());
			
			request.setAttribute("UserOilInfo", UserOilInfo);
		}
		
		return "customer/board/My_review_detail";
	}
	
	//내 문의 상세보기
	@RequestMapping(value="qnaDetail.cu", method=RequestMethod.GET)
	public String MyQnaDetail(Board b,HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		int bno = Integer.parseInt(request.getParameter("num"));
		System.out.println("문의상세보기 서블릿 bno: "+bno);
	
		//상세내용
		b = bs.selectOneQna(bno); 
		//댓글
		ArrayList<Reply> reply = bs.selectReply(bno);
		
		if(b != null) {
			if(reply!=null) {
				request.setAttribute("reply", reply);
				System.out.println("댓글 : "+reply);
			}
			
			request.setAttribute("b", b);
		}else {
			return "common/errorPage";
		}
		
		// 오일 조회
		if ((Member)session.getAttribute("loginUser") != null) {
			int UserOilInfo = Integer.parseInt(cms.getRefreshMember((Member)session.getAttribute("loginUser")).getOil());
			
			request.setAttribute("UserOilInfo", UserOilInfo);
		}

		return "customer/board/My_qna_detail";
	}
	
	//주차장 문의(사업자문의) 상세보기
	@RequestMapping(value="parkingQnaDetail.cu", method=RequestMethod.GET)
	public String ParkingQnaDetail(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		int bno = Integer.parseInt(request.getParameter("num"));
		System.out.println("주차장 문의상세보기 서블릿 bno: "+bno);
		
		String pno = request.getParameter("pno");
				
		System.out.println("주차장문의상세보기 pno : "+pno);
		Board b = bs.selectOneParkingQna(bno); 
		//댓글
		ArrayList<Reply> reply = bs.selectParkingReply(bno);
		
		if(b != null) {
			if(reply!=null) {
				request.setAttribute("reply", reply);
				System.out.println("댓글 : "+reply);
			}
			

		}else {
			
			return "common/errorPage";
		}
		request.setAttribute("b", b);
		request.setAttribute("pno", pno);
		
		// 오일 조회
		if ((Member)session.getAttribute("loginUser") != null) {
			int UserOilInfo = Integer.parseInt(cms.getRefreshMember((Member)session.getAttribute("loginUser")).getOil());
			
			request.setAttribute("UserOilInfo", UserOilInfo);
		}
		
		return "customer/board/Parking_qna_detail";
	}
	
	//주차장 후기 상세보기	
	@RequestMapping(value="parkingReviewDetail.cu", method=RequestMethod.GET)
	public String ParkingReviewDetail(HttpServletRequest request, HttpServletResponse response) {
		int bno = Integer.parseInt(request.getParameter("num"));
		System.out.println("주차장 후기상세보기 서블릿 bno: "+bno);
		
		String pno = request.getParameter("pno");		
		System.out.println("주차장문의상세보기 pno : "+pno);

		//글내용
		Board b = bs.selectOneParkingReview(bno); 
		
		//댓글
		ArrayList<Reply> reply = bs.selectReviewReply(bno);
		
		//작성자
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		if(b != null) {
			if(reply!=null) {
				request.setAttribute("reply", reply);
				System.out.println("댓글 : "+reply);
			}
		
		}else {
			return "common/errorPage";
		}
		
		request.setAttribute("b", b);
		request.setAttribute("pno", pno);
		request.setAttribute("loginUser", loginUser);
		
		// 오일 조회
		if ((Member)session.getAttribute("loginUser") != null) {
			int UserOilInfo = Integer.parseInt(cms.getRefreshMember((Member)session.getAttribute("loginUser")).getOil());
			
			request.setAttribute("UserOilInfo", UserOilInfo);
		}
		
		return "customer/board/Parking_review_detail";
	}
}
