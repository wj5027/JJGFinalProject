package com.kh.tsp.admin.model.dao;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.tsp.admin.model.exception.ParkingCEOSelectListException;
import com.kh.tsp.admin.model.vo.MemberAdmin;
import com.kh.tsp.common.PageInfo;

@Repository
public class ParkingCEODaoImpl  implements ParkingCEODao{

	// 사업자 수
	@Override
	public int getListCount(SqlSessionTemplate sqlSession) throws ParkingCEOSelectListException {
		int listCount = sqlSession.selectOne("MemberAdmin.getListCount");
		if(listCount <=0) {
			throw new ParkingCEOSelectListException("사업자 회원 수 조회 실패!");
		}
		return listCount;
	}

	// 사업자 리스트
	@Override
	public ArrayList<MemberAdmin> selectParkingCEOList(SqlSessionTemplate sqlSession, PageInfo pi) throws ParkingCEOSelectListException {
		ArrayList<MemberAdmin> list = null;
		int offset = (pi.getCurrentPage()-1)* pi.getLimit();	
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("MemberAdmin.selectParkingCEOList", null, rowBounds);
		
		if(list == null) {
			throw new ParkingCEOSelectListException("사업자 회원 조회 실패");
		}
		return list;
	}

	// 회원 탈퇴
	@Override
	public int deleteParkingCEO(SqlSessionTemplate sqlSession, MemberAdmin md) throws ParkingCEOSelectListException {
		
		int memberNo = md.getMemberNo();
		System.out.println("memberNo : "+memberNo);
		
		int result = sqlSession.update("MemberAdmin.deleteParkingCEO", memberNo);
		System.out.println("result(DAO 회원탈퇴) : "+result);
		
		if(result<=0) {
			throw new ParkingCEOSelectListException("사업자 회원 탈퇴 실패!");
		}
		return result;
	}

	// 회원 복구
	@Override
	public int updateRecoverParkingCEO(SqlSessionTemplate sqlSession, MemberAdmin md) throws ParkingCEOSelectListException {
		
		int memberNo = md.getMemberNo();
		System.out.println("memberNo : "+memberNo);
		
		int result = sqlSession.update("MemberAdmin.updateRecoverParkingCEO", memberNo);
		System.out.println("result(DAO 회원복구) : "+result);
		
		if(result<=0) {
			throw new ParkingCEOSelectListException("사업자 회원 복구 실패!");
		}
		return result;
	}

	// 사업자 검색 수
	@Override
	public int getSearchListCount(SqlSessionTemplate sqlSession, String selectStatus, String memberId, String today,
			String startDate, String endDate) throws ParkingCEOSelectListException {

		Map<String, Object> hmap = new HashMap();

		hmap.put("selectStatus", selectStatus);
		hmap.put("memberId", memberId);
		hmap.put("today", today);
		hmap.put("startDate", startDate);
		hmap.put("endDate", endDate);
		
		int listCount = sqlSession.selectOne("MemberAdmin.getSearchListCount", hmap);
		if(listCount <=0) {
			throw new ParkingCEOSelectListException("사업자 검색 회원 수 조회 실패!");
		}
		return listCount;
	}

	// 사업자 검색 결과.
	@Override
	public ArrayList<MemberAdmin> selectSearchParkingCEOList(SqlSessionTemplate sqlSession, PageInfo pi,
			String selectStatus, String memberId, String today, String startDate, String endDate) throws ParkingCEOSelectListException {
		ArrayList<MemberAdmin> list = null;
		
		int offset = (pi.getCurrentPage()-1)* pi.getLimit();			
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());

		System.out.println("selectStatus DAO: "+selectStatus);
		System.out.println("memberId DAO: "+memberId);
		System.out.println("today DAO: "+today);
		System.out.println("startDate DAO: "+startDate);
		System.out.println("endDate DAO: "+endDate);
		
		Map<String, Object> hmap = new HashMap();

		hmap.put("selectStatus", selectStatus);
		hmap.put("memberId", memberId);
		hmap.put("today", today);
		hmap.put("startDate", startDate);
		hmap.put("endDate", endDate);
		
		list = (ArrayList)sqlSession.selectList("MemberAdmin.selectSearchParkingCEOList", hmap, rowBounds);
		
		System.out.println("DAO list : "+list);
		
		if(list == null) {
			throw new ParkingCEOSelectListException("사업자 회원 조회 실패");
		}
		return list;
	}

}
