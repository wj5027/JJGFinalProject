package com.kh.tsp.admin.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.tsp.admin.model.exception.ParkingCEOSelectListException;
import com.kh.tsp.admin.model.service.ParkingCEOService;
import com.kh.tsp.admin.model.vo.MemberAdmin;
import com.kh.tsp.common.PageInfo;
import com.kh.tsp.common.Pagination;


@Controller
public class searchCEOListController {

	String nullCheck=null;

	@Autowired
	private ParkingCEOService pcs;
	
	@RequestMapping("goSearchCEOListPage.ad")
	public String goMain() {
		return "admin/parkingceo/SearchCEOList";
	}
	
	// 전체 조회
	@RequestMapping("selectCEOList.ad")
	public String searchCEOList(HttpServletRequest request, HttpServletResponse response) {

		int currentPage =1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		try {
			int listCount = pcs.getListCount();
			PageInfo pi = Pagination.getPageInfo(currentPage,listCount);
			ArrayList<MemberAdmin> list =pcs.selectParkingCEOList(pi);
			request.setAttribute("pi", pi);
			request.setAttribute("list", list);
			
			System.out.println("nullCheck : "+nullCheck);
			
			if(nullCheck != null) {
				request.setAttribute("nullCheck", nullCheck);
				nullCheck=null;
			}

			return "admin/parkingceo/SearchCEOList";
			
		} catch (ParkingCEOSelectListException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	// 회원 탈퇴
	@RequestMapping("deleteParkingCEO.ad")
	public String deleteParkingCEO(String memberNo, Model model){
		System.out.println("memberNo : "+memberNo);

		MemberAdmin md = new MemberAdmin();
		md.setMemberNo(Integer.parseInt(memberNo));
		
		int result=0;

		System.out.println("md : "+md);
		
		try {
			result = pcs.deleteParkingCEO(md);
			System.out.println("result(controller) try문 : "+result);
			return "redirect:selectCEOList.ad";
		} catch (ParkingCEOSelectListException e) {
			model.addAttribute("msg", e.getMessage());
			System.out.println("result(controller) catch문 : "+result);
			return "common/errorPage";
		}
	}

	// 회원 복구
	@RequestMapping("updateRecoverParkingCEO.ad")
	public String updateRecoverParkingCEO(String memberNo, Model model){
		System.out.println("memberNo : "+memberNo);

		MemberAdmin md = new MemberAdmin();
		md.setMemberNo(Integer.parseInt(memberNo));
		
		int result=0;

		System.out.println("md : "+md);
		
		try {
			result = pcs.updateRecoverParkingCEO(md);
			System.out.println("result(controller) try문 : "+result);
			return "redirect:selectCEOList.ad";
		} catch (ParkingCEOSelectListException e) {
			model.addAttribute("msg", e.getMessage());
			System.out.println("result(controller) catch문 : "+result);
			return "common/errorPage";
		}
	}
	
	// 회원 검색
	@RequestMapping(value = "/selectSearchCEOList.ad", method = {RequestMethod.GET, RequestMethod.POST})
	public String searchCEOList2(HttpServletRequest request, HttpServletResponse response,
												String selectStatus, String memberId, String today, String startDate, String endDate) {
		
		int currentPage =1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		try {
			int listCount = pcs.getSearchListCount(selectStatus, memberId, today, startDate, endDate);
			System.out.println("listCount : "+listCount);
			PageInfo pi = Pagination.getPageInfo(currentPage,listCount);
			ArrayList<MemberAdmin> list =pcs.selectSearchParkingCEOList(pi, selectStatus, memberId, today, startDate, endDate);
			request.setAttribute("pi", pi);
			request.setAttribute("list", list);

			request.setAttribute("selectStatus", selectStatus);
			request.setAttribute("memberId", memberId);
			request.setAttribute("today", today);
			request.setAttribute("startDate", startDate);
			request.setAttribute("endDate", endDate);
			
			if(listCount==0 || list == null) {
				nullCheck="nullCheck";
				return "redirect:selectCEOList.ad";
			}else {
				return "admin/parkingceo/SearchCEOList2";				
			}
			
		} catch (ParkingCEOSelectListException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	
	
}
