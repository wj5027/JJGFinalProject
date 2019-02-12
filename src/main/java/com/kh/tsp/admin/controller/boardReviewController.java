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

	// 후기 게시판 검색
	@RequestMapping("selectSearchBoardReviewList.ad")
	public String searchBoardQnAList2(HttpServletRequest request, HttpServletResponse response,
												String selectStatus, String mId, String parkingName, String bTitle, String today, String startDate, String endDate) {

		System.out.println("selectStatus : "+selectStatus);
		System.out.println("mId : "+mId);
		System.out.println("parkingName : "+parkingName);
		System.out.println("bTitle : "+bTitle);
		System.out.println("today : "+today);
		System.out.println("startDate : "+startDate);
		System.out.println("endDate : "+endDate);
		
		int currentPage =1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		try {
			int listCount = bs.getSearchReviewListCount(selectStatus, mId, parkingName, bTitle, today, startDate, endDate);
			System.out.println("listCount : "+listCount);
			PageInfo pi = Pagination.getPageInfo(currentPage,listCount);
			ArrayList<Board> list =bs.selectSearchBoardReviewList(pi, selectStatus, mId, parkingName, bTitle, today, startDate, endDate);
			request.setAttribute("pi", pi);
			request.setAttribute("list", list);

			System.out.println("list : "+list);
			if(listCount==0 || list == null) {
				nullCheck="nullCheck";
				return "redirect:selectBoardReview.ad";
			}else {
				return "admin/board/BoardReview2";
			}
			
		} catch (SelectBoardListException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}

	
}
