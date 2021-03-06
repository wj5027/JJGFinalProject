package com.kh.tsp.customer.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.security.auth.login.LoginException;

import com.kh.tsp.common.PageInfo;
import com.kh.tsp.customer.model.vo.CCoupon;
import com.kh.tsp.customer.model.vo.ChargeOil;
import com.kh.tsp.customer.model.vo.Member;
import com.kh.tsp.customer.model.vo.OilList;
import com.kh.tsp.customer.model.vo.Parking;
import com.kh.tsp.customer.model.vo.Points;
import com.kh.tsp.customer.model.vo.Reservation;
import com.kh.tsp.parkingceo.model.vo.ParkingCeoAttachmentVo;

public interface CustomerMainService {

	Member selectCheckMember(Member m) throws LoginException;

	ArrayList<Parking> getnearParkings(Points p);

	HashMap<String, Parking> searchVoiceParking(HashMap<String, String> mapKeyword, String type);

	HashMap<String, Parking> selectSearchTextParking(HashMap<String, String> mapKeyword);


	ArrayList<Reservation> selectShowReserv(Member member, PageInfo pi);

	Member selectCheckKakao(String kakao_id) throws LoginException;

	int insertKakao(Member m);


	int updateCancelReserve(Reservation reserv);

	String selectOneCancelAndReserveTime(int resNo);

	int updateCancelReserveOil(Reservation reserv);

	String selectCancelReason(Reservation reserv);

	ArrayList<CCoupon> selectUserCoupon(Member member);
	Member idCheck(String member_id);

	int insertMember(Member m);


	int insertCustomerOilCharge(ChargeOil chargeOil);

	void updateCustomerOilCharge(ChargeOil chargeOil);

	Member findId(String email);

	Member emailCheck(String email);


	ArrayList<OilList> searchOilList(OilList searchInfo, PageInfo pi);

	Member chkForPwd(Member m);

	int insertTempPwd(Member m);



	int getOilListCount(OilList searchInfo);


	int intsertRequestRefund(HashMap<String, String> requesthmap);

	Member chkNaver(String member_id);

	int insertNaver(Member m);

	int insertRequestReserve(Reservation reservInfo);

	int selectReservCount(Member member);

	ArrayList<String> selectfavorites(int mno);

	int insertfavorite(int mno, String pno);

	int deletefavorite(int mno, String pno);


	int updateRequestRefund(HashMap<String, String> requesthmap);


	int insertOilListRefund(HashMap<String, String> requesthmap);

	ArrayList<ParkingCeoAttachmentVo> selectParkingImg(String pno);

	Member getRefreshMember(Member m);

	void insertCancelReserveOilList(Reservation reserv);

	String selectReservDay(int parseInt);

	int insertRequestReserveOilList(Reservation reservInfo);

	CCoupon selectParkingCoupon(String parkingNo);

	int insertGetCoupon(CCoupon couponInfo);

	int updateGetCoupon(int requestCouponNo);

	void updateRequestReserveOil(Reservation reservInfo);



	
	
}
