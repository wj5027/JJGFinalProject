package com.kh.tsp.parkingceo.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tsp.common.ParkingCeoPageInfo;
import com.kh.tsp.customer.model.vo.Member;
import com.kh.tsp.parkingceo.model.dao.ParkingDao;
import com.kh.tsp.parkingceo.model.vo.ParkingCeoAttachmentVo;
import com.kh.tsp.parkingceo.model.vo.ParkingCeoParkingListVo;
import com.kh.tsp.parkingceo.model.vo.ParkingCeoVo;

@Service
public class ParkingServiceImpl implements ParkingService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private ParkingDao pd;

	public ParkingServiceImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public int insertParkingCeo(Member m) {
		return pd.insertParkingCeo(sqlSession,m);
	}
	@Override
	public int selectNoteListCount(String selectBox, Member m) {
		int listCount = 0;
		if(selectBox.equals("insertParkingStatus")) {
			listCount = pd.selectParkingListCount(sqlSession,m);
		}else if(selectBox.equals("exchangeParkingStatus")) {
			listCount = pd.exchangeParkingListCount(sqlSession,m);
		}else if(selectBox.equals("insertCouponStatus")) {
			listCount = pd.selectCouponListCount(sqlSession,m);
		}else {
			listCount = pd.selectExchangeMoneyListCount(sqlSession,m);
		}
		return listCount;
	}


	@Override
	public HashMap<String, Object> selectNoteList(String selectBox, ParkingCeoPageInfo pi, Member m) {
		HashMap<String, Object> hmap = null;
		ArrayList<HashMap<String, Object>> list = null;
		String listType = "";
		if(selectBox.equals("insertParkingStatus")) {
			list = pd.selectParkingList(sqlSession,pi,m);
			hmap = new HashMap<String, Object>();
			listType = "selectParkingList";
			hmap.put("list", list);
			hmap.put("listType", listType);		
		}else if(selectBox.equals("exchangeParkingStatus")) {
			list = pd.selectExchangeParkingList(sqlSession,pi,m);
			hmap = new HashMap<String, Object>();
			listType = "selectExchangeParkingList";
			hmap.put("list", list);
			hmap.put("listType", listType);
		}else if(selectBox.equals("insertCouponStatus")) {
			list = pd.selectCouponList(sqlSession,pi,m);
			hmap = new HashMap<String, Object>();
			listType = "selectCouponList";
			hmap.put("list", list);
			hmap.put("listType", listType);
		}else {
			list = pd.selectExchangeMoneyList(sqlSession,pi,m);
			hmap = new HashMap<String, Object>();
			listType = "selectExchangeMoneyList";
			hmap.put("list", list);
			hmap.put("listType", listType);
		}
		return hmap;
	}

	@Override
	public int selectSearchParkingDetailListCount(String inOutputSelectBox,String parkingSelectBox) {
		int listCount = 0;
		HashMap<String, Object> hmap = null;
		if(inOutputSelectBox.equals("inputCar")) {
			hmap = new HashMap<String, Object>();
			hmap.put("parking_no", parkingSelectBox);
			listCount = pd.selectInputCarListCount(sqlSession,hmap);
		} else if (inOutputSelectBox.equals("outputCar")) {
			hmap = new HashMap<String, Object>();
			hmap.put("parking_no", parkingSelectBox);
			listCount = pd.selectOutputCarListCount(sqlSession,hmap);
		}else {
			hmap = new HashMap<String, Object>();
			hmap.put("parking_no", parkingSelectBox);
			listCount = pd.selectInputOutputCarListCount(sqlSession,hmap);
		}
		return listCount;
	}

	@Override
	public HashMap<String, Object> selectSearchParkingDetailList(String selectBox, ParkingCeoPageInfo pi,String parkingSelectBox) {
		HashMap<String, Object> daoHmap = null;
		HashMap<String, Object>hmap = new HashMap<String, Object>();
		ArrayList<HashMap<String, Object>> list = null;
		String listType = "";
		if(selectBox.equals("inputCar")) {
			daoHmap = new HashMap<String, Object>();
			daoHmap.put("parking_no", parkingSelectBox);
			listType = "inputCar";
			list = pd.selectSearchParkingInputDetailList(sqlSession,pi,daoHmap);
			hmap.put("listType", listType);
			hmap.put("list", list);
		}else if (selectBox.equals("outputCar")) {
			daoHmap = new HashMap<String, Object>();
			daoHmap.put("parking_no", parkingSelectBox);
			listType = "outputCar";
			list = pd.selectSearchParkingOutputDetailList(sqlSession,pi,daoHmap);
			hmap.put("listType", listType);
			hmap.put("list", list);
		}else {
			daoHmap = new HashMap<String, Object>();
			daoHmap.put("parking_no", parkingSelectBox);
			listType = "inputOutputCar";
			list = pd.selectSearchParkingInputOutputDetailList(sqlSession,pi,daoHmap);
			hmap.put("listType", listType);
			hmap.put("list", list);
		}
		return hmap;
	}

	
	// 주차장 등록
	@Override
	public void insertParkingOne(ParkingCeoVo parking, ArrayList<ParkingCeoAttachmentVo> attachList) {
		//주차장 테이블 등록
		pd.insertParkingOne(sqlSession,parking);
		//주차장 번호 조회
		String parkingNo = pd.selectParkingNo(sqlSession);
		//주차장 번호 값 넣기
		parking.setParkingNo(parkingNo);
		//주차장 리스트 테이블 등록
		pd.insertPakringListOne(sqlSession,parking);
		//주차장 리스트 번호 조회
		int parkingListNo = pd.selectParkingListNo(sqlSession);
		
		
		for(int i = 0 ; i < attachList.size(); i ++) {
			//주차장 리스트 번호 넣기
			attachList.get(i).setParking_list_no(parkingListNo);
			attachList.get(i).setParking_no(parkingNo);
			//파일 리스트 테이블 등록
			pd.insertAttachment(sqlSession,attachList.get(i));
		}
	}

	@Override
	public HashMap<String, Object> selectSearchParkingOne(ParkingCeoVo parking) {
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		//주차장 리스트 조회
		HashMap<String, Object> parkingList = pd.selectParkingListOne(sqlSession,parking);
		//주차장 리스트로 어테치먼트 조회 
		ArrayList<HashMap<String, Object>> attachList = pd.selectAttachmentList(sqlSession,parkingList);
		
		hmap.put("parkingListOne", parkingList);
		if(attachList != null) {
			hmap.put("attList", attachList);			
		}
		return hmap;
	}

	@Override
	public void insertExchangeParking(ParkingCeoVo parking, ArrayList<ParkingCeoAttachmentVo> attachList) {
		//주차장 리스트 테이블 등록
		pd.insertPakringListOne(sqlSession,parking);
		//주차장 리스트 번호 조회
		int parkingListNo = pd.selectParkingListNo(sqlSession);
		
		
		for(int i = 0 ; i < attachList.size(); i ++) {
			//주차장 리스트 번호 넣기
			attachList.get(i).setParking_list_no(parkingListNo);
			attachList.get(i).setParking_no(parking.getParkingNo());
			//파일 리스트 테이블 등록
			pd.insertAttachment(sqlSession,attachList.get(i));
		}
		
	}
	
	
}
