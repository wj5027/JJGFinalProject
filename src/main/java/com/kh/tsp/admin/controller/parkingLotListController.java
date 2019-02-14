package com.kh.tsp.admin.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.tsp.admin.model.exception.ParkingException;
import com.kh.tsp.admin.model.service.ParkingAdminService;
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
	
}
