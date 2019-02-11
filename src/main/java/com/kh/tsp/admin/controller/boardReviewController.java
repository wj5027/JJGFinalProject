package com.kh.tsp.admin.controller;

import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.tsp.admin.model.exception.SelectBoardListException;
import com.kh.tsp.admin.model.service.BoardAdminService;
import com.kh.tsp.common.PageInfo;
import com.kh.tsp.common.Pagination;
import com.kh.tsp.customer.model.vo.Board;


@Controller
public class boardReviewController {

	String nullCheck=null;
	
	@Autowired
	private BoardAdminService bs;

	@RequestMapping("goSearchBoardReviewPage.ad")
	public String goMain() {
		return "admin/board/BoardReview";
	}

	// 후기 게시판
	@RequestMapping(value = "/selectBoardReview.ad", method = RequestMethod.GET)
	public String boardReview(HttpServletRequest request, HttpServletResponse response) {

		int currentPage =1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		try {
			int listCount = bs.getReviewListCount();
			PageInfo pi = Pagination.getPageInfo(currentPage,listCount);
			ArrayList<Board> list =bs.selectBoardReviewList(pi);
			request.setAttribute("pi", pi);
			request.setAttribute("list", list);
			
			System.out.println("nullCheck : "+nullCheck);
			
			if(nullCheck != null) {
				request.setAttribute("nullCheck", nullCheck);
				nullCheck=null;
			}
						
			return "admin/board/BoardReview";
			
		} catch (SelectBoardListException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	// 후기 게시판 답변 ajax
	@RequestMapping("detailBoardReview.ad")
	public @ResponseBody Board detailBoardReview(String bno, HttpServletResponse response) {

		System.out.println("bno : "+bno);

		Board b = new Board();
		b.setBno(Integer.parseInt(bno));

		System.out.println("b : "+b);
		
		try {
			b = bs.detailBoardReview(b);
		} catch (SelectBoardListException e) {
			e.printStackTrace();
		}
		
		return b;
	}
	

	// 후기게시판 삭제
	@RequestMapping("deleteBoardReview.ad")
	public String deleteBoardReview(String boardNo, Model model){
		System.out.println("boardNo : "+boardNo);

		Board b = new Board();
		b.setBno(Integer.parseInt(boardNo));
		
		int result=0;

		System.out.println("b : "+b);
		
		try {
			result = bs.deleteBoardReview(b);
			return "redirect:selectBoardReview.ad";
		} catch (SelectBoardListException e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}

	// 후기게시판 복구
	@RequestMapping("updateRecoverBoardReview.ad")
	public String updateRecoverBoardReview(String boardNo, Model model){
		System.out.println("boardNo : "+boardNo);

		Board b = new Board();
		b.setBno(Integer.parseInt(boardNo));
		
		int result=0;

		System.out.println("b : "+b);
		
		try {
			result = bs.updateRecoverBoardReview(b);
			return "redirect:selectBoardReview.ad";
		} catch (SelectBoardListException e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}

	
}
