package com.kh.tsp.customer.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.tsp.customer.model.service.CustomerMainService;
import com.kh.tsp.customer.model.vo.ChargeOil;
import com.kh.tsp.customer.model.vo.Member;
import com.kh.tsp.customer.model.vo.Parking;
import com.kh.tsp.customer.model.vo.Reservation;

@SessionAttributes("loginUser")
@Controller
public class CustomerPayment {

	@Autowired
	private CustomerMainService cms;
	
	public CustomerPayment() {
		
	}
	
	@RequestMapping(value="/oil.cu", method=RequestMethod.GET)
	public String CustomerOil(HttpServletRequest request) {
		
		return "customer/member/Customer_oil";
	}
	
	@RequestMapping(value="/oilIn.cu", method=RequestMethod.GET)
	public String CustomerOilInsert(HttpServletRequest request) {
		String imp_uid;
		String merchant_uid;
		boolean imp_success;
		String [] breakString;
		if (request.getParameter("imp_uid") != null && request.getParameter("merchant_uid") != null && request.getParameter("imp_success") != null) {
			imp_uid = request.getParameter("imp_uid");
			merchant_uid = request.getParameter("merchant_uid");
			imp_success = Boolean.valueOf(request.getParameter("imp_success"));
			
			breakString = request.getParameter("merchant_uid").split("_");
			
			System.out.println("결재를 진행하였어요!");
			System.out.println(imp_uid + "\r\n" + merchant_uid + "\r\n" + imp_success);
			
			if (imp_success) { // 오일 내역에 등록
				ChargeOil chargeOil = new ChargeOil();
				
				chargeOil.setImp_uid(imp_uid);
				chargeOil.setMerchant_uid(merchant_uid);
				chargeOil.setImp_success(imp_success);
				chargeOil.setMemberNo(Integer.parseInt(breakString[0]));
				chargeOil.setOil(Integer.parseInt(breakString[1]));
				
				int result = 0;
				
				result = cms.insertCustomerOilCharge(chargeOil);
				
				if (result > 0) { // 회원 오일을 늘려줍니다!
					cms.updateCustomerOilCharge(chargeOil);
					System.out.println("결제를 무사히 마치고 DB에 등록도 됫어요!");
				}
			} else {
				System.out.println("결제에 실패했으니 원래 페이지로 이동할게요...ㅜㅜㅜ");
			}
			
		}
		return "redirect:oil.cu";
	}
	
	@RequestMapping(value="/reserv.cu", method=RequestMethod.GET)
	public String showCustomerReserve(HttpServletRequest request, HttpSession session) {
		Member member = (Member) session.getAttribute("loginUser");
		
		if (member != null) {
			ArrayList<Reservation> reservList = cms.selectShowReserv(member);
			
			request.setAttribute("reservList", reservList);
			
			System.out.println(reservList);
		} else {
			System.out.println("로그인 정보가 없습니다!");
		}
		
		return "customer/promotion/Customer_reserv";
	}
	
	@RequestMapping("updateCancelReserve.cu")
	public @ResponseBody String updateCancelReserve(@RequestParam String resNo, HttpSession session) {
		
		Member member = (Member) session.getAttribute("loginUser");
		
		Reservation reserv = new Reservation();
		
		reserv.setResNo(Integer.parseInt(resNo));
		reserv.setMemberNo(member.getMember_no());
		
		int result = cms.updateCancelReserve(reserv);
		
		if (result > 0) { // 취소 성공 시 시간을 체크하여 오일을 환불
			result = 0;
			
			result = Integer.parseInt(cms.selectOneCancelAndReserveTime(Integer.parseInt(resNo)));
			System.out.println(result);
			if (result > 60) { // 시간이 한시간 전이여서 오일 환불 - 주차장의 nprice의 3배
				result = 0;
				
				result = cms.updateCancelReserveOil(reserv);
				
				if (result > 0) {
					return "취소 및 환불 성공";
				} else {
					return "취소 성공";
				}
			} else {
				
				return "취소 성공";
			}
			
		}else {
			return "실패";
		}
		
    }
	
	@RequestMapping("selectCancelReason.cu")
	public @ResponseBody String selectCancelReason(@RequestParam String resNo, HttpSession session) {
		
		Member member = (Member) session.getAttribute("loginUser");
		
		Reservation reserv = new Reservation();
		
		reserv.setResNo(Integer.parseInt(resNo));
		reserv.setMemberNo(member.getMember_no());
		
		String result = cms.selectCancelReason(reserv);
		
		return result;
    }
}
