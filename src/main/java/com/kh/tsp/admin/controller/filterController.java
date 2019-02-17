package com.kh.tsp.admin.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.tsp.admin.model.exception.FilterException;
import com.kh.tsp.admin.model.exception.SelectBoardListException;
import com.kh.tsp.admin.model.service.FilterService;
import com.kh.tsp.admin.model.vo.Filter;
import com.kh.tsp.common.PageInfo;
import com.kh.tsp.common.Pagination;
import com.kh.tsp.customer.model.vo.Board;


@Controller
public class filterController {

	@Autowired
	private FilterService fs;

	@RequestMapping("goSearchFilterPage.ad")
	public String goMain() {
		return "admin/board/Filter";
	}
	
	// 필터 전체 조회
	@RequestMapping(value = "/selectFilter.ad", method = RequestMethod.GET)
	public String filter(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			int listCount = fs.getListCount();
			ArrayList<Filter> list =fs.selectFilterList();
			request.setAttribute("list", list);
			request.setAttribute("listCount", listCount);
			
			return "admin/board/Filter";
			
		} catch (FilterException e) {
			request.setAttribute("msg", e.getMessage());
			return "common/errorPage";
		}		
	}

	// 필터 추가
	@RequestMapping("insertFilter.ad")
	public String insertFilter(String fContent, Model model) {

		System.out.println("fContent : "+fContent);
		
		int result=0;
		
		try {
			result = fs.insertFilter(fContent);
			return "redirect:selectFilter.ad";
		} catch (FilterException e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}

	// 필터 삭제
	@RequestMapping("deleteFilter.ad")
	public String deleteFilter(String fContent, Model model) {

		System.out.println("fContent : "+fContent);
		
		int result=0;
		
		try {
			result = fs.deleteFilter(fContent);
			return "redirect:selectFilter.ad";
		} catch (FilterException e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
}
