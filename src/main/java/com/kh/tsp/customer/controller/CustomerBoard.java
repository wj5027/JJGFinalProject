package com.kh.tsp.customer.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.tsp.customer.model.exception.BoardSelectListException;
import com.kh.tsp.customer.model.service.BoardService;
import com.kh.tsp.customer.model.service.BoardServiceImpl;
import com.kh.tsp.customer.model.vo.Board;

@Controller
public class CustomerBoard {
	@Autowired
	private BoardService bs;
	
	
	public CustomerBoard() {
		
	}
	
	@RequestMapping(value="/customerNotice.cu", method=RequestMethod.GET)
	public String CustomerNotice(Board b, Model model) {
		List<Board> list = bs.selectNoticeList(b);
		model.addAttribute("list", list);
		
		return "customer/board/Customer_notice_list";
	}
	
	
	
	@RequestMapping(value="/review.cu", method=RequestMethod.GET)
	public String CustomerReview() {
		
		
		return "customer/board/My_review_list";
	}
	
	@RequestMapping(value="/qna.cu", method=RequestMethod.GET)
	public String CustomerQnA() {
		
		
		return "customer/board/My_qna_list";
	}
	
	//수정용
	@RequestMapping(value="/updateNotice.cu")
	public String updateNotice() {
		
		return "customer/board/Customer_notice_edit";
	}
	
	//삭제용
	@RequestMapping(value="/deleteNotice.cu")
	public String deleteNotice(HttpServletRequest request, HttpServletResponse response) {
		int bno = Integer.parseInt(request.getParameter("num"));
		System.out.println("삭제컨트롤러: "+bno);
		
		int result = bs.deleteNotice(bno);
		
		if(result > 0) {
			return "redirect:customerNotice.cu";
		}else {
			request.setAttribute("msg", "삭제 실패");
			
			return "common/errorPage";
		}
		
	}
}
