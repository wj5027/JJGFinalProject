package com.kh.tsp.customer.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.tsp.customer.model.vo.CCoupon;
import com.kh.tsp.customer.model.vo.Member;
import com.kh.tsp.customer.model.vo.Parking;
import com.kh.tsp.customer.model.vo.Reservation;

public interface CustomerMainService {

	Member selectCheckMember(Member m);

	ArrayList<Parking> getnearParkings();

	HashMap<String, Parking> searchVoiceParking(String keyword, String type);

	HashMap<String, Parking> selectSearchTextParking(String keyword);


	ArrayList<Reservation> selectShowReserv(Member member);

	Member selectCheckKakao(String kakao_id);

	int insertKakao(Member m);

	int updateCancelReserve(Reservation reserv);

	String selectOneCancelAndReserveTime(int resNo);

	int updateCancelReserveOil(Reservation reserv);

	String selectCancelReason(Reservation reserv);

	ArrayList<CCoupon> selectUserCoupon(Member member);

	

}
