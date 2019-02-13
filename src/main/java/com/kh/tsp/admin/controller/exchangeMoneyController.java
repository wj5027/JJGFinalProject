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

import com.kh.tsp.admin.model.exception.ExchangeMoneyException;
import com.kh.tsp.admin.model.service.ExchangeMoneyAdminService;
import com.kh.tsp.admin.model.vo.ExchangeMoneyAdmin;
import com.kh.tsp.common.PageInfo;
import com.kh.tsp.common.Pagination;


@Controller
public class exchangeMoneyController {

	String nullCheck=null;
	
	@Autowired
	private ExchangeMoneyAdminService ems;

	@RequestMapping("goExchangeMoneyPage.ad")
	public String goMain() {
		return "admin/parkingceo/ExchangeMoney";
	}

	// 환전 환불 전체 리스트 조회
	@RequestMapping(value = "/selectExchangeMoney.ad", method = {RequestMethod.GET, RequestMethod.POST})
	public String selectExchangeMoney(HttpServletRequest request, HttpServletResponse response) {

		int currentPage =1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		try {
			int listCount = ems.getListCount();
			PageInfo pi = Pagination.getPageInfo(currentPage,listCount);
			ArrayList<ExchangeMoneyAdmin> list =ems.selectExchangeMoneyList(pi);
			request.setAttribute("pi", pi);
			request.setAttribute("list", list);
			
			System.out.println("nullCheck : "+nullCheck);
			
			if(nullCheck != null) {
				request.setAttribute("nullCheck", nullCheck);
				nullCheck=null;
			}

			return "admin/parkingceo/ExchangeMoney";
			
		} catch (ExchangeMoneyException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	// 환전 환불 리스트 상세보기 ajax
	@RequestMapping("detailExchangeMoney.ad")
	public @ResponseBody ExchangeMoneyAdmin detailExchangeMoney(String exchangeNo, HttpServletResponse response) {

		System.out.println("exchangeNo : "+exchangeNo);
		
		ExchangeMoneyAdmin em = new ExchangeMoneyAdmin();
		em.setExchangeNo(Integer.parseInt(exchangeNo));

		try {
			em = ems.detailExchangeMoneym(em);
		} catch (ExchangeMoneyException e) {
			e.printStackTrace();
		}
		
		return em;
	}
	
	// 환불 환전 승인
	@RequestMapping("updateRefundExchangeMoney.ad")
	public String updateRefundExchangeMoney(String exchangeNo, Model model){
		System.out.println("exchangeNo : "+exchangeNo);
		
		ExchangeMoneyAdmin em = new ExchangeMoneyAdmin();
		em.setExchangeNo(Integer.parseInt(exchangeNo));
		
		int result=0;
		
		try {
			result = ems.updateRefundExchangeMoney(em);
			return "redirect:selectExchangeMoney.ad";
		} catch (ExchangeMoneyException e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}

	// 환불 환전 반송
	@RequestMapping("deleteExchangeMoney.ad")
	public String deleteCoupon(String exchangeNo, String cancelReason, Model model){
		
		ExchangeMoneyAdmin em = new ExchangeMoneyAdmin();
		em.setExchangeNo(Integer.parseInt(exchangeNo));
		em.setCancelReason(cancelReason);
		
		int result=0;
		
		try {
			result = ems.deleteExchangeMoney(em);
			return "redirect:selectExchangeMoney.ad";
		} catch (ExchangeMoneyException e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}

	// 반송 사유 ajax
	@RequestMapping("cancelReasonDetail.ad")
	public @ResponseBody ExchangeMoneyAdmin cancelReasonDetail(String exchangeNo, HttpServletResponse response) {

		ExchangeMoneyAdmin em = new ExchangeMoneyAdmin();
		em.setExchangeNo(Integer.parseInt(exchangeNo));
		
		try {
			em = ems.cancelReasonDetail(em);
		} catch (ExchangeMoneyException e) {
			e.printStackTrace();
		}
		
		return em;
	}
	
	// 환불 환전 검색
	@RequestMapping(value="/selectSearchExchangeList.ad", method = {RequestMethod.GET, RequestMethod.POST})
	public String selectSearchExchangeList(HttpServletRequest request, HttpServletResponse response,
												String status, String memberId, String memberType, String today, String startDate, String endDate) {
		
		int currentPage =1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		try {
			int listCount = ems.getSearchListCount(status, memberId, memberType, today, startDate, endDate);
			System.out.println("listCount : "+listCount);
			PageInfo pi = Pagination.getPageInfo(currentPage,listCount);
			ArrayList<ExchangeMoneyAdmin> list = ems.selectSearchExchangeMoneyAdminList(pi, status, memberId, memberType, today, startDate, endDate);
			request.setAttribute("pi", pi);
			request.setAttribute("list", list);

			System.out.println("list : "+list);
			if(listCount==0 || list == null) {
				nullCheck="nullCheck";
				return "redirect:selectExchangeMoney.ad";
			}else {
				return "admin/parkingceo/ExchangeMoney2";
			}

		} catch (ExchangeMoneyException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
}
