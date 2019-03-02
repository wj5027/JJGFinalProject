package com.kh.tsp.parkingceo.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tsp.common.ParkingCeoPageInfo;
import com.kh.tsp.customer.model.vo.Member;
import com.kh.tsp.parkingceo.model.dao.ParkingMainDao;

@Service
public class ParkingMainServiceImpl implements ParkingMainService {

	@Autowired
	private ParkingMainDao pmd;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	public ParkingMainServiceImpl() {
		// TODO Auto-generated constructor stub
	}


	@Override
	public int selectListCountInsertParkingSystemList(HashMap<String, Object> selectHmap) {
		return pmd.selectListCountInsertParkingSystemList(sqlSession,selectHmap);
	}


	@Override
	public ArrayList<HashMap<String, Object>> selectSearchInsertParkingSystemList(HashMap<String, Object> selectHmap,
			ParkingCeoPageInfo pi) {
		return pmd.selectSearchInsertParkingSystemList(sqlSession,selectHmap,pi);
	}


	@Override
	public int selectListCountResParkingList(HashMap<String, Object> selectParkingBox) {
		return pmd.selectListCountResParkingList(sqlSession,selectParkingBox);
	}


	@Override
	public ArrayList<HashMap<String, Object>> selectSearchResParkingList(HashMap<String, Object> selectParkingBox,
			ParkingCeoPageInfo pi) {
		return pmd.selectSearchResParkingList(sqlSession,selectParkingBox,pi);
	}


	@Override
	public void updateResComplete(int completeResNo) {
		pmd.updateResComplete(sqlSession,completeResNo);
	}


	@Override
	public void updateResCancel(int completeResNo, String resCancelText) {
		if(resCancelText == "") {
			pmd.updateResCancel(sqlSession,completeResNo);
		}else {
			pmd.updateResCancel(sqlSession,completeResNo,resCancelText);
		}
		
	}


	@Override
	public HashMap<String, Object> searchPakringSize(HashMap<String, Object> searchHmap) {
		return pmd.searchPakringSize(sqlSession,searchHmap);
	}


	@Override
	public void insertEntryList(HashMap<String, Object> searchHashmap, String resultMemberNo, String resultResNo) {
		if(!resultResNo.equals("")) {
			 //예약회원일시
			 searchHashmap.put("res_no", Integer.parseInt(resultResNo));
			 int member_no = pmd.searchMemberNo(searchHashmap);
			 searchHashmap.put("member_no", member_no);
			 pmd.insertResMemberEntryList(sqlSession,searchHashmap);
		 }else if (!resultMemberNo.equals("")) { 
			//일반 회원일시
			 searchHashmap.put("member_no", Integer.parseInt(resultMemberNo));
			 pmd.insertNomalMemberEntryList(sqlSession,searchHashmap);		 
		 }else{
			 //비회원일시 
			 pmd.insertNonMemberEntryList(sqlSession,searchHashmap);
		 }
		 //입차일시 주차장 남은 대수 감소
		 pmd.updateLeftSize(sqlSession,searchHashmap);
		
	}


	@Override
	public HashMap<String, Object> selectNonMemberUseTime(HashMap<String, Object> searchData) {
		// 출차시간 업데이트
		pmd.updateNonMemberTimes(sqlSession,searchData);
		//사용시간,출차시간 가져오기
		HashMap<String,Object> hmap = pmd.selectNonMemberUseTime(sqlSession,searchData);
		return hmap;
	}


	@Override
	public HashMap<String, Integer> selectNonMemberParkingUseTimeAndPrice(String selectParkingBox) {
		return pmd.selectNonMemberParkingUseTimeAndPrice(sqlSession,selectParkingBox);
	}


	@Override
	public void updateNonMemberResultData(HashMap<String, Object> addResultData) {
		pmd.updateNonMemberResultData(sqlSession,addResultData);
	}


	@Override
	public HashMap<String, Object> selectNonMemberResultData(HashMap<String, Object> searchData) {
		return pmd.selectNonMemberResultData(sqlSession,searchData);
	}


	@Override
	public void plusNonMemberParkingLeftSize(HashMap<String, Object> searchData) {
		pmd.plusNonMemberParkingLeftSize(sqlSession,searchData);
	}


	@Override
	public Member selectNomalMemberInformation(HashMap<String, Object> selectHmap) {
		return pmd.selectNomalMemberInformation(sqlSession,selectHmap);
	}


	@Override
	public HashMap<String, Object> selectNomalMemberMemberNo(HashMap<String, Object> member_idHmap) {
		return pmd.selectNomalMemberMemberNo(sqlSession,member_idHmap);
	}


	@Override
	public HashMap<String, Object> selectNomalMemberUseTiems(HashMap<String, Object> selectHmap) {
		return pmd.selectNomalMemberUseTiems(sqlSession,selectHmap);
	}


	@Override
	public void updateNomalMemberCurrentPayment(HashMap<String, Object> data) {
		pmd.updateNomalMemberCurrentPayment(sqlSession,data);
	}


	@Override
	public HashMap<String, Object> selectSearchNomalMemberPoint(HashMap<String, Object> selectHmap) {
		return pmd.selectSearchNomalMemberPoint(sqlSession,selectHmap);
	}


	@Override
	public void updateNomalMemberPointPayment(HashMap<String, Object> data) {
		pmd.updateNomalMemberPointPayment(sqlSession,data);
	}


	@Override
	public void updateNomalMemberOil(HashMap<String, Object> data) {
		pmd.updateNomalMemberOil(sqlSession,data);
	}








	





	

}
