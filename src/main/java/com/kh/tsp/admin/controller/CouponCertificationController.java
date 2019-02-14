package com.kh.tsp.admin.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.tsp.admin.model.exception.CouponListException;
import com.kh.tsp.admin.model.exception.ParkingCEOSelectListException;
import com.kh.tsp.admin.model.exception.SelectBoardListException;
import com.kh.tsp.admin.model.service.CouponAdminService;
import com.kh.tsp.admin.model.vo.CouponRequestList;
import com.kh.tsp.admin.model.vo.MemberAdmin;
import com.kh.tsp.common.PageInfo;
import com.kh.tsp.common.Pagination;
import com.kh.tsp.customer.model.vo.Board;


@Controller
public class CouponCertificationController {

	String nullCheck=null;
	
	@Autowired
	private CouponAdminService cs;

	@RequestMapping("goSearchCouponCertificationPage.ad")
	public String goMain() {
		return "admin/parkingceo/CouponCertification";
	}
	
	// 쿠폰 전체 리스트 
	@RequestMapping(value = "/selectCouponCertification.ad", method = RequestMethod.GET)
	public String selectCouponCertification(HttpServletRequest request, HttpServletResponse response) {

		int currentPage =1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		try {
			int listCount = cs.getCouponListCount();
			PageInfo pi = Pagination.getPageInfo(currentPage,listCount);
			ArrayList<CouponRequestList> list =cs.selectCouponList(pi);
			request.setAttribute("pi", pi);
			request.setAttribute("list", list);
			
			System.out.println("nullCheck : "+nullCheck);
			
			if(nullCheck != null) {
				request.setAttribute("nullCheck", nullCheck);
				nullCheck=null;
			}

			return "admin/parkingceo/CouponCertification";
			
		} catch (CouponListException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}

	// 쿠폰 발급
	@RequestMapping("updateCoupon.ad")
	public String updateCoupon(String reqNo, Model model){
		System.out.println("reqNo : "+reqNo);
		
		CouponRequestList crl = new CouponRequestList();
		crl.setReqNo(Integer.parseInt(reqNo));
		
		int result=0;
		
		try {
			result = cs.updateCoupon(crl);
			return "redirect:selectCouponCertification.ad";
		} catch (CouponListException e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}

	// 쿠폰 반송
	@RequestMapping("deleteCoupon.ad")
	public String deleteCoupon(String reqNo, String refuseReason, Model model){
		System.out.println("reqNo : "+reqNo);
		System.out.println("refuseReason : "+refuseReason);
		
		CouponRequestList crl = new CouponRequestList();
		crl.setReqNo(Integer.parseInt(reqNo));
		crl.setRefuseReason(refuseReason);
		
		int result=0;
		
		try {
			result = cs.deleteCoupon(crl);
			return "redirect:selectCouponCertification.ad";
		} catch (CouponListException e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}

	// 반송 사유 ajax
	@RequestMapping("selectRefuseReason.ad")
	public @ResponseBody CouponRequestList selectRefuseReason(String reqNo, HttpServletResponse response) {

		System.out.println("reqNo : "+reqNo);
		
		CouponRequestList c = new CouponRequestList();
		c.setReqNo(Integer.parseInt(reqNo));

		System.out.println("c : "+c);
		
		try {
			c = cs.selectRefuseReason(c);
		} catch (CouponListException e) {
			e.printStackTrace();
		}
		
		return c;
	}
	
	// 쿠폰 검색
	@RequestMapping("selectSearchCouponList.ad")
	public String searchBoardQnAList2(HttpServletRequest request, HttpServletResponse response,
												String selectStatus, String selectCoupon, String memberId, String parkingName) {
		
		int currentPage =1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		try {
			int listCount = cs.getSearchListCount(selectStatus, selectCoupon, memberId, parkingName);
			System.out.println("listCount : "+listCount);
			PageInfo pi = Pagination.getPageInfo(currentPage,listCount);
			ArrayList<CouponRequestList> list =cs.selectSearchCouponList(pi, selectStatus, selectCoupon, memberId, parkingName);
			request.setAttribute("pi", pi);
			request.setAttribute("list", list);

			request.setAttribute("selectStatus", selectStatus);
			request.setAttribute("selectCoupon", selectCoupon);
			request.setAttribute("memberId", memberId);
			request.setAttribute("parkingName", parkingName);

			System.out.println("list : "+list);
			if(listCount==0 || list == null) {
				nullCheck="nullCheck";
				return "redirect:selectCouponCertification.ad";
			}else {
				return "admin/parkingceo/CouponCertification2";	
			}
			
		} catch (CouponListException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}

	
	
	
}
