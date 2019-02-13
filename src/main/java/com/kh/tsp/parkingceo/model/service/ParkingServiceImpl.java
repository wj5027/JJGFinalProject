package com.kh.tsp.parkingceo.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tsp.common.ParkingCeoPageInfo;
import com.kh.tsp.customer.model.vo.Member;
import com.kh.tsp.parkingceo.model.dao.ParkingDao;

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
	public int selectSearchParkingDetailListCount(String selectBox) {
		int listCount = 0;
		if(selectBox.equals("inputCar")) {
			listCount = pd.selectInputCarListCount(sqlSession);
		} else if (selectBox.equals("outputCar")) {
			listCount = pd.selectOutputCarListCount(sqlSession);
		}else {
			listCount = pd.selectInputOutputCarListCount(sqlSession);
		}
		return listCount;
	}

	@Override
	public HashMap<String, Object> selectSearchParkingDetailList(String selectBox, ParkingCeoPageInfo pi) {
		HashMap<String, Object>hmap = new HashMap<String, Object>();
		ArrayList<HashMap<String, Object>> list = null;
		String listType = "";
		if(selectBox.equals("inputCar")) {
			listType = "inputCar";
			list = pd.selectSearchParkingInputDetailList(sqlSession,pi);
			hmap.put("listType", listType);
			hmap.put("list", list);
		}else if (selectBox.equals("outputCar")) {
			listType = "outputCar";
			list = pd.selectSearchParkingOutputDetailList(sqlSession,pi);
			hmap.put("listType", listType);
			hmap.put("list", list);
		}else {
			listType = "inputOutputCar";
			list = pd.selectSearchParkingInputOutputDetailList(sqlSession,pi);
			hmap.put("listType", listType);
			hmap.put("list", list);
		}
		return hmap;
	}
}
