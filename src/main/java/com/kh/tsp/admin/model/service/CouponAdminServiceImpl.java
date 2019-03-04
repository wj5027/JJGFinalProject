package com.kh.tsp.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tsp.admin.model.dao.CouponAdminDao;
import com.kh.tsp.admin.model.exception.CouponListException;
import com.kh.tsp.admin.model.vo.CouponRequestList;
import com.kh.tsp.common.PageInfo;

@Service
public class CouponAdminServiceImpl implements CouponAdminService{

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private CouponAdminDao cd;

	// 쿠폰 전체 수
	@Override
	public int getCouponListCount() throws CouponListException {
		int listCount = cd.getListCount(sqlSession);
		return listCount;
	}

	// 쿠폰 전체 리스트
	@Override
	public ArrayList<CouponRequestList> selectCouponList(PageInfo pi) throws CouponListException {
		ArrayList<CouponRequestList> list = cd.selectCouponList(sqlSession,pi);
		return list;
	}

	// 쿠폰 발급
	@Override
	public int updateCoupon(CouponRequestList crl) throws CouponListException {
		int result = cd.updateCoupon(sqlSession, crl);
		return result;
	}
	@Override
	public int insertCoupon(CouponRequestList crl) throws CouponListException {
		int result = cd.insertCoupon(sqlSession, crl);
		return result;
	}

	// 쿠폰 반송
	@Override
	public int deleteCoupon(CouponRequestList crl) throws CouponListException {
		int result = cd.deleteCoupon(sqlSession, crl);
		return result;
	}

	// 반송 사유 ajax
	@Override
	public CouponRequestList selectRefuseReason(CouponRequestList c) throws CouponListException {
		c = cd.selectRefuseReason(sqlSession, c);
		return c;
	}

	// 쿠폰 검색 수
	@Override
	public int getSearchListCount(String selectStatus, String selectCoupon, String memberId, String parkingName)
			throws CouponListException {
		int listCount = cd.getSearchListCount(sqlSession, selectStatus, selectCoupon, memberId, parkingName);
		return listCount;
	}

	// 쿠폰 검색 결과
	@Override
	public ArrayList<CouponRequestList> selectSearchCouponList(PageInfo pi, String selectStatus, String selectCoupon,
			String memberId, String parkingName) throws CouponListException {
		ArrayList<CouponRequestList> list = cd.selectSearchCouponList(sqlSession, pi, selectStatus, selectCoupon, memberId, parkingName);
		return list;
	}

}
