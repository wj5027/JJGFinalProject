package com.kh.tsp.customer.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.security.auth.login.LoginException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.tsp.common.PageInfo;
import com.kh.tsp.customer.model.dao.CustomerMainDao;
import com.kh.tsp.customer.model.vo.CCoupon;
import com.kh.tsp.customer.model.vo.ChargeOil;
import com.kh.tsp.customer.model.vo.Member;
import com.kh.tsp.customer.model.vo.OilList;
import com.kh.tsp.customer.model.vo.Parking;
import com.kh.tsp.customer.model.vo.Points;
import com.kh.tsp.customer.model.vo.Reservation;
import com.kh.tsp.parkingceo.model.vo.ParkingCeoAttachmentVo;

@Service
public class CustomerMainServiceImpl implements CustomerMainService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private CustomerMainDao cmd;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	
	
	public CustomerMainServiceImpl() {
		// 기본 생성자
	}

	@Override
	public Member selectCheckMember(Member m) throws LoginException {
		
		Member loginUser = null;
		
		String encPassword = cmd.selectEncPassword(sqlSession, m);
		
		System.out.println("로그인 요청 메소드 실행됨: "+encPassword);
		
		if(!passwordEncoder.matches(m.getMember_pwd(), encPassword)) {
			throw new LoginException("로그인 실패실패");
			
		}else {
			loginUser = cmd.selectCheckMember(sqlSession,m);
			//System.out.println("loginUser: "+loginUser);
		}
		
		return loginUser;
	}

	@Override
	public ArrayList<Parking> getnearParkings(Points p) {
		return cmd.selectnearParkings(p,sqlSession);
	}

	@Override
	public HashMap<String, Parking> searchVoiceParking(HashMap<String, String> mapKeyword, String type) {
		
		HashMap<String, Parking> hmap = new HashMap<String, Parking>();
		
		if (type.equals("지역")) {
			if (cmd.selectSearchTextCount(sqlSession, mapKeyword.get("keyword")) < 351) {
				hmap = cmd.searchVoiceLocalParking(sqlSession, mapKeyword);
			} else {
				
			}
		} else if (type.equals("근처 주차장")) {
			hmap = cmd.searchVoiceNearParking(sqlSession, mapKeyword);
		} else {
			hmap = null;
		}
		
		return hmap;
	}

	@Override
	public HashMap<String, Parking> selectSearchTextParking(HashMap<String, String> mapKeyword) {
		
		HashMap<String, Parking> hmap = new HashMap<String, Parking>();
		
		if (cmd.selectSearchTextCount(sqlSession, mapKeyword.get("keyword")) < 351) {
			hmap = cmd.selectSearchTextParking(sqlSession, mapKeyword);
		} else {
			
		}
		
		return hmap;
	}

	@Override
	public ArrayList<Reservation> selectShowReserv(Member member, PageInfo pi) {
		return cmd.selectShowReserv(sqlSession, member, pi);
	}
	
	@Override
	public int selectReservCount(Member member) {
		return cmd.selectReservCount(sqlSession, member);
	}
	
	//카카오톡 로그인
	public Member selectCheckKakao(String kakao_id) throws LoginException {
		
		
		return  cmd.selectCheckKakao(sqlSession, kakao_id);
	}
	//카카오톡 회원가입
	@Override
	public int insertKakao(Member m) {

		return cmd.insertKakao(sqlSession, m);
	}
	//아이디 중복확인
	@Override
	public Member idCheck(String member_id) {

		return cmd.idCheck(sqlSession, member_id);
	}
	//일반 회원가입
	@Override
	public int insertMember(Member m) {

		return cmd.insertMember(sqlSession, m);
	}

	@Override
	public int updateCancelReserve(Reservation reserv) {
		return cmd.updateCancelReserve(sqlSession, reserv);
	}

	@Override
	public String selectOneCancelAndReserveTime(int resNo) {
		return cmd.selectOneCancelAndReserveTime(sqlSession, resNo);
	}

	@Override
	public int updateCancelReserveOil(Reservation reserv) {
		return cmd.updateCancelReserveOil(sqlSession, reserv);
	}

	@Override
	public String selectCancelReason(Reservation reserv) {
		return cmd.selectCancelReason(sqlSession, reserv);
	}

	@Override
	public ArrayList<CCoupon> selectUserCoupon(Member member) {
		return cmd.selectUserCoupon(sqlSession, member);
	}


	@Override
	public int insertCustomerOilCharge(ChargeOil chargeOil) {
		return cmd.insertCustomerOilCharge(sqlSession, chargeOil);
	}

	@Override
	public void updateCustomerOilCharge(ChargeOil chargeOil) {
		cmd.updateCustomerOilCharge(sqlSession, chargeOil);
	}
	
	//아이디찾기
	@Override
	public Member findId(String email) {

		return cmd.findId(sqlSession, email);
	}
	//이메일중복
	@Override
	public Member emailCheck(String email) {

		return cmd.emailCheck(sqlSession, email);

	}


	@Override
	public ArrayList<OilList> searchOilList(OilList searchInfo, PageInfo pi) {
		return cmd.searchOilList(sqlSession, searchInfo, pi);
	}

	@Override
	public int getOilListCount(OilList searchInfo) {
		return cmd.getOilListCount(sqlSession, searchInfo);
	}

	//비밀번호 찾기
	@Override
	public Member chkForPwd(Member m) {

		return cmd.chkForPwd(sqlSession, m);
	}
	//임시비밀번호 등록
	@Override
	public int insertTempPwd(Member m) {

		return cmd.insertTempPwd(sqlSession, m);

	}

	@Override
	public int intsertRequestRefund(HashMap<String, String> requesthmap) {
		return cmd.intsertRequestRefund(sqlSession, requesthmap);
	}
	
	@Override
	public int updateRequestRefund(HashMap<String, String> requesthmap) {
		return cmd.updateRequestRefund(sqlSession, requesthmap);
	}

	@Override
	public int insertOilListRefund(HashMap<String, String> requesthmap) {
		// TODO Auto-generated method stub
		return cmd.insertOilListRefund(sqlSession, requesthmap);
	}
  
	@Override
	public Member chkNaver(String member_id) {
		return cmd.chkNaver(sqlSession, member_id);
	}
  
	//네이버 회원가입
	@Override
	public int insertNaver(Member m) {

		return cmd.insertNaver(sqlSession, m);
	}

	@Override
	public int insertRequestReserve(Reservation reservInfo) {
		return cmd.insertRequestReserve(sqlSession, reservInfo);
	}

	@Override

	public ArrayList<String> selectfavorites(int mno) {
		return cmd.selectfavorites(sqlSession, mno);
	}

	@Override
	public int insertfavorite(int mno, String pno) {
		return cmd.insertfavorite(sqlSession,mno,pno);
	}

	@Override
	public int deletefavorite(int mno, String pno) {
		return cmd.deletefavorite(sqlSession,mno,pno);
	}

	@Override
	public ArrayList<ParkingCeoAttachmentVo> selectParkingImg(String pno) {
		// TODO Auto-generated method stub
		return  cmd.selectParkingImg(sqlSession, pno);
	}

	@Override
	public Member getRefreshMember(Member m) {
		return cmd.getRefreshMember(sqlSession, m);
	}

	@Override
	public void insertCancelReserveOilList(Reservation reserv) {
		cmd.insertCancelReserveOilList(sqlSession, reserv);
	}

	@Override
	public String selectReservDay(int resDate) {
		return cmd.selectReservDay(sqlSession, resDate);
	}

	@Override
	public int insertRequestReserveOilList(Reservation reservInfo) {
		return cmd.insertRequestReserveOilList(sqlSession, reservInfo);
	}

	@Override
	public CCoupon selectParkingCoupon(String parkingNo) {
		return cmd.selectParkingCoupon(sqlSession, parkingNo);
	}

	@Override
	public int insertGetCoupon(CCoupon couponInfo) {
		return cmd.insertGetCoupon(sqlSession, couponInfo);
	}

	@Override
	public int updateGetCoupon(int requestCouponNo) {
		return cmd.updateGetCoupon(sqlSession, requestCouponNo);
	}

	@Override
	public void updateRequestReserveOil(Reservation reservInfo) {
		cmd.updateRequestReserveOil(sqlSession, reservInfo);
	}

	
	
}
