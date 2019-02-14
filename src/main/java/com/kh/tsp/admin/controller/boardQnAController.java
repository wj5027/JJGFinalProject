package com.kh.tsp.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.tsp.admin.model.exception.SelectBoardListException;
import com.kh.tsp.admin.model.service.BoardAdminService;
import com.kh.tsp.admin.model.vo.ReplyAdmin;
import com.kh.tsp.common.PageInfo;
import com.kh.tsp.common.Pagination;
import com.kh.tsp.customer.model.vo.Board;


@Controller
public class boardQnAController {

	String nullCheck=null;
	
	@Autowired
	private BoardAdminService bs;

	@RequestMapping("goSearchBoardQnAPage.ad")
	public String goMain() {
		return "admin/board/BoardQnA";
	}
	
	// 문의게시판 전체 조회
	@RequestMapping(value = "/selectBoardQnA.ad", method = RequestMethod.GET)
	public String boardQnA(HttpServletRequest request, HttpServletResponse response) {

		int currentPage =1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		try {
			int listCount = bs.getListCount();
			PageInfo pi = Pagination.getPageInfo(currentPage,listCount);
			ArrayList<Board> list =bs.selectBoardQnAList(pi);
			request.setAttribute("pi", pi);
			request.setAttribute("list", list);
			
			System.out.println("nullCheck : "+nullCheck);
			
			if(nullCheck != null) {
				request.setAttribute("nullCheck", nullCheck);
				nullCheck=null;
			}
						
			return "admin/board/BoardQnA";
			
		} catch (SelectBoardListException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	// 문의게시판 삭제
	@RequestMapping("deleteBoardQnA.ad")
	public String deleteBoardQnA(String boardNo, Model model){
		System.out.println("boardNo : "+boardNo);

		Board b = new Board();
		b.setBno(Integer.parseInt(boardNo));
		
		int result=0;

		System.out.println("b : "+b);
		
		try {
			result = bs.deleteBoardQnA(b);
			return "redirect:selectBoardQnA.ad";
		} catch (SelectBoardListException e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}

	// 문의게시판 복구
	@RequestMapping("updateRecoverBoardQnA.ad")
	public String updateRecoverBoardQnA(String boardNo, Model model){
		System.out.println("boardNo : "+boardNo);

		Board b = new Board();
		b.setBno(Integer.parseInt(boardNo));
		
		int result=0;

		System.out.println("b : "+b);
		
		try {
			result = bs.updateRecoverBoardQnA(b);
			return "redirect:selectBoardQnA.ad";
		} catch (SelectBoardListException e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}

	// 문의 게시판 검색
	@RequestMapping(value = "/selectSearchBoardQnAList.ad", method = {RequestMethod.GET, RequestMethod.POST})
	public String searchBoardQnAList2(HttpServletRequest request, HttpServletResponse response,
												String selectStatus, String mId, String bTitle, String today, String startDate, String endDate) {
		
		int currentPage =1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		try {
			int listCount = bs.getSearchListCount(selectStatus, mId, bTitle, today, startDate, endDate);
			System.out.println("listCount : "+listCount);
			PageInfo pi = Pagination.getPageInfo(currentPage,listCount);
			ArrayList<Board> list =bs.selectSearchBoardQnAList(pi, selectStatus, mId, bTitle, today, startDate, endDate);
			request.setAttribute("pi", pi);
			request.setAttribute("list", list);

			request.setAttribute("selectStatus", selectStatus);
			request.setAttribute("mId", mId);
			request.setAttribute("bTitle", bTitle);
			request.setAttribute("today", today);
			request.setAttribute("startDate", startDate);
			request.setAttribute("endDate", endDate);

			System.out.println("list : "+list);
			if(listCount==0 || list == null) {
				nullCheck="nullCheck";
				return "redirect:selectBoardQnA.ad";
			}else {
				return "admin/board/BoardQnA2";		
			}
			
		} catch (SelectBoardListException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	// 문의 게시판 답변 ajax
	@RequestMapping("answerBoardQnA.ad")
	public @ResponseBody Board answerBoardQnA(String bno, HttpServletResponse response) {

		System.out.println("bno : "+bno);

		Board b = new Board();
		b.setBno(Integer.parseInt(bno));

		System.out.println("b : "+b);
		
		try {
			b = bs.answerBoardQnA(b);
		} catch (SelectBoardListException e) {
			e.printStackTrace();
		}
		
		return b;
	}
	
	// 답변 작성
	@RequestMapping("insertAnswerBoard.ad")
	public String insertAnswerBoard(String bno, String mno, String textareaId, Model model) {

		System.out.println("bno : "+bno);
		System.out.println("mno : "+mno);
		System.out.println("textareaId : "+textareaId);
		
		int result=0;
		
		try {
			result = bs.insertAnswerBoard(bno, mno, textareaId);
			return "redirect:selectBoardQnA.ad";
		} catch (SelectBoardListException e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	// 답변 수정
	@RequestMapping("updateAnswerBoard.ad")
	public String updateAnswerBoard(String updateTextareaId, String replyNo, Model model) {

		System.out.println("updateTextareaId : "+updateTextareaId);
		System.out.println("replyNo : "+replyNo);
		
		int result=0;
		
		try {
			result = bs.updateAnswerBoard(updateTextareaId, replyNo);
			return "redirect:selectBoardQnA.ad";
		} catch (SelectBoardListException e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
}
