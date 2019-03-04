package com.kh.tsp.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.tsp.admin.model.exception.CouponListException;
import com.kh.tsp.admin.model.vo.CouponRequestList;
import com.kh.tsp.common.PageInfo;
import com.kh.tsp.customer.model.vo.Board;

@Repository
public class CouponAdminDaoImpl  implements CouponAdminDao{

	// 쿠폰 전체 수
	@Override
	public int getListCount(SqlSessionTemplate sqlSession) throws CouponListException {
		int listCount = sqlSession.selectOne("CouponAdmin.getListCount");
		
		if(listCount <=0) {
			throw new CouponListException("쿠폰 수 조회 실패!");
		}
		return listCount;
	}

	// 쿠폰 전체 리스트
	@Override
	public ArrayList<CouponRequestList> selectCouponList(SqlSessionTemplate sqlSession, PageInfo pi)
			throws CouponListException {
		ArrayList<CouponRequestList> list = null;
		int offset = (pi.getCurrentPage()-1)* pi.getLimit();	
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("CouponAdmin.selectCouponList", null, rowBounds);
		
		if(list == null) {
			throw new CouponListException("쿠폰 전체 리스트 조회 실패");
		}
		return list;
	}

	// 쿠폰 발급
	@Override
	public int updateCoupon(SqlSessionTemplate sqlSession, CouponRequestList crl) throws CouponListException {

		int reqNo = crl.getReqNo();
		System.out.println("reqNo : "+reqNo);
		
		int result = sqlSession.update("CouponAdmin.updateCoupon", reqNo);
		
		if(result<=0) {
			throw new CouponListException("쿠폰 발급 실패!");
		}
		return result;
	}
	@Override
	public int insertCoupon(SqlSessionTemplate sqlSession, CouponRequestList crl) throws CouponListException {

		int reqNo = crl.getReqNo();
		System.out.println("reqNo : "+reqNo);
		
		int result = sqlSession.update("CouponAdmin.insertCoupon", reqNo);
		
		if(result<=0) {
			throw new CouponListException("쿠폰 발급 실패!");
		}
		return result;
	}

	// 쿠폰 반송
	@Override
	public int deleteCoupon(SqlSessionTemplate sqlSession, CouponRequestList crl) throws CouponListException {

		int result = sqlSession.update("CouponAdmin.deleteCoupon", crl);
		System.out.println("result(DAO 발급) : "+result);
		
		if(result<=0) {
			throw new CouponListException("쿠폰 반송 실패!");
		}
		return result;
	}

	// 반송 사유 ajax
 	@Override
	public CouponRequestList selectRefuseReason(SqlSessionTemplate sqlSession, CouponRequestList c)
			throws CouponListException {

 		int reqNo = c.getReqNo();
		System.out.println("reqNo : "+reqNo);
		
		c = sqlSession.selectOne("CouponAdmin.selectRefuseReason", reqNo);
		System.out.println("result(DAO 반송 사유 ajax) : "+c);
		
		if(c==null) {
			throw new CouponListException("반송 사유 ajax 불러오가 실패!");
		}
		return c;
	}

 	// 쿠폰 검색 수
	@Override
	public int getSearchListCount(SqlSessionTemplate sqlSession, String selectStatus, String selectCoupon,
			String memberId, String parkingName) throws CouponListException {

		Map<String, Object> hmap = new HashMap<String, Object>();

		hmap.put("selectStatus", selectStatus);
		hmap.put("selectCoupon", selectCoupon);
		hmap.put("memberId", memberId);
		hmap.put("parkingName", parkingName);
		
		int listCount = sqlSession.selectOne("CouponAdmin.getSearchListCount", hmap);
		System.out.println("listCount DAO : "+listCount);
		return listCount;
	}

 	// 쿠폰 검색 결과
	@Override
	public ArrayList<CouponRequestList> selectSearchCouponList(SqlSessionTemplate sqlSession, PageInfo pi,
			String selectStatus, String selectCoupon, String memberId, String parkingName) throws CouponListException {
		
		ArrayList<CouponRequestList> list = null;
		
		int offset = (pi.getCurrentPage()-1)* pi.getLimit();			
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());

		System.out.println("selectStatus DAO: "+selectStatus);
		System.out.println("selectCoupon DAO: "+selectCoupon);
		System.out.println("memberId DAO: "+memberId);
		System.out.println("parkingName DAO: "+parkingName);
		
		Map<String, Object> hmap = new HashMap();

		hmap.put("selectStatus", selectStatus);
		hmap.put("selectCoupon", selectCoupon);
		hmap.put("memberId", memberId);
		hmap.put("parkingName", parkingName);
		
		list = (ArrayList)sqlSession.selectList("CouponAdmin.selectSearchCouponList", hmap, rowBounds);
		
		System.out.println("DAO list : "+list);

		return list;
	}


}
