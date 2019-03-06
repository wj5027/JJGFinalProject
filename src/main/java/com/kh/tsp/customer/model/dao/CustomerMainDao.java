package com.kh.tsp.customer.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.tsp.common.PageInfo;
import com.kh.tsp.customer.model.vo.CCoupon;
import com.kh.tsp.customer.model.vo.ChargeOil;
import com.kh.tsp.customer.model.vo.Member;
import com.kh.tsp.customer.model.vo.OilList;
import com.kh.tsp.customer.model.vo.Parking;
import com.kh.tsp.customer.model.vo.Points;
import com.kh.tsp.customer.model.vo.Reservation;
import com.kh.tsp.parkingceo.model.vo.ParkingCeoAttachmentVo;

public interface CustomerMainDao {

	Member selectCheckMember(SqlSessionTemplate sqlSession, Member m);

	ArrayList<Parking> selectnearParkings(Points p, SqlSessionTemplate sqlSession);

	HashMap<String, Parking> searchVoiceLocalParking(SqlSessionTemplate sqlSession, HashMap<String, String> mapKeyword);

	HashMap<String, Parking> searchVoiceNearParking(SqlSessionTemplate sqlSession, HashMap<String, String> mapKeyword);

	HashMap<String, Parking> selectSearchTextParking(SqlSessionTemplate sqlSession, HashMap<String, String> mapKeyword);
	
	int selectSearchTextCount(SqlSessionTemplate sqlSession, String keyword);

	ArrayList<Reservation> selectShowReserv(SqlSessionTemplate sqlSession, Member member, PageInfo pi);

	Member selectCheckKakao(SqlSessionTemplate sqlSession, String kakao_id);

	int insertKakao(SqlSessionTemplate sqlSession, Member m);


	int updateCancelReserve(SqlSessionTemplate sqlSession, Reservation reserv);

	String selectOneCancelAndReserveTime(SqlSessionTemplate sqlSession, int resNo);

	int updateCancelReserveOil(SqlSessionTemplate sqlSession, Reservation reserv);

	String selectCancelReason(SqlSessionTemplate sqlSession, Reservation reserv);

	ArrayList<CCoupon> selectUserCoupon(SqlSessionTemplate sqlSession, Member member);

	Member idCheck(SqlSessionTemplate sqlSession, String member_id);

	int insertMember(SqlSessionTemplate sqlSession, Member m);


	int insertCustomerOilCharge(SqlSessionTemplate sqlSession, ChargeOil chargeOil);

	void updateCustomerOilCharge(SqlSessionTemplate sqlSession, ChargeOil chargeOil);

	Member findId(SqlSessionTemplate sqlSession, String email);

	Member emailCheck(SqlSessionTemplate sqlSession, String email);

	String selectEncPassword(SqlSessionTemplate sqlSession, Member m);


	ArrayList<OilList> searchOilList(SqlSessionTemplate sqlSession, OilList searchInfo, PageInfo pi);

	int getOilListCount(SqlSessionTemplate sqlSession, OilList searchInfo);

	Member chkForPwd(SqlSessionTemplate sqlSession, Member m);

	int insertTempPwd(SqlSessionTemplate sqlSession, Member m);


	int intsertRequestRefund(SqlSessionTemplate sqlSession, HashMap<String, String> requesthmap);

	Member chkNaver(SqlSessionTemplate sqlSession, String member_id);

	int insertNaver(SqlSessionTemplate sqlSession, Member m);

	int insertRequestReserve(SqlSessionTemplate sqlSession, Reservation reservInfo);

	int selectReservCount(SqlSessionTemplate sqlSession, Member member);


	ArrayList<String> selectfavorites(SqlSessionTemplate sqlSession, int mno);

	int insertfavorite(SqlSessionTemplate sqlSession, int mno, String pno);

	int deletefavorite(SqlSessionTemplate sqlSession, int mno, String pno);






	int updateRequestRefund(SqlSessionTemplate sqlSession, HashMap<String, String> requesthmap);


	int insertOilListRefund(SqlSessionTemplate sqlSession, HashMap<String, String> requesthmap);

	ArrayList<ParkingCeoAttachmentVo> selectParkingImg(SqlSessionTemplate sqlSession, String pno);

	Member getRefreshMember(SqlSessionTemplate sqlSession, Member m);

	void insertCancelReserveOilList(SqlSessionTemplate sqlSession, Reservation reserv);

	String selectReservDay(SqlSessionTemplate sqlSession, int resDate);

	int insertRequestReserveOilList(SqlSessionTemplate sqlSession, Reservation reservInfo);

	CCoupon selectParkingCoupon(SqlSessionTemplate sqlSession, String parkingNo);

	int insertGetCoupon(SqlSessionTemplate sqlSession, CCoupon couponInfo);

	int updateGetCoupon(SqlSessionTemplate sqlSession, int requestCouponNo);

	void updateRequestReserveOil(SqlSessionTemplate sqlSession, Reservation reservInfo);

	
	

}
