package com.kh.tsp.customer.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.GregorianCalendar;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.tsp.common.OilPagination;
import com.kh.tsp.common.PageInfo;
import com.kh.tsp.customer.model.service.CustomerMainService;
import com.kh.tsp.customer.model.vo.Member;
import com.kh.tsp.customer.model.vo.OilList;
import com.kh.tsp.customer.model.vo.Parking;

@Controller
public class CustomerSearch {

	@Autowired
	private CustomerMainService cms;
	
	public CustomerSearch() {
		
	}
	
	// 사용자 - 음성 검색
	@RequestMapping("searchVoiceParking.cu")
	public @ResponseBody HashMap<String, Parking> searchVoiceParking(@RequestParam String keyword, @RequestParam String type, HttpServletResponse response, @RequestParam String lat, @RequestParam String lon) {
		
		HashMap<String, String> mapKeyword = new HashMap<String, String>();
		
		mapKeyword.put("keyword", keyword);
		mapKeyword.put("lat", lat);
		mapKeyword.put("lon", lon);
		System.out.println();
		HashMap<String, Parking> hmap = cms.searchVoiceParking(mapKeyword, type);
				
		return hmap;
    }
	
	// 사용자 - 텍스트 검색
	@RequestMapping("searchTextParking.cu")
	public @ResponseBody HashMap<String, Parking> searchTextParking(@RequestParam String keyword, HttpServletResponse response, @RequestParam String lat, @RequestParam String lon) {
		
		HashMap<String, String> mapKeyword = new HashMap<String, String>();
		
		mapKeyword.put("keyword", keyword);
		mapKeyword.put("lat", lat);
		mapKeyword.put("lon", lon);
		
		HashMap<String, Parking> hmap = cms.selectSearchTextParking(mapKeyword);
		
		System.out.println(hmap.toString() + "\n" + lat + "," + lon + " 기준으로 정렬됨");
		
		return hmap;
    }
	
	// 사용자 - 오일 내역 조회
	@RequestMapping("searchOilList.cu")
	public @ResponseBody ArrayList<OilList> searchOilList(HttpServletRequest request, @RequestParam String startTime, @RequestParam String endTime, @RequestParam String selectedListInfo, @RequestParam int memberNo, @RequestParam int pageNo, HttpServletResponse response) {
		int currentPage = pageNo;
		
		OilList searchInfo = new OilList();
		
		if (startTime != "") {
			String[] temp = startTime.split(" ");
			
			searchInfo.setStartDate(new Date(new GregorianCalendar(Integer.parseInt("20" + temp[0].split("년")[0]), Integer.parseInt(temp[1].split("월")[0]) - 1, Integer.parseInt(temp[2].split("일")[0])).getTime().getTime()));
			
		}
		if (endTime != "") {
			String[] temp = endTime.split(" ");
			
			searchInfo.setEndDate(new Date(new GregorianCalendar(Integer.parseInt("20" + temp[0].split("년")[0]), Integer.parseInt(temp[1].split("월")[0]) - 1, Integer.parseInt(temp[2].split("일")[0]) + 1).getTime().getTime()));
			
		}
		searchInfo.setMemberNo(memberNo);
		searchInfo.setSelectedListInfo(selectedListInfo);
		System.out.println(searchInfo);
		int listCount = cms.getOilListCount(searchInfo);
		
		PageInfo pi = OilPagination.getPageInfo(currentPage, listCount);
		
		ArrayList<OilList> Olist = cms.searchOilList(searchInfo, pi);
		System.out.println(Olist);
		return Olist;
    }
	
	// 오일 페이징 정보 전달
	@RequestMapping("searchOilListPI.cu")
	public @ResponseBody PageInfo searchOilListPI(HttpServletRequest request, @RequestParam String startTime, @RequestParam String endTime, @RequestParam String selectedListInfo, @RequestParam int memberNo, @RequestParam int pageNo, HttpServletResponse response) {
		int currentPage = pageNo;
		
		OilList searchInfo = new OilList();
		
		if (startTime != "") {
			String[] temp = startTime.split(" ");
			
			searchInfo.setStartDate(new Date(new GregorianCalendar(Integer.parseInt("20" + temp[0].split("년")[0]), Integer.parseInt(temp[1].split("월")[0]) - 1, Integer.parseInt(temp[2].split("일")[0])).getTime().getTime()));
			
		}
		if (endTime != "") {
			String[] temp = endTime.split(" ");
			
			searchInfo.setEndDate(new Date(new GregorianCalendar(Integer.parseInt("20" + temp[0].split("년")[0]), Integer.parseInt(temp[1].split("월")[0]) - 1, Integer.parseInt(temp[2].split("일")[0]) + 1).getTime().getTime()));
			
		}
		searchInfo.setMemberNo(memberNo);
		searchInfo.setSelectedListInfo(selectedListInfo);
		
		int listCount = cms.getOilListCount(searchInfo);
		
		PageInfo pi = OilPagination.getPageInfo(currentPage, listCount);
				
		return pi;
    }
	
	// 사용자 - 오일 리턴
	@RequestMapping("selectNewOil.cu")
	public @ResponseBody int selectNewOil(HttpSession session) {
		Member newMember = new Member();
		
		if ((Member)session.getAttribute("loginUser") != null) {
			 newMember = cms.getRefreshMember((Member)session.getAttribute("loginUser"));
		}
		
		System.out.println("왜 안되세요");
		System.out.println(newMember.getOil());
		
		return Integer.parseInt(newMember.getOil());
	}
	
	
}
