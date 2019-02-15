package com.kh.tsp.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tsp.admin.model.dao.ParkingAdminDao;
import com.kh.tsp.admin.model.exception.ParkingException;
import com.kh.tsp.admin.model.vo.ParkingListAdmin;
import com.kh.tsp.common.PageInfo;

@Service
public class ParkingAdminServiceImpl implements ParkingAdminService{

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private ParkingAdminDao pd;

	// 주차장 전체 수
	@Override
	public int getParkingListCount() throws ParkingException {
		int listCount = pd.getListCount(sqlSession);
		return listCount;
	}

	// 주차장 전체 리스트
	@Override
	public ArrayList<ParkingListAdmin> selectParkingList(PageInfo pi) throws ParkingException {
		ArrayList<ParkingListAdmin> list = pd.selectParkingList(sqlSession,pi);
		return list;
	}

	// 리스트 상세보기 ajax
	@Override
	public ParkingListAdmin detailParkingLot(ParkingListAdmin pl) throws ParkingException {
		pl = pd.detailParkingLot(sqlSession, pl);
		return pl;
	}

	// 승인 버튼
	@Override
	public int updateParkingLot(ParkingListAdmin pl) throws ParkingException {
		int result = pd.updateParkingLot(sqlSession, pl);
		return result;
	}

	// 반송 버튼
	@Override
	public int updateReturnParkingLot(ParkingListAdmin pl) throws ParkingException {
		int result = pd.updateReturnParkingLot(sqlSession, pl);
		return result;
	}

	// 반송 사유 ajax
	@Override
	public ParkingListAdmin updateCancelReasonDetail(ParkingListAdmin pl) throws ParkingException {
		pl = pd.updateCancelReasonDetail(sqlSession, pl);
		return pl;
	}

	// 검색 수
	@Override
	public int getSearchListCount(String parkingListStatus, String memberId, String parkingAddress, String parkingListName, String today,
			String startDate, String endDate) throws ParkingException {
		int listCount = pd.getSearchListCount(sqlSession, parkingListStatus, memberId, parkingAddress, parkingListName, today, startDate, endDate);
		return listCount;
	}

	// 검색 결과
	@Override
	public ArrayList<ParkingListAdmin> selectSearchParkingLotList(PageInfo pi, String parkingListStatus, String memberId, String parkingAddress,
			String parkingListName, String today, String startDate, String endDate) throws ParkingException {
		ArrayList<ParkingListAdmin> list = pd.selectSearchParkingLotList(sqlSession, pi, parkingListStatus, memberId, parkingAddress, parkingListName, today, startDate, endDate);
		return list;
	}

/*	// 쿠폰 전체 수
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
	}*/

}
