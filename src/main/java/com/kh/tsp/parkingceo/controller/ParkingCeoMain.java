package com.kh.tsp.parkingceo.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.tsp.common.ParkingCeoPageInfo;
import com.kh.tsp.common.ParkingCeoPagination;
import com.kh.tsp.customer.model.vo.Member;
import com.kh.tsp.parkingceo.model.service.ParkingMainService;
import com.kh.tsp.parkingceo.model.service.ParkingService;
import com.kh.tsp.parkingceo.model.service.PromotionService;

@Controller
public class ParkingCeoMain {
	
	@Autowired
	private PromotionService promotion;
	@Autowired
	private ParkingService ps;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	@Autowired
	private ParkingMainService pms;

	
	public ParkingCeoMain() {
		
	}
	
	
	//사업자 메인 페이지 메소드
	@RequestMapping(value="/parkingceoMain.pc", method=RequestMethod.GET)
	public String ParkingMainPage(HttpSession session,Model model) {
		Member m = (Member)session.getAttribute("loginUser");		
		try {
			//현재 보유중인 주차장 검색
			ArrayList<HashMap<String, Object>> list = promotion.selectCurrentParkingList(m);
			model.addAttribute("CurrentParkinglist", list);
		}catch(Exception e) {
			model.addAttribute("message", "주차장 조회 실패!");
			return "common/errorPage";
		}
		return "parkingceo/main/Parkingceo_main";
	}
	
	//사업자 로그인 페이지 메소드
	@RequestMapping(value="/parkingceoLogin.pc", method=RequestMethod.GET)
	public String ParkingceoLoginPage() {
		
		
		return "parkingceo/main/Parkingceo_login";
	}
	
	
	//사업자 이용약관 동의 페이지
	@RequestMapping(value="/ceoServiceTerm.pc", method=RequestMethod.GET)
	public String ceoServiceTermPage() {
		
		
		return "parkingceo/main/ceoServiceTerm";
	}
	
	//사업자 회원가입 페이지 
	@RequestMapping(value="/ceoJoin.pc", method=RequestMethod.GET)
	public String ceoJoinPage() {
		
		
		return "parkingceo/main/ceoJoin";
	}
	
	//사업자 회원가입 기능
	@RequestMapping(value="/insertParkinCeo.pc")
	public String inserParkingCeo(@ModelAttribute Member m, Model model ) {
		
		
	try{
			String encPassword = passwordEncoder.encode(m.getMember_pwd());
			m.setMember_pwd(encPassword);
			ps.insertParkingCeo(m);
		}catch(Exception e) {
			model.addAttribute("message", e.getMessage());
			return "common/errorPage";
		}
		return "redirect:parkingceoLogin.pc";
	}
	
	
	//입차현황 조회 메소드
	@RequestMapping(value="/searchInsertParkingSystemList.pc",method=RequestMethod.POST)
	public ModelAndView searchInsertParkingSystemList(@RequestParam String selectParkingBox
			,ModelAndView mv,@RequestParam String currentPage) {		
		
		int resultCurrentPage = 1;
		if(currentPage != null) {
			resultCurrentPage = Integer.parseInt(currentPage);
		}
		HashMap<String, Object> selectHmap = new HashMap<String,Object>();
		selectHmap.put("parking_no", selectParkingBox);
		
		try {
			int listCount = pms.selectListCountInsertParkingSystemList(selectHmap);
			ParkingCeoPageInfo pi = ParkingCeoPagination.getPageInfo(resultCurrentPage, listCount);
			ArrayList<HashMap<String, Object>> list = pms.selectSearchInsertParkingSystemList(selectHmap,pi);
			mv.addObject("pi", pi);
			mv.addObject("list", list);
			
		}catch(Exception e) {
			mv.addObject("message", "입차 조회 실패!");
			mv.setViewName("jsonView");
			return mv;
		}
		
		
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	//예약 현황 메소드
	@RequestMapping(value="/searchResParkingSystem.pc",method=RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> searchResParkingSystem(@RequestParam String selectParkingBox
			,ModelAndView mv,@RequestParam String currentPage){
		
		HashMap<String, Object> ajaxHmap = new HashMap<String,Object>();
		HashMap<String, Object> mybatisHmap = new HashMap<String,Object>();
		mybatisHmap.put("parking_no", selectParkingBox);
		
		int resultCurrentPage = 1;
		if(currentPage != null) {
			resultCurrentPage = Integer.parseInt(currentPage);
		}
		try {
			int listCount = pms.selectListCountResParkingList(mybatisHmap);
			ParkingCeoPageInfo pi = ParkingCeoPagination.getPageInfo(resultCurrentPage, listCount);
			ArrayList<HashMap<String, Object>> list = pms.selectSearchResParkingList(mybatisHmap,pi);
			ajaxHmap.put("list", list);
			ajaxHmap.put("pi", pi);
		}catch(Exception e) {
			ajaxHmap.put("message", "예약현황 조회 실패!");
			return ajaxHmap;
		}
		return ajaxHmap;
	}
	
	//예약 승인 메소드
	@RequestMapping(value="/updateResComplete.pc",method=RequestMethod.POST)
	public ModelAndView updateResComplete(@RequestParam String completeResNo,ModelAndView mv) {
		
		try {
			pms.updateResComplete(Integer.parseInt(completeResNo));
		}catch(Exception e) {
			mv.addObject("message", "예약 업데이트 실패");
			mv.setViewName("jsonView");
			return mv;
		}
		mv.addObject("message", "예약 업데이트 성공");
		mv.setViewName("jsonView");
		return mv;
	}
	
	//예약 취소 메소드
	@RequestMapping(value="/updateResCancel.pc",method=RequestMethod.POST)
	public ModelAndView updateResCancel(@RequestParam String completeResNo,@RequestParam String resCancelText,ModelAndView mv) {
		
		try {
			pms.updateResCancel(Integer.parseInt(completeResNo),resCancelText);
		}catch(Exception e) {
			mv.addObject("message", "반송 업데이트 실패");
			mv.setViewName("jsonView");
			return mv;
		}
		mv.addObject("message", "반송 업데이트 성공");
		mv.setViewName("jsonView");
		return mv;
	}
	
	
	//입-출차 시스템 주차현황 조회
	@RequestMapping(value="/searchPakringSize.pc",method=RequestMethod.POST)
	public ModelAndView searchPakringSize(ModelAndView mv, @RequestParam String selectParkingBox) {
		HashMap<String, Object> searchHmap = new HashMap<String,Object>();
		searchHmap.put("parking_no", selectParkingBox);
		try {
			HashMap<String, Object> hmap = pms.searchPakringSize(searchHmap);
			mv.addObject("hmap", hmap);
		}catch(Exception e) {
			mv.addObject("message", "현황 조회 실패");
			mv.setViewName("jsonView");
			return mv;
		}
		mv.addObject("message", "현황 조회 성공");
		mv.setViewName("jsonView");
		return mv;
	}

	
	//입차 메소드
	@RequestMapping(value="/insertEntryList.pc",method=RequestMethod.POST)
	public ModelAndView insertEntryList(ModelAndView mv,@RequestParam String selectParkingBox,@RequestParam String resultCarNo,@RequestParam String resultMemberNo,
			@RequestParam String resultResNo,@RequestParam String resultPhone,@RequestParam String resultYear
			,@RequestParam String resultMonth,@RequestParam String resultDay,@RequestParam String resultHours,@RequestParam String resultMin) 
	{
		
		HashMap<String, Object> searchHashmap = new HashMap<String,Object>();
		String resultDate = "";
		if(!resultMonth.equals("11") || !resultMonth.equals("12")) {
			resultMonth = "0"+resultMonth;
		}
		if(resultDay.equals("1") ||resultDay.equals("2") ||resultDay.equals("3") ||resultDay.equals("4") ||
				resultDay.equals("5") ||resultDay.equals("6") ||resultDay.equals("7") ||resultDay.equals("8") ||resultDay.equals("9")) {
			resultDay = "0"+resultDay;
		}
		resultDate = resultYear+"-"+resultMonth+"-"+resultDay+" "+resultHours+":"+resultMin+":00";
		
		//비회원일시 memberName은 넣지 않는다. 나머지는 no로 넣음
		searchHashmap.put("parking_no", selectParkingBox);
		searchHashmap.put("car_no", resultCarNo);
		searchHashmap.put("phone", resultPhone);
		searchHashmap.put("start_time", resultDate);
		try {
			pms.insertEntryList(searchHashmap,resultMemberNo,resultResNo);
		}catch(Exception e) {
			mv.addObject("message", "비회원 입차 실패");
			mv.setViewName("jsonView");
			return mv;
		}
		
		mv.addObject("message", "비회원 입차 성공");
		mv.setViewName("jsonView");
		return mv;
	}
	
	
	//일반회원 출차 메소드
	@RequestMapping(value="/selectNonMemberOutputCar.pc",method=RequestMethod.POST)
	public ModelAndView selectNonMemberOutputCar(ModelAndView mv,@RequestParam String selectParkingBox,@RequestParam String car_no) {

		int nTime = 0;
		int nPrice = 0;
		int aTime = 0;
		int aPrice = 0;
		int resultPrice = 0;
		HashMap<String, Object> addResultData = new HashMap<String,Object>();
		HashMap<String, Object> searchData = new HashMap<String,Object>();
		
		searchData.put("parking_no", selectParkingBox);
		searchData.put("car_no", car_no);
		
		try {
			//출차시간과 사용시간 데이터 삽입 후 사용시간 가져오기
			HashMap<String, Object> selectUseTime = pms.selectNonMemberUseTime(searchData);
			
			int resultUseTime = Integer.parseInt(selectUseTime.get("USE_TIME")+"");
			//사용시간을 데이터베이스에 넣기 위해 해쉬맵에 데이터 넣기
			addResultData.put("resultUseTime", resultUseTime);
			//기본시간,기본요금,추가시간,추가요금 가져오기
			HashMap<String, Integer> selectParkingUseTimeAndPrice = pms.selectNonMemberParkingUseTimeAndPrice(selectParkingBox);
			
			//각 시간이 0이나 null이 아닐시 계산구하기
			if(selectParkingUseTimeAndPrice.get("PARKING_NTIME") != null || selectParkingUseTimeAndPrice.get("PARKING_NTIME")+"" != "" ) {
				nTime = Integer.parseInt(selectParkingUseTimeAndPrice.get("PARKING_NTIME")+"");				
			}else {
				nTime = 0;
			}
			
			if(selectParkingUseTimeAndPrice.get("PARKING_NPRICE") != null || selectParkingUseTimeAndPrice.get("PARKING_NPRICE")+"" != "" ) {
				nPrice =  Integer.parseInt(selectParkingUseTimeAndPrice.get("PARKING_NPRICE")+"");				
			}else {
				nPrice = 0;
			}
			
			if(selectParkingUseTimeAndPrice.get("PARKING_NPRICE") != null || selectParkingUseTimeAndPrice.get("PARKING_NPRICE")+"" != "" ) {
				aTime = Integer.parseInt(selectParkingUseTimeAndPrice.get("PARKING_ATIME")+"");				
			}else {
				aTime = 0;
			}
			
			if(selectParkingUseTimeAndPrice.get("PARKING_NPRICE") != null || selectParkingUseTimeAndPrice.get("PARKING_NPRICE")+"" != "" ) {
				aPrice =  Integer.parseInt(selectParkingUseTimeAndPrice.get("PARKING_APRICE")+"");				
			}else {
				aTime = 0;
			}
			
			if(nTime != 0) {
				resultUseTime = resultUseTime - nTime;
				resultPrice = nPrice;
				if(aTime != 0) {
					resultPrice += ((int)(resultUseTime/aTime))*aPrice;
				}else {
					resultPrice += ((int)(resultUseTime/nTime))*nPrice;
				}
			}
			
			//구해온 요금을 해쉬맵에 삽입
			addResultData.put("resultPrice", resultPrice);
			addResultData.put("car_no", car_no);
			addResultData.put("parking_no", selectParkingBox);
			//데이터 베이스에 재 업로드
			pms.updateNonMemberResultData(addResultData);
			
			//주차장 구획수 증가
			pms.plusNonMemberParkingLeftSize(searchData);
			
			//출차 데이터 불러오기
			HashMap<String, Object> hmap = pms.selectNonMemberResultData(searchData);
			mv.addObject("hmap", hmap);
		
			
			
		}catch(Exception e) {
			mv.addObject("message", "출차 실패!");
			mv.setViewName("jsonView");
			return mv;
		}
		
		mv.setViewName("jsonView");
		return mv;
	}
	
	
	//일반회원 입차 정보 조회 메소드
	@RequestMapping(value="/selectNomalMemberInformation.pc",method=RequestMethod.POST)
	public ModelAndView selectNomalMemberInformation(ModelAndView mv,@RequestParam String member_id) {
		
		HashMap<String, Object> selectHmap = new HashMap<String,Object>();
		HashMap<String, Object> resultHmap = new HashMap<String,Object>();
		selectHmap.put("member_id", member_id);

		try {
			
			Member m = pms.selectNomalMemberInformation(selectHmap);
			resultHmap.put("member", m);
			mv.addObject("hmap", resultHmap);

		}catch(Exception e){
			System.err.println(e.getMessage());
			mv.addObject("message", "일반 회원 조회 실패!");
			mv.setViewName("jsonView");
			return mv;
		}
		
		mv.setViewName("jsonView");
		return mv;
	}
	
	
	@RequestMapping(value="/selectNomalMemberOutputInformation.pc",method=RequestMethod.POST)
	public ModelAndView selectNomalMemberOutputInformation(ModelAndView mv,@RequestParam String member_id,@RequestParam String car_no
			,@RequestParam String selectParkingBox) {
		
		int nTime = 0;
		int nPrice = 0;
		int aTime = 0;
		int aPrice = 0;
		int resultPrice = 0;
		HashMap<String, Object> member_idHmap = new HashMap<String,Object>();
		HashMap<String, Object> selectHmap = new HashMap<String,Object>();
		member_idHmap.put("member_id", member_id);
		
		
		try {
			
			//회원 아이디로 회원 번호 조회
			HashMap<String, Object> selectMemberNo = pms.selectNomalMemberMemberNo(member_idHmap);
			//조회해온 회원번호,차량번호,주차장번호 데이터 삽입
			selectHmap.put("member_no", Integer.parseInt(selectMemberNo.get("MEMBER_NO")+""));
			selectHmap.put("parking_no", selectParkingBox);
			selectHmap.put("car_no", car_no);
			

			//selectHmap으로 입차정보 구해오기
			HashMap<String, Object> selectEntryData = pms.selectNomalMemberUseTiems(selectHmap);
			//selectHmap으로 주차장 기본,추가 시간/요금 조회해오기

			
			int resultUseTime = Integer.parseInt(selectEntryData.get("END_TIME")+"");
			//기본시간,기본요금,추가시간,추가요금 가져오기
			HashMap<String, Integer> selectParkingUseTimeAndPrice = pms.selectNonMemberParkingUseTimeAndPrice(selectParkingBox);
			
			//각 시간이 0이나 null이 아닐시 계산구하기
			if(selectParkingUseTimeAndPrice.get("PARKING_NTIME") != null || selectParkingUseTimeAndPrice.get("PARKING_NTIME")+"" != "" ) {
				nTime = Integer.parseInt(selectParkingUseTimeAndPrice.get("PARKING_NTIME")+"");				
			}else {
				nTime = 0;
			}
			
			if(selectParkingUseTimeAndPrice.get("PARKING_NPRICE") != null || selectParkingUseTimeAndPrice.get("PARKING_NPRICE")+"" != "" ) {
				nPrice =  Integer.parseInt(selectParkingUseTimeAndPrice.get("PARKING_NPRICE")+"");				
			}else {
				nPrice = 0;
			}
			
			if(selectParkingUseTimeAndPrice.get("PARKING_NPRICE") != null || selectParkingUseTimeAndPrice.get("PARKING_NPRICE")+"" != "" ) {
				aTime = Integer.parseInt(selectParkingUseTimeAndPrice.get("PARKING_ATIME")+"");				
			}else {
				aTime = 0;
			}
			
			if(selectParkingUseTimeAndPrice.get("PARKING_NPRICE") != null || selectParkingUseTimeAndPrice.get("PARKING_NPRICE")+"" != "" ) {
				aPrice =  Integer.parseInt(selectParkingUseTimeAndPrice.get("PARKING_APRICE")+"");				
			}else {
				aTime = 0;
			}
			
			if(nTime != 0) {
				resultUseTime = resultUseTime - nTime;
				resultPrice = nPrice;
				if(aTime != 0) {
					resultPrice += ((int)(resultUseTime/aTime))*aPrice;
				}else {
					resultPrice += ((int)(resultUseTime/nTime))*nPrice;
				}
			}
			
			
			selectEntryData.put("resultPrice", resultPrice);
			mv.addObject("hmap", selectEntryData);
			
		}catch(Exception e) {
			mv.addObject("message", "출차 정보 조회 실패!");
			mv.setViewName("jsonView");
			return mv;
		}
		mv.setViewName("jsonView");
		return mv;
	}
	
	
	//일반회원 현장결제 메소드
	@RequestMapping(value="/nomalDirectPayment.pc",method=RequestMethod.POST)
	public ModelAndView nomalDirectPayment(ModelAndView mv,
			@RequestParam String resultNomalMemberNo2,@RequestParam String resultNomalCarNo2,@RequestParam String resultNomalEndTime
			,@RequestParam String resultFee,@RequestParam String selectParkingBox) {
		
		HashMap<String, Object> data = new HashMap<String,Object>();
		data.put("parking_no", selectParkingBox);
		data.put("member_no", Integer.parseInt(resultNomalMemberNo2+""));
		data.put("hours",Integer.parseInt(resultNomalEndTime)+"");
		data.put("fee", Integer.parseInt(resultFee+""));
		data.put("car_no", resultNomalCarNo2);
		
		
		try {
			//일반회원 현장결제 출차 업데이트
			pms.updateNomalMemberCurrentPayment(data);
			//주차장 구획수 증가
			pms.plusNonMemberParkingLeftSize(data);
			
		}catch(Exception e) {
			mv.addObject("message", "일반회원 현장결제 실패!");
			mv.setViewName("jsonView");
			return mv;
		}
		
		
		mv.setViewName("jsonView");
		return mv;
	}
	
	
	//일반회원 포인트 조회 메소드
	@RequestMapping(value="/searchNomalMemberPoint.pc",method=RequestMethod.POST)
	public ModelAndView searchNomalMemberPoint(ModelAndView mv,@RequestParam String resultNomalMemberNo2) {
		HashMap<String, Object> selectHmap = new HashMap<String,Object>();
		selectHmap.put("member_no", Integer.parseInt(resultNomalMemberNo2+""));
		
		try {
			HashMap<String, Object> resultHmap = pms.selectSearchNomalMemberPoint(selectHmap);
			mv.addObject("hmap", resultHmap);
		}catch(Exception e) {
			mv.addObject("message", "포인트조회 실패!");
			mv.setViewName("jsonView");
			return mv;
		}
		
		
		mv.setViewName("jsonView");
		return mv;
	}
	
	//일반회원 포인트 결제 메소드
	@RequestMapping(value="/nomalPointPayment.pc",method=RequestMethod.POST)
	public ModelAndView nomalPointPayment(ModelAndView mv,
			@RequestParam String resultNomalMemberNo2,@RequestParam String resultNomalCarNo2,@RequestParam String resultNomalEndTime
			,@RequestParam String resultFee,@RequestParam String selectParkingBox) {

		HashMap<String, Object> data = new HashMap<String,Object>();
		data.put("parking_no", selectParkingBox);
		data.put("member_no", Integer.parseInt(resultNomalMemberNo2+""));
		data.put("hours",Integer.parseInt(resultNomalEndTime)+"");
		data.put("fee", Integer.parseInt(resultFee+""));
		data.put("car_no", resultNomalCarNo2);
		
		try {
			//입출차 내역 업데이트
			pms.updateNomalMemberPointPayment(data);
			//회원 오일 차감
			pms.updateNomalMemberOil(data);
			//주차장 구획수 증가
			pms.plusNonMemberParkingLeftSize(data);
			
		}catch(Exception e) {
			mv.addObject("message", "포인트 결제 실패!");
			mv.setViewName("jsonView");
			return mv;
		}
		
		
		mv.setViewName("jsonView");
		return mv;
	}
	
	
	//예약회원 입차 정보 메소드
	@RequestMapping(value="/searchResInformation.pc",method=RequestMethod.POST)
	public ModelAndView searchResInformation(ModelAndView mv,@RequestParam String resNo,@RequestParam String selectParkingBox) {
		
		HashMap<String, Object> selectHmap = new HashMap<String,Object>();
		selectHmap.put("res_no", Integer.parseInt(resNo));
		selectHmap.put("parking_no", selectParkingBox);
		
		//예약번호와 주차장번호로 회원정보 조회하기
		try {
			HashMap<String, Object> hmap = pms.searchResInformation(selectHmap);
			mv.addObject("hmap", hmap);
		}catch(Exception e) {
			e.printStackTrace();
			mv.addObject("message", "예약회원 정보조회 실패!");
			mv.setViewName("jsonView");
			return mv;
		}
		
		
		mv.setViewName("jsonView");
		return mv;
	}
	
	
	//예약회원 출자정보 메소드
	@RequestMapping(value="/searchOutResInformation.pc",method=RequestMethod.POST)
	public ModelAndView searchOutResInformation(ModelAndView mv,@RequestParam String selectParkingBox,
			@RequestParam String car_no) {
		
		int nTime = 0;
		int nPrice = 0;
		int aTime = 0;
		int aPrice = 0;
		int resultPrice = 0;
		HashMap<String, Object> selectHmap = new HashMap<String,Object>();
		
		selectHmap.put("parking_no", selectParkingBox);
		selectHmap.put("car_no", car_no);
		
		try {
				//주차장번호와 차번호로 예약정보 불러오기
				HashMap<String, Object> selectEntryData = pms.searchOutResInformation(selectHmap);
				
				
				//주차장번호로 기본,추가 시간/요금 구해오기
				int resultUseTime = Integer.parseInt(selectEntryData.get("END_TIME")+"");
				//기본시간,기본요금,추가시간,추가요금 가져오기
				HashMap<String, Integer> selectParkingUseTimeAndPrice = pms.selectNonMemberParkingUseTimeAndPrice(selectParkingBox);
				
				//각 시간이 0이나 null이 아닐시 계산구하기
				if(selectParkingUseTimeAndPrice.get("PARKING_NTIME") != null || selectParkingUseTimeAndPrice.get("PARKING_NTIME")+"" != "" ) {
					nTime = Integer.parseInt(selectParkingUseTimeAndPrice.get("PARKING_NTIME")+"");				
				}else {
					nTime = 0;
				}
				
				if(selectParkingUseTimeAndPrice.get("PARKING_NPRICE") != null || selectParkingUseTimeAndPrice.get("PARKING_NPRICE")+"" != "" ) {
					nPrice =  Integer.parseInt(selectParkingUseTimeAndPrice.get("PARKING_NPRICE")+"");				
				}else {
					nPrice = 0;
				}
				
				if(selectParkingUseTimeAndPrice.get("PARKING_NPRICE") != null || selectParkingUseTimeAndPrice.get("PARKING_NPRICE")+"" != "" ) {
					aTime = Integer.parseInt(selectParkingUseTimeAndPrice.get("PARKING_ATIME")+"");				
				}else {
					aTime = 0;
				}
				
				if(selectParkingUseTimeAndPrice.get("PARKING_NPRICE") != null || selectParkingUseTimeAndPrice.get("PARKING_NPRICE")+"" != "" ) {
					aPrice =  Integer.parseInt(selectParkingUseTimeAndPrice.get("PARKING_APRICE")+"");				
				}else {
					aTime = 0;
				}
				
				if(nTime != 0) {
					resultUseTime = resultUseTime - nTime;
					resultPrice = nPrice;
					if(aTime != 0) {
						resultPrice += ((int)(resultUseTime/aTime))*aPrice;
					}else {
						resultPrice += ((int)(resultUseTime/nTime))*nPrice;
					}
				}
				selectEntryData.put("resultPrice", resultPrice);
				mv.addObject("hmap", selectEntryData);
		}catch(Exception e) {
			e.printStackTrace();
			mv.addObject("message", "출차정보 조회 실패!");
			mv.setViewName("jsonView");
			return mv;
		}
		mv.setViewName("jsonView");
		return mv;
	}
	
	
	@RequestMapping(value="/resDirectPayment.pc",method=RequestMethod.POST)
	public ModelAndView resDirectPayment(ModelAndView mv,@RequestParam String selectParkingBox,
			@RequestParam String resultResMemberNo2,@RequestParam String resultResCarNo2,
			@RequestParam String resultResEndTime,@RequestParam String resultResFee,@RequestParam String resultResNo2) {
		
		HashMap<String, Object> data = new HashMap<String,Object>();
		data.put("parking_no", selectParkingBox);
		data.put("member_no", Integer.parseInt(resultResMemberNo2+""));
		data.put("hours",Integer.parseInt(resultResEndTime)+"");
		data.put("fee", Integer.parseInt(resultResFee+""));
		data.put("car_no", resultResCarNo2);
		data.put("res_no", Integer.parseInt(resultResNo2+""));
		
		
		try {
			//일반회원 현장결제 출차 업데이트
			pms.updateResMemberCurrentPayment(data);
			//주차장 구획수 증가
			pms.plusNonMemberParkingLeftSize(data);
		}catch(Exception e) {
			e.printStackTrace();
			mv.addObject("message", "예약회원 출차 실패!");
			mv.setViewName("jsonView");
			return mv;
		}
		
		
		
		mv.setViewName("jsonView");
		return mv;
	}
	
	
}
