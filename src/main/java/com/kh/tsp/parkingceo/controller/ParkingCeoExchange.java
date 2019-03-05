package com.kh.tsp.parkingceo.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.tsp.common.CommonUtils;
import com.kh.tsp.customer.model.vo.Member;
import com.kh.tsp.parkingceo.model.service.ParkingService;
import com.kh.tsp.parkingceo.model.service.PromotionService;
import com.kh.tsp.parkingceo.model.vo.ParkingCeoAttachmentVo;
import com.kh.tsp.parkingceo.model.vo.ParkingCeoVo;

@Controller
public class ParkingCeoExchange {
	
	
	@Autowired
	private PromotionService promotion;
	
	@Autowired
	private ParkingService ps;

	public ParkingCeoExchange() {
		
	}
	
	
	@RequestMapping(value="/parkingceoExchange.pc", method=RequestMethod.GET)
	public String ParkingExchangePage(Model model,HttpSession session) {
		Member m = (Member)session.getAttribute("loginUser");		
		try {
			//현재 보유중인 주차장 검색
			ArrayList<HashMap<String, Object>> list = promotion.selectCurrentParkingList(m);
			model.addAttribute("CurrentParkinglist", list);
		}catch(Exception e) {
			model.addAttribute("message", "주차장 조회 실패!");
			return "common/errorPage";
		}
		return "parkingceo/exchange/ExchangePage";
	}
	
	@RequestMapping(value="/searchParkingOne.pc",method=RequestMethod.POST)
	public ModelAndView searchParkingOne(ModelAndView mv,@RequestParam String parkingSelectBox, HttpSession session) {
		
		//주차장 조회를 위한 데이터 조회 및 삽입
		Member m = (Member)session.getAttribute("loginUser");
		ParkingCeoVo parking = new ParkingCeoVo();
		parking.setMemberNo(m.getMember_no());
		parking.setParkingNo(parkingSelectBox);
		
		//주차장 데이터 조회
		try {
			HashMap<String, Object> hmap = ps.selectSearchParkingOne(parking);
			mv.addObject("hmap", hmap);
		}catch(Exception e) {
			mv.addObject("message", "주차장 조회 실패");
			mv.setViewName("jsonView");
			return mv;
		}
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping(value="/exchangeParking.pc",method=RequestMethod.POST)
	public String exchangeParking(HttpSession session,Model model,HttpServletRequest request,@ModelAttribute ParkingCeoVo parking,
			@RequestParam(value="parkingImage",required=false) List<MultipartFile> parkingImage,@RequestParam String hiddenParkingNo) {
		
		Member m = (Member)session.getAttribute("loginUser");
		String weekStartTime = parking.getWeekdayStime();
		String weekEndTime = parking.getWeekdayEtime();
		String satStartTime = parking.getSatStime();
		String satEndTime = parking.getSatEtime();
		String holStartTime = parking.getHollydayStime();
		String holEndTime = parking.getHollydayEtime();
		
		//주차장번호 넣기
		parking.setParkingNo(hiddenParkingNo);
		//회원 번호 넣기
		parking.setMemberNo(m.getMember_no());
		//운영 요일 값 설정
		String openDaysResult = String.join(",", parking.getOpenDaysArry());
		parking.setOpenDays(openDaysResult);
		//운영 시간 재 설정
		parking.setWeekdayStime("00:00");
		parking.setWeekdayEtime("00:00");
		parking.setSatStime("00:00");
		parking.setSatEtime("00:00");
		parking.setHollydayStime("00:00");
		parking.setHollydayEtime("00:00");
		
		for(int i = 0; i < parking.getOpenDaysArry().length; i++) {
			if(parking.getOpenDaysArry()[i].equals("평일")) {
				parking.setWeekdayStime(weekStartTime);
				parking.setWeekdayEtime(weekEndTime);
			}else if(parking.getOpenDaysArry()[i].equals("토요일")) {
				parking.setSatStime(satStartTime);
				parking.setSatEtime(satEndTime);
			}else if(parking.getOpenDaysArry()[i].equals("공휴일")) {
				parking.setHollydayStime(holStartTime);
				parking.setHollydayEtime(holEndTime);
			}
		}
		
		//결제 방법 재 설정
		String payTypeResult = String.join(",", parking.getPay_typeArry());
		parking.setPayType(payTypeResult);
		
		//비고 설정
		if(parking.getRemarks() == "") {
			parking.setRemarks("없음");
		}
		
		//파일 설정
		String root = request.getSession().getServletContext().getRealPath("resources");
		String filePath = root + "\\common\\parkingImage";
		ArrayList<String> changeNameList = new ArrayList<String>();
		ArrayList<String> extNameList = new ArrayList<String>();
		ArrayList<ParkingCeoAttachmentVo> attachList = new ArrayList<ParkingCeoAttachmentVo>();
		String originFileName = "";
		String changeName = "";
		String ext = "";
		
		int count = 1;
		
		try {
			for(MultipartFile item : parkingImage) {
				if(item.getOriginalFilename() != "") {
					ParkingCeoAttachmentVo attach = new ParkingCeoAttachmentVo();
					originFileName = item.getOriginalFilename();
					ext = originFileName.substring(originFileName.lastIndexOf("."));
					changeName = CommonUtils.getRandomString();
					changeNameList.add(changeName);
					extNameList.add(ext);
					
					attach.setParking_no(hiddenParkingNo);
					attach.setFile_path(filePath);
					attach.setChange_name(changeName);
					attach.setOrigin_name(originFileName);
					attach.setFile_level(count);
					count++;
					attachList.add(attach);
					item.transferTo(new File(filePath+"\\"+changeName+ext));
				}
			}
			//데이터 베이스에 넣기 위한 메소드
			ps.insertExchangeParking(parking,attachList);
		
		}catch(Exception e) {
			for(int i = 0 ; i < changeNameList.size(); i ++) {
				new File(filePath + "\\" + changeNameList.get(i) + extNameList.get(i)).delete();					
			}
			return "redirect:exchangeParkingFailed.pc";
			
		}
		
		return "redirect:exchangeParkingSuccess.pc";
	}
	
	
	@RequestMapping(value="/exchangeParkingFailed.pc",method=RequestMethod.GET)
	public String exchangeParkingFalied(Model model) {
		model.addAttribute("message", "주차장 정보 신청 실패!");
		return "parkingceo/common/success";
	}
	
	
	@RequestMapping(value="/exchangeParkingSuccess.pc",method=RequestMethod.GET)
	public String exchangeParkingSuccess(Model model) {
		model.addAttribute("message", "주차장 정보 신청 성공!");
		return "parkingceo/common/success";
	}
	


}
