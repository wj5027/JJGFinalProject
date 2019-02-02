package com.kh.tsp.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tsp.admin.model.dao.ParkingCEODao;
import com.kh.tsp.admin.model.exception.ParkingCEOSelectListException;
import com.kh.tsp.admin.model.vo.MemberAdmin;
import com.kh.tsp.common.PageInfo;

@Service
public class ParkingCEOServiceImpl implements ParkingCEOService{

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private ParkingCEODao pcd;
	
	// 사업자 수
	@Override
	public int getListCount() throws ParkingCEOSelectListException {
		int listCount = pcd.getListCount(sqlSession);
		return listCount;
	}

	// 사업자 조회
	@Override
	public ArrayList<MemberAdmin> selectParkingCEOList(PageInfo pi) throws ParkingCEOSelectListException {
		ArrayList<MemberAdmin> list = pcd.selectParkingCEOList(sqlSession,pi);
		return list;
	}

}
