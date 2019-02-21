package com.kh.tsp.parkingceo.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tsp.common.ParkingCeoPageInfo;
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



	

}
