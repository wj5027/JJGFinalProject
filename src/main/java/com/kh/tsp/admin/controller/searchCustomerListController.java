package com.kh.tsp.admin.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.tsp.admin.model.exception.CustomerSelectListException;
import com.kh.tsp.admin.model.service.CustomerService;
import com.kh.tsp.admin.model.vo.MemberAdmin;
import com.kh.tsp.common.PageInfo;
import com.kh.tsp.common.Pagination;


@Controller
public class searchCustomerListController {

	String nullCheck=null;

	@Autowired
	private CustomerService cs;
	
	@RequestMapping("goSearchCustomerListPage.ad")
	public String goMain() {
		return "admin/customer/SearchCustomerList";
	}
	
	// 전체 조회
	@RequestMapping("selectCustomerList.ad")
	public String searchCustomerList(HttpServletRequest request, HttpServletResponse response) {

		int currentPage =1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		try {
			int listCount = cs.getListCount();
			PageInfo pi = Pagination.getPageInfo(currentPage,listCount);
			ArrayList<MemberAdmin> list =cs.selectCustomerList(pi);
			request.setAttribute("pi", pi);
			request.setAttribute("list", list);
			
			System.out.println("nullCheck : "+nullCheck);
			
			if(nullCheck != null) {
				request.setAttribute("nullCheck", nullCheck);
				nullCheck=null;
			}

			return "admin/customer/SearchCustomerList";
			
		} catch (CustomerSelectListException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	// 회원 탈퇴
	@RequestMapping("deleteCustomer.ad")
	public String deleteCustomer(String memberNo, Model model){
		System.out.println("memberNo : "+memberNo);

		MemberAdmin md = new MemberAdmin();
		md.setMemberNo(Integer.parseInt(memberNo));
		
		int result=0;

		System.out.println("md : "+md);
		
		try {
			result = cs.deleteCustomer(md);
			System.out.println("result(controller) try문 : "+result);
			return "redirect:selectCustomerList.ad";
		} catch (CustomerSelectListException e) {
			model.addAttribute("msg", e.getMessage());
			System.out.println("result(controller) catch문 : "+result);
			return "common/errorPage";
		}
	}

	// 회원 복구
	@RequestMapping("updateRecoverCustomer.ad")
	public String updateRecoverCustomer(String memberNo, Model model){
		System.out.println("memberNo : "+memberNo);

		MemberAdmin md = new MemberAdmin();
		md.setMemberNo(Integer.parseInt(memberNo));
		
		int result=0;

		System.out.println("md : "+md);
		
		try {
			result = cs.updateRecoverCustomer(md);
			System.out.println("result(controller) try문 : "+result);
			return "redirect:selectCustomerList.ad";
		} catch (CustomerSelectListException e) {
			model.addAttribute("msg", e.getMessage());
			System.out.println("result(controller) catch문 : "+result);
			return "common/errorPage";
		}
	}
	
	// 회원 검색
	@RequestMapping("selectSearchCustomerList.ad")
	public String searchCustomerList2(HttpServletRequest request, HttpServletResponse response,
												String selectStatus, String memberId, String today, String startDate, String endDate) {

		System.out.println("selectStatus : "+selectStatus);
		System.out.println("memberId : "+memberId);
		System.out.println("today : "+today);
		System.out.println("startDate : "+startDate);
		System.out.println("endDate : "+endDate);
		
		int currentPage =1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		try {
			int listCount = cs.getSearchListCount(selectStatus, memberId, today, startDate, endDate);
			System.out.println("listCount : "+listCount);
			PageInfo pi = Pagination.getPageInfo(currentPage,listCount);
			ArrayList<MemberAdmin> list =cs.selectSearchCustomerList(pi, selectStatus, memberId, today, startDate, endDate);
			request.setAttribute("pi", pi);
			request.setAttribute("list", list);
			
			if(listCount==0 || list == null) {
				nullCheck="nullCheck";
				return "redirect:selectCustomerList.ad";
			}else {
				return "admin/customer/SearchCustomerList2";				
			}
			
		} catch (CustomerSelectListException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	
	
}


