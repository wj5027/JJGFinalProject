package com.kh.tsp.admin.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.tsp.admin.model.exception.ParkingCEOSelectListException;
import com.kh.tsp.admin.model.service.ParkingCEOService;
import com.kh.tsp.admin.model.vo.MemberAdmin;
import com.kh.tsp.common.PageInfo;
import com.kh.tsp.common.Pagination;


@Controller
public class searchCEOListController {

	@Autowired
	private ParkingCEOService pcs;
	
	@RequestMapping(value = "searchCEOList.ad", method = RequestMethod.GET)
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
						
			return "admin/parkingceo/SearchCEOList";
			
		} catch (ParkingCEOSelectListException e) {
			request.setAttribute("msg", "회원조회 실패!");
			return "common/errorPage";
		}
	}
	
	
	
	
	
	
	
	
	
	
}
