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

import com.kh.tsp.admin.model.exception.CustomerSelectListException;
import com.kh.tsp.admin.model.vo.MemberAdmin;
import com.kh.tsp.admin.model.vo.OilListAdmin;
import com.kh.tsp.common.PageInfo;

@Repository
public class CustomerDaoImpl  implements CustomerDao{

	// 사용자 수
	@Override
	public int getListCount(SqlSessionTemplate sqlSession) throws CustomerSelectListException {
		int listCount = sqlSession.selectOne("MemberAdmin2.getListCount");
		if(listCount <=0) {
			throw new CustomerSelectListException("사용자 회원 수 조회 실패!");
		}
		return listCount;
	}

	// 사용자 리스트
	@Override
	public ArrayList<MemberAdmin> selectCustomerList(SqlSessionTemplate sqlSession, PageInfo pi) throws CustomerSelectListException {
		ArrayList<MemberAdmin> list = null;
		int offset = (pi.getCurrentPage()-1)* pi.getLimit();	
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("MemberAdmin2.selectCustomerList", null, rowBounds);
		
		if(list == null) {
			throw new CustomerSelectListException("사용자 회원 조회 실패");
		}
		return list;
	}

	// 회원 탈퇴
	@Override
	public int deleteCustomer(SqlSessionTemplate sqlSession, MemberAdmin md) throws CustomerSelectListException {
		
		int memberNo = md.getMemberNo();
		System.out.println("memberNo : "+memberNo);
		
		int result = sqlSession.update("MemberAdmin2.deleteCustomer", memberNo);
		System.out.println("result(DAO 회원탈퇴) : "+result);
		
		if(result<=0) {
			throw new CustomerSelectListException("사용자 회원 탈퇴 실패!");
		}
		return result;
	}

	// 회원 복구
	@Override
	public int updateRecoverCustomer(SqlSessionTemplate sqlSession, MemberAdmin md) throws CustomerSelectListException {
		
		int memberNo = md.getMemberNo();
		System.out.println("memberNo : "+memberNo);
		
		int result = sqlSession.update("MemberAdmin2.updateRecoverCustomer", memberNo);
		System.out.println("result(DAO 회원복구) : "+result);
		
		if(result<=0) {
			throw new CustomerSelectListException("사용자 회원 복구 실패!");
		}
		return result;
	}

	// 사용자 검색 수
	@Override
	public int getSearchListCount(SqlSessionTemplate sqlSession, String selectStatus, String memberId, String today,
			String startDate, String endDate) throws CustomerSelectListException {

		Map<String, Object> hmap = new HashMap();

		hmap.put("selectStatus", selectStatus);
		hmap.put("memberId", memberId);
		hmap.put("today", today);
		hmap.put("startDate", startDate);
		hmap.put("endDate", endDate);
		
		int listCount = sqlSession.selectOne("MemberAdmin2.getSearchListCount", hmap);
		/*if(listCount <=0) {
			throw new CustomerSelectListException("사용자 검색 회원 수 조회 실패!");
		}*/
		return listCount;
	}

	// 사용자 검색 결과.
	@Override
	public ArrayList<MemberAdmin> selectSearchCustomerList(SqlSessionTemplate sqlSession, PageInfo pi,
			String selectStatus, String memberId, String today, String startDate, String endDate) throws CustomerSelectListException {
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
		
		list = (ArrayList)sqlSession.selectList("MemberAdmin2.selectSearchCustomerList", hmap, rowBounds);
		
		System.out.println("DAO list : "+list);
		
		/*if(list == null) {
			throw new CustomerSelectListException("사용자 회원 조회 실패");
		}*/
		return list;
	}

	
	// 사용자 통계 리스트 수
	@Override
	public int getStatisticsListCount(SqlSessionTemplate sqlSession) throws CustomerSelectListException {
		int listCount = sqlSession.selectOne("MemberAdmin2.getStatisticsListCount");
		if(listCount <=0) {
			throw new CustomerSelectListException("사용자 통계 리스트 수 조회 실패!");
		}
		return listCount;
	}

	// 사용자 통계 리스트
	@Override
	public ArrayList<OilListAdmin> selectStatisticsCustomerList(SqlSessionTemplate sqlSession, PageInfo pi)
			throws CustomerSelectListException {
		ArrayList<OilListAdmin> list = null;
		int offset = (pi.getCurrentPage()-1)* pi.getLimit();	
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("MemberAdmin2.selectStatisticsCustomerList", null, rowBounds);
		
		if(list == null) {
			throw new CustomerSelectListException("사용자 통계 리스트 조회 실패");
		}
		return list;
	}

	// 충전 합계
	@Override
	public ArrayList<OilListAdmin> selectStatisticsCustomerListNoPaging(SqlSessionTemplate sqlSession)
			throws CustomerSelectListException {
		
		ArrayList<OilListAdmin> list = (ArrayList)sqlSession.selectList("MemberAdmin2.selectStatisticsCustomerListNoPaging");
		
		if(list == null) {
			throw new CustomerSelectListException("사용자 통계 리스트 조회 실패");
		}
		return list;
	}

	// 사용자 통계 검색 수
	@Override
	public int getSearchStatisticsCustomerListCount(SqlSessionTemplate sqlSession, String selectStatus,
			String startMoney, String endMoney, String memberId, String today, String startDate, String endDate)
			throws CustomerSelectListException {

		Map<String, Object> hmap = new HashMap();

		hmap.put("selectStatus", selectStatus);
		hmap.put("memberId", memberId);
		hmap.put("startMoney", startMoney);
		hmap.put("endMoney", endMoney);
		hmap.put("today", today);
		hmap.put("startDate", startDate);
		hmap.put("endDate", endDate);
		
		int listCount = sqlSession.selectOne("MemberAdmin2.getSearchStatisticsCustomerListCount", hmap);

		return listCount;
	}

	// 사용자 통계 검색 리스트
	@Override
	public ArrayList<OilListAdmin> selectSearchStatisticsCustomerList(SqlSessionTemplate sqlSession, PageInfo pi,
			String selectStatus, String startMoney, String endMoney, String memberId, String today, String startDate,
			String endDate) throws CustomerSelectListException {
		System.out.println("startMoney : "+startMoney);

		ArrayList<OilListAdmin> list = null;
		
		int offset = (pi.getCurrentPage()-1)* pi.getLimit();			
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		Map<String, Object> hmap = new HashMap();

		hmap.put("selectStatus", selectStatus);
		hmap.put("memberId", memberId);
		hmap.put("startMoney", startMoney);
		hmap.put("endMoney", endMoney);
		hmap.put("today", today);
		hmap.put("startDate", startDate);
		hmap.put("endDate", endDate);
		
		list = (ArrayList)sqlSession.selectList("MemberAdmin2.selectSearchStatisticsCustomerList", hmap, rowBounds);
		
		System.out.println("DAO list : "+list);
		
		return list;
	}

	// 충전 합계 (검색)
	@Override
	public ArrayList<OilListAdmin> selectSearchStatisticsCustomerList(SqlSessionTemplate sqlSession,
			String selectStatus, String startMoney, String endMoney, String memberId, String today, String startDate,
			String endDate) throws CustomerSelectListException {

		ArrayList<OilListAdmin> list = null;
		
		Map<String, Object> hmap = new HashMap();

		hmap.put("selectStatus", selectStatus);
		hmap.put("memberId", memberId);
		hmap.put("startMoney", startMoney);
		hmap.put("endMoney", endMoney);
		hmap.put("today", today);
		hmap.put("startDate", startDate);
		hmap.put("endDate", endDate);
		
		list = (ArrayList)sqlSession.selectList("MemberAdmin2.selectSearchStatisticsCustomerList", hmap);
		
		System.out.println("DAO list : "+list);
		
		return list;
	}

}
