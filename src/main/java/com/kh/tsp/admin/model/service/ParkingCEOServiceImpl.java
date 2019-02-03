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
	
	// »ç¾÷ÀÚ ¼ö
	@Override
	public int getListCount() throws ParkingCEOSelectListException {
		int listCount = pcd.getListCount(sqlSession);
		return listCount;
	}

	// »ç¾÷ÀÚ Á¶È¸
	@Override
	public ArrayList<MemberAdmin> selectParkingCEOList(PageInfo pi) throws ParkingCEOSelectListException {
		ArrayList<MemberAdmin> list = pcd.selectParkingCEOList(sqlSession,pi);
		return list;
	}

	// È¸¿ø Å»Åð
	@Override
	public int deleteParkingCEO(MemberAdmin md) throws ParkingCEOSelectListException {
		int result = pcd.deleteParkingCEO(sqlSession, md);
		return result;
	}

	// È¸¿ø Å»Åð
	@Override
	public int updateRecoverParkingCEO(MemberAdmin md) throws ParkingCEOSelectListException {
		int result = pcd.updateRecoverParkingCEO(sqlSession, md);
		return result;
	}

}
