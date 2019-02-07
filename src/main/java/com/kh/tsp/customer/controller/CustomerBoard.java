package com.kh.tsp.customer.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.tsp.customer.model.exception.BoardSelectListException;
import com.kh.tsp.customer.model.service.BoardService;
import com.kh.tsp.customer.model.service.BoardServiceImpl;
import com.kh.tsp.customer.model.vo.Board;
import com.kh.tsp.customer.model.vo.Member;

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
	public String CustomerQnA(Board b, HttpServletRequest request,
								HttpServletResponse response) {
		List<Board> list = bs.selectQnaList(b);
		System.out.println("서블릿 list: "+list);
		request.setAttribute("list", list);
		
		//작성자
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		String mno = Integer.toString(loginUser.getMember_no());
				
		b = new Board();		
		b.setMno(mno);
		
		System.out.println("servlet mno: "+mno);
		return "customer/board/My_qna_list";
	}
	
	//공지사항 수정용1
	@RequestMapping(value="/updateNotice.cu")
	public String updateNotice(HttpServletRequest request, HttpServletResponse response) {
		int bno = Integer.parseInt(request.getParameter("num"));
		
		System.out.println("수정 서블릿1 bno : "+bno);
		
		Board b = bs.updateNotice(bno);
		
		request.setAttribute("b", b);
		
		return "customer/board/Customer_notice_edit";
	}
	
	//공지사항 수정용2
	@RequestMapping(value="/updateNotice2.cu")
	public String updateNotice2(HttpServletRequest request, HttpServletResponse response) {
		int bno = Integer.parseInt(request.getParameter("bno"));
		System.out.println("수정 서블릿2 bno : "+bno);
	
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		System.out.println("제목: "+title);
		System.out.println("내용: "+content);
		
		Board b = new Board();
		b.setBno(bno);
		b.setbTitle(title);
		b.setbContext(content);
		
		
		
		int result = bs.updateNotice2(b);
		System.out.println("servlet2 result : "+result);
	
		if(result > 0) {
			return "redirect:customerNotice.cu";
		}else {
			request.setAttribute("message", "수정 실패");
			return "common/errorPage";
		}
		
	}
	
	//공지사항 삭제용
	@RequestMapping(value="/deleteNotice.cu")
	public String deleteNotice(HttpServletRequest request, HttpServletResponse response) {
		int bno = Integer.parseInt(request.getParameter("num"));
		System.out.println("삭제컨트롤러: "+bno);
		
		int result = bs.deleteNotice(bno);
		
		if(result > 0) {
			return "redirect:customerNotice.cu";
		}else {
			request.setAttribute("message", "삭제 실패");
			
			return "common/errorPage";
		}
		
	}
	
	//공지사항 등록
	@RequestMapping(value="/insertNotice.cu")
	public String insertNotice(HttpServletRequest request, HttpServletResponse response) {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		System.out.println("서블릿 title : "+title);
		System.out.println("서블릿 content : "+content);
		
		//작성자
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		String mno = Integer.toString(loginUser.getMember_no());
		
		Board b = new Board();
		b.setbTitle(title);
		b.setbContext(content);
		b.setMno(mno);
		
		System.out.println("서블릿 mno : "+mno);
		if(loginUser == null) {
			request.setAttribute("message", "로그인하세요");
		}
		int result = bs.insertNotice(b);
		
		if(result > 0) {
			
			return "redirect:customerNotice.cu";
			
		}else {
			
			request.setAttribute("message", "등록 실패");
			
			return "common/errorPage";
		}
		
	}
	
	//문의 등록
	@RequestMapping(value="/insertQna.cu")
	public String insertQna(HttpServletRequest request, HttpServletResponse response) {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		System.out.println("문의 등록서블릿 title : "+title);
		System.out.println("문의 등록서블릿 content : "+content);
		
		//작성자
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		String mno = Integer.toString(loginUser.getMember_no());
		
		Board b = new Board();
		b.setbTitle(title);
		b.setbContext(content);
		b.setMno(mno);
		
		System.out.println("서블릿 mno : "+mno);
		if(loginUser == null) {
			request.setAttribute("message", "로그인하세요");
		}
		int result = bs.insertQna(b);
		
		if(result > 0) {
			
			return "redirect:qna.cu";
			
		}else {
			
			request.setAttribute("message", "등록 실패");
			
			return "common/errorPage";
		}
	}
	
	//문의 수정1
	@RequestMapping(value="/updateQna.cu")
	public String updateQna(HttpServletRequest request, HttpServletResponse response) {
		int bno = Integer.parseInt(request.getParameter("num"));
		
		System.out.println("수정 서블릿1 bno : "+bno);
		
		Board b = bs.updateQna(bno);
		
		request.setAttribute("b", b);
		
		return "customer/board/My_qna_edit";
		
	}
	
	//문의 수정2
		@RequestMapping(value="/updateQna2.cu")
		public String updateQna2(HttpServletRequest request, HttpServletResponse response) {
			int bno = Integer.parseInt(request.getParameter("bno"));
			System.out.println("수정 서블릿2 bno : "+bno);
		
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			System.out.println("제목: "+title);
			System.out.println("내용: "+content);
			
			Board b = new Board();
			b.setBno(bno);
			b.setbTitle(title);
			b.setbContext(content);
			
			
			
			int result = bs.updateQna2(b);
			System.out.println("servlet2 result : "+result);
		
			if(result > 0) {
				return "redirect:qna.cu";
			}else {
				request.setAttribute("message", "수정 실패");
				return "common/errorPage";
			}
			
		}
	//문의 삭제
	@RequestMapping(value="/deleteQna.cu", method=RequestMethod.GET)
	public String deleteQna(@RequestParam("bno")String bno, Model model) {
		System.out.println("삭제 서블릿 bno : "+bno);
		
		int result = bs.deleteQna(Integer.parseInt(bno));
		
		if(result > 0) {
			
			return "redirect:qna.cu";
		}else {
			model.addAttribute("message", "문의 삭제 실패");
			
			return "common/errorPage";
		}
		
	}
		
	
}
