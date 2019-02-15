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
import com.kh.tsp.admin.model.exception.ParkingException;
import com.kh.tsp.admin.model.service.ParkingAdminService;
import com.kh.tsp.admin.model.vo.ExchangeMoneyAdmin;
import com.kh.tsp.admin.model.vo.ParkingAdmin;
import com.kh.tsp.admin.model.vo.ParkingListAdmin;
import com.kh.tsp.common.PageInfo;
import com.kh.tsp.common.Pagination;


@Controller
public class parkingLotListController {

	String nullCheck=null;

	@Autowired
	private ParkingAdminService ps;

	// 주차장 전체 리스트
	@RequestMapping(value = "/selectParkingLotList.ad", method = RequestMethod.GET)
	public String selectParkingLotList(HttpServletRequest request, HttpServletResponse response) {

		int currentPage =1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		try {
			int listCount = ps.getParkingListCount();
			PageInfo pi = Pagination.getPageInfo(currentPage,listCount);
			ArrayList<ParkingListAdmin> list =ps.selectParkingList(pi);
			request.setAttribute("pi", pi);
			request.setAttribute("list", list);
			
			System.out.println("주차자 전체 리스트 : "+list);
			
			System.out.println("nullCheck : "+nullCheck);
			
			if(nullCheck != null) {
				request.setAttribute("nullCheck", nullCheck);
				nullCheck=null;
			}

			return "admin/parkingceo/ParkingLotList";
			
		} catch (ParkingException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	// 리스트 상세보기 ajax
	@RequestMapping("detailParkingLot.ad")
	public @ResponseBody ParkingListAdmin detailParkingLot(String parkingListNo, HttpServletResponse response) {

		System.out.println("parkingListNo : "+parkingListNo);
		
		ParkingListAdmin pl = new ParkingListAdmin();
		pl.setParkingListNo(parkingListNo);

		try {
			pl = ps.detailParkingLot(pl);
		} catch (ParkingException e) {
			e.printStackTrace();
		}
		
		return pl;
	}
	
	// 승인 버튼
	@RequestMapping("updateParkingLot.ad")
	public String updateParkingLot(String parkingListNo, Model model){
		
		System.out.println("parkingListNo : "+parkingListNo);
		
		ParkingListAdmin pl = new ParkingListAdmin();
		pl.setParkingListNo(parkingListNo);
		
		int result=0;
		
		try {
			result = ps.updateParkingLot(pl);
			return "redirect:selectParkingLotList.ad";
		} catch (ParkingException e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}

	// 반송 버튼
	@RequestMapping("updateReturnParkingLot.ad")
	public String updateReturnParkingLot(String parkingListNo, String parkingListReason, Model model){
		
		ParkingListAdmin pl = new ParkingListAdmin();
		pl.setParkingListNo(parkingListNo);
		pl.setParkingListReason(parkingListReason);
		
		int result=0;
		
		try {
			result = ps.updateReturnParkingLot(pl);
			return "redirect:selectParkingLotList.ad";
		} catch (ParkingException e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}

	// 반송 사유 ajax
	@RequestMapping("updateCancelReasonDetail.ad")
	public @ResponseBody ParkingListAdmin updateCancelReasonDetail(String parkingListNo, HttpServletResponse response) {

		ParkingListAdmin pl = new ParkingListAdmin();
		pl.setParkingListNo(parkingListNo);
		
		try {
			pl = ps.updateCancelReasonDetail(pl);
		} catch (ParkingException e) {
			e.printStackTrace();
		}
		
		return pl;
	}
	
	// 검색
	@RequestMapping(value="/selectSearchParkingLotList.ad", method = {RequestMethod.GET, RequestMethod.POST})
	public String selectSearchParkingLotList(HttpServletRequest request, HttpServletResponse response,
												String parkingListStatus, String memberId, String parkingAddress, String parkingListName, String today, String startDate, String endDate) {
		
		int currentPage =1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		try {
			int listCount = ps.getSearchListCount( parkingListStatus,memberId, parkingAddress, parkingListName, today, startDate, endDate);
			System.out.println("listCount : "+listCount);
			PageInfo pi = Pagination.getPageInfo(currentPage,listCount);
			ArrayList<ParkingListAdmin> list = ps.selectSearchParkingLotList(pi, parkingListStatus, memberId, parkingAddress, parkingListName, today, startDate, endDate);
			request.setAttribute("pi", pi);
			request.setAttribute("list", list);

			request.setAttribute("parkingListStatus", parkingListStatus);
			request.setAttribute("memberId", memberId);
			request.setAttribute("parkingAddress", parkingAddress);
			request.setAttribute("parkingListName", parkingListName);
			request.setAttribute("today", today);
			request.setAttribute("startDate", startDate);
			request.setAttribute("endDate", endDate);

			System.out.println("list : "+list);
			if(listCount==0 || list == null) {
				nullCheck="nullCheck";
				return "redirect:selectParkingLotList.ad";
			}else {
				return "admin/parkingceo/ParkingLotList2";
			}

		} catch (ParkingException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	
	
}
