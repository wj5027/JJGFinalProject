package com.kh.tsp.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.tsp.admin.model.exception.ParkingException;
import com.kh.tsp.admin.model.vo.CouponRequestList;
import com.kh.tsp.admin.model.vo.ParkingListAdmin;
import com.kh.tsp.common.PageInfo;

@Repository
public class ParkingAdminDaoImpl  implements ParkingAdminDao{

	// 주차장 전체 수
	@Override
	public int getListCount(SqlSessionTemplate sqlSession) throws ParkingException {
		int listCount = sqlSession.selectOne("ParkingListAdmin.getListCount");
		System.out.println("주차장 전체 수 : "+listCount);
		if(listCount <=0) {
			throw new ParkingException("주차장 전체 수 조회 실패!");
		}
		return listCount;
	}

	// 주차장 전체 리스트
	@Override
	public ArrayList<ParkingListAdmin> selectParkingList(SqlSessionTemplate sqlSession, PageInfo pi)
			throws ParkingException {
		ArrayList<ParkingListAdmin> list = null;
		int offset = (pi.getCurrentPage()-1)* pi.getLimit();	
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("ParkingListAdmin.selectParkingList", null, rowBounds);
		
		if(list == null) {
			throw new ParkingException("주차장 전체 리스트 조회 실패");
		}
		return list;
	}

	// 리스트 상세보기 ajax
	@Override
	public ParkingListAdmin detailParkingLot(SqlSessionTemplate sqlSession, ParkingListAdmin pl)
			throws ParkingException {
		
		String parkingListNo = pl.getParkingListNo();
		
		pl = sqlSession.selectOne("ParkingListAdmin.detailParkingLot", parkingListNo);
		System.out.println("result(DAO 리스트 ) : "+pl);
		
		if(pl==null) {
			throw new ParkingException("특정 리스트 불러오가 실패!");
		}
		return pl;
	}

	// 승인 버튼
	@Override
	public int updateParkingLot(SqlSessionTemplate sqlSession, ParkingListAdmin pl) throws ParkingException {
		
		String parkingListNo = pl.getParkingListNo();
		String parkingNo = pl.getParkingNo();
		
		int result1 = sqlSession.update("ParkingListAdmin.updateParkingLot", parkingListNo);
		int result2 = sqlSession.update("ParkingListAdmin.updateParkingNo", parkingNo);
		
		int result = result1+result2;
		
		if(result1<=0 && result2<=0) {
			throw new ParkingException("승인 실패!");
		}
		return result;
	}

	// 반송 버튼
	@Override
	public int updateReturnParkingLot(SqlSessionTemplate sqlSession, ParkingListAdmin pl) throws ParkingException {
		
		int result = sqlSession.update("ParkingListAdmin.updateReturnParkingLot", pl);
		
		if(result<=0) {
			throw new ParkingException("반송 실패!");
		}
		return result;
	}

	// 반송 사유 ajax
	@Override
	public ParkingListAdmin updateCancelReasonDetail(SqlSessionTemplate sqlSession, ParkingListAdmin pl)
			throws ParkingException {
		
		String parkingListNo = pl.getParkingListNo();
		
		pl = sqlSession.selectOne("ParkingListAdmin.detailParkingLot", parkingListNo);
		
		if(pl==null) {
			throw new ParkingException("반송 사유 ajax 불러오가 실패!");
		}
		return pl;
	}

	// 검색 수
	@Override
	public int getSearchListCount(SqlSessionTemplate sqlSession, String parkingListStatus, String memberId, String parkingAddress,
			String parkingListName, String today, String startDate, String endDate) throws ParkingException {

		Map<String, Object> hmap = new HashMap<String, Object>();

		hmap.put("parkingListStatus", parkingListStatus);
		hmap.put("memberId", memberId);
		hmap.put("parkingAddress", parkingAddress);
		hmap.put("parkingListName", parkingListName);
		hmap.put("today", today);
		hmap.put("startDate", startDate);
		hmap.put("endDate", endDate);
		
		int listCount = sqlSession.selectOne("ParkingListAdmin.getSearchListCount", hmap);
		System.out.println("listCount DAO : "+listCount);
		return listCount;
	}

	// 검색 결과
	@Override
	public ArrayList<ParkingListAdmin> selectSearchParkingLotList(SqlSessionTemplate sqlSession, PageInfo pi, String parkingListStatus,
			String memberId, String parkingAddress, String parkingListName, String today, String startDate,
			String endDate) throws ParkingException {
		
		ArrayList<ParkingListAdmin> list = null;
		
		int offset = (pi.getCurrentPage()-1)* pi.getLimit();			
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		Map<String, Object> hmap = new HashMap();

		hmap.put("parkingListStatus", parkingListStatus);
		hmap.put("memberId", memberId);
		hmap.put("parkingAddress", parkingAddress);
		hmap.put("parkingListName", parkingListName);
		hmap.put("today", today);
		hmap.put("startDate", startDate);
		hmap.put("endDate", endDate);
		
		list = (ArrayList)sqlSession.selectList("ParkingListAdmin.selectSearchParkingLotList", hmap, rowBounds);
		
		System.out.println("DAO list : "+list);

		return list;
	}

	// 삭제 버튼
	@Override
	public int deleteRemoveParkingLot(SqlSessionTemplate sqlSession, ParkingListAdmin pl) throws ParkingException {
		
		String parkingListNo = pl.getParkingListNo();
		String parkingNo = pl.getParkingNo();
		
		int result1 = sqlSession.update("ParkingListAdmin.deleteRemoveParkingLot", parkingListNo);
		int result2 = sqlSession.update("ParkingListAdmin.deleteRemoveParkingNo", parkingNo);
		
		int result = result1+result2;
		
		if(result1<=0 && result2<=0) {
			throw new ParkingException("승인 실패!");
		}
		return result;
	}

}
