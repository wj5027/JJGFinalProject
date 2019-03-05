package com.kh.tsp.customer.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.tsp.common.PageInfo;
import com.kh.tsp.common.Pagination;
import com.kh.tsp.customer.model.exception.BoardSelectListException;
import com.kh.tsp.customer.model.service.BoardService;
import com.kh.tsp.customer.model.service.BoardServiceImpl;
import com.kh.tsp.customer.model.service.CustomerMainService;
import com.kh.tsp.customer.model.vo.Board;
import com.kh.tsp.customer.model.vo.Filter;
import com.kh.tsp.customer.model.vo.Member;
import com.kh.tsp.customer.model.vo.Reply;


@Controller
public class CustomerBoard {
	@Autowired
	private BoardService bs;
	@Autowired
	private CustomerMainService cms;
	
	public CustomerBoard() {
		
	}
	
	@RequestMapping(value="/customerNotice.cu", method=RequestMethod.GET)
	public String CustomerNotice(Board b, Model model,HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		/*List<Board> list = bs.selectNoticeList(b);
		model.addAttribute("list", list);
		
		return "customer/board/Customer_notice_list";*/
		
		int currentPage = 1;
				 
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
				
		int listCount = bs.getNoticeListCount();
		System.out.println("공지 전체게시글 수 : "+listCount);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
				
		ArrayList<Board> list = bs.selectNoticeList(pi);
		
		// 오일 조회
		if ((Member)session.getAttribute("loginUser") != null) {
			int UserOilInfo = Integer.parseInt(cms.getRefreshMember((Member)session.getAttribute("loginUser")).getOil());
			
			request.setAttribute("UserOilInfo", UserOilInfo);
		}

		if(list == null) {
			model.addAttribute("msg", "공지 목록 불러오기 실패");
			return "common/errorPage";
		}else {
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			model.addAttribute("b", b);
					
			return "customer/board/Customer_notice_list";
		}
				
				
	}
	
	
	//내 후기 목록
	@RequestMapping(value="/review.cu", method=RequestMethod.GET)
	public String CustomerReview(Board b, Model model,HttpServletRequest request,
			HttpServletResponse response) {
		
		//작성자
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		int mno = loginUser.getMember_no();
		System.out.println("내후기목록 mno : "+mno);
		int currentPage = 1;
		 
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = bs.getMyReviewListCount(mno);
		System.out.println("내 후기 전체게시글 수 : "+listCount);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Board> list = bs.selectReviewList(pi, mno);
		System.out.println("컨트롤러 list: "+list);

		// 오일 조회
		if ((Member)session.getAttribute("loginUser") != null) {
			int UserOilInfo = Integer.parseInt(cms.getRefreshMember((Member)session.getAttribute("loginUser")).getOil());
			
			request.setAttribute("UserOilInfo", UserOilInfo);
		}
		
		if(list == null) {
			request.setAttribute("msg", "후기 목록 불러오기 실패");
			return "common/errorPage";
		}else {
			request.setAttribute("loginUser", loginUser);
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
			request.setAttribute("b", b);
			request.setAttribute("mno", mno);
			
			return "customer/board/My_review_list";
		}
		
		
		
	}
	//내 문의 목록
	@RequestMapping(value="/qna.cu", method=RequestMethod.GET)
	public String CustomerQnA(Board b, HttpServletRequest request,
								HttpServletResponse response) {
		
		//작성자
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		int mno = loginUser.getMember_no();

		System.out.println("내문의 목록 mno: "+mno);
		int currentPage = 1;
				 
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
				
		int listCount = bs.getMyQnaListCount(mno);
		System.out.println("문의 전체게시글 수 : "+listCount);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
				
		ArrayList<Board> list = bs.selectQnaList(pi, mno);
		
		// 오일 조회
		if ((Member)session.getAttribute("loginUser") != null) {
			int UserOilInfo = Integer.parseInt(cms.getRefreshMember((Member)session.getAttribute("loginUser")).getOil());
			
			request.setAttribute("UserOilInfo", UserOilInfo);
		}

		if(list == null) {
			request.setAttribute("message", "문의 목록 불러오기 실패");
			return "common/errorPage";
		}else {
			request.setAttribute("loginUser", loginUser);
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
					
			return "customer/board/My_qna_list";
		}
						
	}
	
	//공지사항 수정용1
	@RequestMapping(value="/updateNotice.cu")
	public String updateNotice(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		int bno = Integer.parseInt(request.getParameter("num"));
		
		System.out.println("수정 서블릿1 bno : "+bno);
		
		Board b = bs.updateNotice(bno);
		
		request.setAttribute("b", b);
		
		// 오일 조회
		if ((Member)session.getAttribute("loginUser") != null) {
			int UserOilInfo = Integer.parseInt(cms.getRefreshMember((Member)session.getAttribute("loginUser")).getOil());
			
			request.setAttribute("UserOilInfo", UserOilInfo);
		}
		
		return "customer/board/Customer_notice_edit";
	}
	
	//공지사항 수정용2
	@RequestMapping(value="/updateNotice2.cu")
	public String updateNotice2(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
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
		
		// 오일 조회
		if ((Member)session.getAttribute("loginUser") != null) {
			int UserOilInfo = Integer.parseInt(cms.getRefreshMember((Member)session.getAttribute("loginUser")).getOil());
			
			request.setAttribute("UserOilInfo", UserOilInfo);
		}
		
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
	public String updateQna(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		int bno = Integer.parseInt(request.getParameter("num"));
		
		System.out.println("수정 서블릿1 bno : "+bno);
		
		Board b = bs.updateQna(bno);
		
		request.setAttribute("b", b);
		
		// 오일 조회
		if ((Member)session.getAttribute("loginUser") != null) {
			int UserOilInfo = Integer.parseInt(cms.getRefreshMember((Member)session.getAttribute("loginUser")).getOil());
			
			request.setAttribute("UserOilInfo", UserOilInfo);
		}
		
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
	public String deleteQna(String bno) {
		
		
		System.out.println("삭제 서블릿 bno : "+bno);
		
		int result = bs.deleteQna(Integer.parseInt(bno));
		
		if(result > 0) {
			
			return "redirect:qna.cu";
		}else {
			/*model.addAttribute("message", "문의 삭제 실패");*/
			
			return "common/errorPage";
		}
		
	}
		
	//후기 등록
	@RequestMapping(value="/insertReview.cu", method=RequestMethod.POST)
	public String insertReview(HttpServletRequest request, HttpServletResponse response) {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		System.out.println("후기 등록서블릿 title : "+title);
		System.out.println("후기 등록서블릿 content : "+content);
		
		//작성자
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		String mno = Integer.toString(loginUser.getMember_no());
		String pno = request.getParameter("pno");
		
		Board b = new Board();
		b.setbTitle(title);
		b.setbContext(content);
		b.setMno(mno);
		b.setPno(pno);
		
		System.out.println("서블릿 mno : "+mno);
		System.out.println("서블릿pno : "+pno);
		if(loginUser == null) {
			request.setAttribute("message", "로그인하세요");
		}
		int result = bs.insertReview(b);
		
		if(result > 0) {
			
			return "redirect:review.cu";
			
		}else {
			
			request.setAttribute("message", "등록 실패");
			
			return "common/errorPage";
		}
	}
	
	//후기 수정1
	@RequestMapping(value="/updateReview.cu")
	public String updateReview(String num, Model model, HttpSession session, HttpServletRequest request) {
		int bno = Integer.parseInt(num);
		
		System.out.println("후기 수정 서블릿1 bno : "+bno);
		
		Board b = bs.updateReview(bno);
		
		model.addAttribute("b", b);
		
		// 오일 조회
		if ((Member)session.getAttribute("loginUser") != null) {
			int UserOilInfo = Integer.parseInt(cms.getRefreshMember((Member)session.getAttribute("loginUser")).getOil());
			
			request.setAttribute("UserOilInfo", UserOilInfo);
		}
		
		return "customer/board/My_review_edit";
		
	}
	
	//후기 수정2
	@RequestMapping(value="/updateReview2.cu")
	public String updateReview(String num, String title, String content, Model model) {
		int bno = Integer.parseInt(num);
		System.out.println("수정 서블릿2 bno : "+bno);
		
		System.out.println("제목: "+title);
		System.out.println("내용: "+content);
		
		Board b = new Board();
		b.setBno(bno);
		b.setbTitle(title);
		b.setbContext(content);
		
		int result = bs.updateReview2(b);
		System.out.println("servlet2 result : "+result);
	
		if(result > 0) {
			return "redirect:review.cu";
		}else {
			model.addAttribute("message", "수정 실패");
			return "common/errorPage";
		}
		
	}
	//후기 삭제
	@RequestMapping(value="/deleteReview.cu", method=RequestMethod.GET)
	public String delteReview(String num, Model model) {
		int bno = Integer.parseInt(num);
		
		int result = bs.deleteReview(bno);
		
		if(result > 0) {
			return "redirect:review.cu";
		}else {
			model.addAttribute("message", "삭제 실패");
			return "common/errorPage";
		}
	}
	
	//주차장 문의 목록
	@RequestMapping(value="/parkingQna.cu", method=RequestMethod.GET)
	public String parkingQna(Board b, Model model,HttpServletRequest request,
			HttpServletResponse response) {
		//주차장 번호 가져오기
		String pno = request.getParameter("num");
		
		System.out.println("(주차장 문의 목록) 주차장번호: "+pno);
		//주차장 이름 가져오기
		String pName = request.getParameter("pName");
		System.out.println("(주차장문의 목록)주차장이름: "+pName);
		
		//작성자
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		//String mno = Integer.toString(loginUser.getMember_no());
		
		// 오일 조회
		if ((Member)session.getAttribute("loginUser") != null) {
			int UserOilInfo = Integer.parseInt(cms.getRefreshMember((Member)session.getAttribute("loginUser")).getOil());
			
			request.setAttribute("UserOilInfo", UserOilInfo);
		}
		
		int currentPage = 1;
						 
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
						
		int listCount = bs.getParkingQnaListCount(pno);
			System.out.println("주차장 문의 전체게시글 수 : "+listCount);
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
				
			ArrayList<Board> list = bs.selectParkingQnaList(pi, pno);
						

			if(list == null) {
				request.setAttribute("message", "주차장 문의 목록 불러오기 실패");
				
				return "common/errorPage";
				
			}else {
				
				
				request.setAttribute("loginUser", loginUser);
				request.setAttribute("list", list);
				request.setAttribute("pi", pi);
				request.setAttribute("pno", pno);	
				request.setAttribute("pName", pName);
				
				return "customer/board/Parking_qna_list";
			}
		
	}
	//주차장 후기 목록
	@RequestMapping(value="parkingReview.cu", method=RequestMethod.GET)
	public String parkingReview(Board b, Model model,HttpServletRequest request,
			HttpServletResponse response) {
		//주차장 번호 가져오기
		String pno = request.getParameter("num");		
		System.out.println("(주차장후기)주차장번호: "+pno);
		
		//주차장 이름 가져오기
		String pName = request.getParameter("pName");
		System.out.println("(주차장후기)주차장이름: "+pName);
		//작성자
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		//String mno = Integer.toString(loginUser.getMember_no());

		int currentPage = 1;
		
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
							
		int listCount = bs.getReviewListCount(pno);
		System.out.println("주차장 후기 전체게시글 수 : "+listCount);

		// 오일 조회
		if ((Member)session.getAttribute("loginUser") != null) {
			int UserOilInfo = Integer.parseInt(cms.getRefreshMember((Member)session.getAttribute("loginUser")).getOil());
			
			request.setAttribute("UserOilInfo", UserOilInfo);
		}
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
						
		ArrayList<Board> list = bs.selectParkingReviewList(pi, pno);
		int replyCnt =0;						

		if(list == null) {
			request.setAttribute("message", "주차장 후기 목록 불러오기 실패");
					
			return "common/errorPage";
						
		}else {
						
			request.setAttribute("loginUser", loginUser);
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
			request.setAttribute("pno", pno);	
			request.setAttribute("pName", pName);
			
			return "customer/board/Parking_review_list";
		}
	}
	
	//주차장 후기 등록
	@ResponseBody
	@RequestMapping(value="/insertParkingReview.cu", method=RequestMethod.POST)
	public String insertParkingReview(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		
		System.out.println("주차장 후기 등록서블릿 title : "+title);
		System.out.println("주차장 후기 등록서블릿 content : "+content);
			
		//작성자
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		String mno = Integer.toString(loginUser.getMember_no());
		String pno = request.getParameter("pno");
		String chkResult ="";
		
		boolean yn = true;//성공
		
		ArrayList<String> arr = bs.selectWord();
				System.out.println("비속어arr: "+arr);
		
		for(int i=0;i<arr.size();i++) {
			//arr.get(i).indexOf(content);
			content.contains(arr.get(i));
			System.out.println(content.contains(arr.get(i)));

			if(content.contains(arr.get(i))) {
				yn = false;//실패(금칙어 발견)
							
			}
		}
			if(yn) {//정상등록
				System.out.println("후기작성성공 yn: "+yn);
				
				Board b = new Board();
				b.setbTitle(title);
				b.setbContext(content);
				b.setMno(mno);
				b.setPno(pno);
					
				System.out.println("서블릿 mno : "+mno);
				System.out.println("서블릿pno : "+pno);
				
				if(loginUser == null) {
					request.setAttribute("message", "로그인하세요");
				}
				
				int result = bs.insertParkingReview(b);
					
				if(result > 0) {
					request.setAttribute("b", b);
					request.setAttribute("pno", pno);	
					return "redirect:parkingReview.cu?num="+pno;
						
				}else {
						
					request.setAttribute("message", "등록 실패");
						
					return "common/errorPage";
				}
			}else {
				System.out.println("후기작성실패 yn: "+yn);
				chkResult = "unavailable";
				
				return chkResult;
			}
		}
	


	
	
	
	//주차장 후기 수정1
		@RequestMapping(value="/updateParkingReview.cu")
		public String updateParkingReview(String num, String pno, Model model, HttpSession session, HttpServletRequest request) {
			int bno = Integer.parseInt(num);			
			System.out.println("주차장 후기 수정 서블릿1 bno : "+bno);
			
			System.out.println("주차장 후기 수정1 pno : "+pno);
			
			Board b = bs.updateParkingReview(bno);
			
			model.addAttribute("b", b);
			model.addAttribute("pno", pno);
			
			// 오일 조회
			if ((Member)session.getAttribute("loginUser") != null) {
				int UserOilInfo = Integer.parseInt(cms.getRefreshMember((Member)session.getAttribute("loginUser")).getOil());
				
				request.setAttribute("UserOilInfo", UserOilInfo);
			}
			
			return "customer/board/Parking_review_edit";
			
		}
	
		//주차장 후기2
		@RequestMapping(value="/updateParkingReview2.cu")
		public String updateParkingReview(String num, String pno, String pName, String title, String content, Model model) {
			int bno = Integer.parseInt(num);
			System.out.println("주차장 수정 서블릿2 bno : "+bno);
			
			System.out.println("제목: "+title);
			System.out.println("내용: "+content);
			System.out.println("주차장 후기 수정2 pno: "+pno);
			System.out.println("주차장 후기 수정2 pName : "+pName);
			Board b = new Board();
			b.setBno(bno);
			b.setbTitle(title);
			b.setbContext(content);
			b.setPno(pno);
			
			int result = bs.updateParkingReview2(b);
			System.out.println("servlet2 result : "+result);
		
			if(result > 0) {
				model.addAttribute("b", b);
				return "redirect:parkingReview.cu?num="+pno;
			}else {
				model.addAttribute("message", "수정 실패");
				return "common/errorPage";
			}
			
		}
		
		//후기 삭제
		@RequestMapping(value="/deleteParkingReview.cu", method=RequestMethod.GET)
		public String delteParkingReview(String num, String pno, String pName,Model model) {
			int bno = Integer.parseInt(num);
			System.out.println("후기 삭제 pno : "+pno);
			int result = bs.deleteReview(bno);
			System.out.println("후기 삭제 pName: "+pName);
			
			if(result > 0) {
				model.addAttribute("pName", pName);
				return "redirect:parkingReview.cu?num="+pno;
			}else {
				model.addAttribute("message", "삭제 실패");
				return "common/errorPage";
			}
		}		
		
	//주차장 문의 수정1(상세보기)
		@RequestMapping(value="/updateParkingQna.cu")
		public String updateParkingQna(String num, String pno, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
			int bno = Integer.parseInt(request.getParameter("num"));
			
			System.out.println("주차장 문의 수정 서블릿1 bno : "+bno);
			
			Board b = bs.updateParkingQna(bno);
			
			request.setAttribute("b", b);
			request.setAttribute("pno", pno);
			
			// 오일 조회
			if ((Member)session.getAttribute("loginUser") != null) {
				int UserOilInfo = Integer.parseInt(cms.getRefreshMember((Member)session.getAttribute("loginUser")).getOil());
				
				request.setAttribute("UserOilInfo", UserOilInfo);
			}
			
			return "customer/board/Parking_qna_edit";
			
		}		
		
	//주차장 문의 수정2(등록)
		@RequestMapping(value="/updateParkingQna2.cu")
		public String updateParkingQna2(String num, String pno, String pName, HttpServletRequest request, HttpServletResponse response) {
			int bno = Integer.parseInt(request.getParameter("bno"));
			System.out.println("주차장 수정 서블릿2 bno : "+bno);
		
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			System.out.println("제목: "+title);
			System.out.println("내용: "+content);
			System.out.println("주차장 후기 수정2 pno: "+pno);
			System.out.println("주차장 후기 수정2 pName : "+pName);
			
			Board b = new Board();
			b.setBno(bno);
			b.setbTitle(title);
			b.setbContext(content);
			b.setPno(pno);
			
			int result = bs.updateParkingQna2(b);
			System.out.println("servlet2 result : "+result);
		
			if(result > 0) {
				request.setAttribute("b", b);
				
				return "redirect:parkingQna.cu?num="+pno;
			}else {
				request.setAttribute("message", "수정 실패");
				
				return "common/errorPage";
			}
			
		}		
		
	//주차장 문의 등록
		@RequestMapping(value="/insertParkingQna.cu")
		public String insertParkingQna(HttpServletRequest request, HttpServletResponse response) {
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String pno = request.getParameter("pno");
			
			System.out.println("주차장 문의 등록서블릿 title : "+title);
			System.out.println("주차장 문의 등록서블릿 content : "+content);
			
			//작성자
			HttpSession session = request.getSession();
			Member loginUser = (Member)session.getAttribute("loginUser");
			String mno = Integer.toString(loginUser.getMember_no());
			
			
			Board b = new Board();
			b.setbTitle(title);
			b.setbContext(content);
			b.setMno(mno);
			b.setPno(pno);
			
			System.out.println("주차장문의 등록 서블릿 mno : "+mno);
			System.out.println("주차장문의 등록 서블릿 pno : "+pno);
			
			if(loginUser == null) {
				request.setAttribute("message", "로그인하세요");
			}
			int result = bs.insertParkingQna(b);
			
			if(result > 0) {
				request.setAttribute("pno", pno);	
				request.setAttribute("b", b);
				
				return "redirect:parkingQna.cu?num="+pno;
				
			}else {
				
				request.setAttribute("message", "등록 실패");
				
				return "common/errorPage";
			}
		}		
		
		//주차장 문의 삭제
		@RequestMapping(value="/deleteParkingQna.cu", method=RequestMethod.GET)
		public String deleteParkingQna(String bno, String pno, String pName,Model model) {
			
			
			System.out.println("삭제 서블릿 bno : "+bno);
			System.out.println("주차장 문의 삭제 pName: "+pName);
			
			int result = bs.deleteQna(Integer.parseInt(bno));
			
			if(result > 0) {
				model.addAttribute("pName", pName);
				
				return "redirect:parkingQna.cu?num="+pno;
			}else {
				
				model.addAttribute("message", "삭제 실패!");
				
				return "common/errorPage";
			}
			
		}		
		
		//댓글 작성
		@RequestMapping(value="insertReply.cu", method=RequestMethod.POST)
		public void insertReply(HttpServletRequest request, HttpServletResponse response) throws JsonIOException, IOException {
			String writer = request.getParameter("writer");
			int bno = Integer.parseInt(request.getParameter("bno"));
			String content = request.getParameter("content");
			
			System.out.println("컨트로러 댓글작성자:"+writer);
			System.out.println("bno: "+bno);
			System.out.println("댓글내용: "+content);
		

			Reply r = new Reply();
			r.setBoardNo(bno);
			r.setMemberNo(writer);
			r.setContext(content);
			
			
		
		
			ArrayList<Reply> replyList = bs.insertReply(r);
		
			System.out.println("댓글 list길ㅇㅣ: "+replyList.size());
			
			response.setContentType("application/json");
			new Gson().toJson(replyList, response.getWriter());
		
			
		}
		
}
