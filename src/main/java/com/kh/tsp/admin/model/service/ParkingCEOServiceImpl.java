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

	// 사업자 리스트
	@Override
	public ArrayList<MemberAdmin> selectParkingCEOList(PageInfo pi) throws ParkingCEOSelectListException {
		ArrayList<MemberAdmin> list = pcd.selectParkingCEOList(sqlSession,pi);
		return list;
	}

	// 회원 탈퇴
	@Override
	public int deleteParkingCEO(MemberAdmin md) throws ParkingCEOSelectListException {
		int result = pcd.deleteParkingCEO(sqlSession, md);
		return result;
	}

	// 회원 탈퇴
	@Override
	public int updateRecoverParkingCEO(MemberAdmin md) throws ParkingCEOSelectListException {
		int result = pcd.updateRecoverParkingCEO(sqlSession, md);
		return result;
	}

	// 사업자 검색 수
	@Override
	public int getSearchListCount(String selectStatus, String memberId, String today, String startDate, String endDate)
			throws ParkingCEOSelectListException {
		int listCount = pcd.getSearchListCount(sqlSession,selectStatus, memberId, today, startDate, endDate);
		return listCount;
	}

	// 사업자 검색 결과
	@Override
	public ArrayList<MemberAdmin> selectSearchParkingCEOList(PageInfo pi, String selectStatus, String memberId,
			String today, String startDate, String endDate) throws ParkingCEOSelectListException {
		ArrayList<MemberAdmin> list = pcd.selectSearchParkingCEOList(sqlSession,pi, selectStatus, memberId, today, startDate, endDate);
		return list;
	}

}
