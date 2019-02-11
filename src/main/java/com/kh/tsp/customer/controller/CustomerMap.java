package com.kh.tsp.customer.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.tsp.customer.model.service.CustomerMainService;
import com.kh.tsp.customer.model.vo.Parking;

@Controller
public class CustomerMap {
	
	@Autowired
	private CustomerMainService cms;
	
	public CustomerMap() {
		
	}
	
	// 사용자 - 음성 검색
	@RequestMapping("searchVoiceParking.cu")
	public @ResponseBody HashMap<String, Parking> searchVoiceParking(@RequestParam String keyword, @RequestParam String type, HttpServletResponse response) {
		
		HashMap<String, Parking> hmap = cms.searchVoiceParking(keyword, type);
				
		return hmap;
    }
	
	// 사용자 - 음성 검색
	@RequestMapping("searchTextParking.cu")
	public @ResponseBody HashMap<String, Parking> searchTextParking(@RequestParam String keyword, HttpServletResponse response) {
		
		HashMap<String, Parking> hmap = cms.selectSearchTextParking(keyword);
		
		System.out.println(hmap.toString());
		
		return hmap;
    }
}
