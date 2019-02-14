package com.kh.tsp.parkingceo.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.tsp.common.ParkingCeoPageInfo;
import com.kh.tsp.customer.model.vo.Member;

@Repository
public class ParkingDaoImpl implements ParkingDao{

	public ParkingDaoImpl() {
		// TODO Auto-generated constructor stub
	}

	//사업자 회원가입
	@Override
	public int insertParkingCeo(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("ParkingCeo.insertParkingCeo",m);
	}

	//쪽지함 리스트 카운트 메소드

	@Override
	public int selectParkingListCount(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("Note.selectParkingListCount", m);
	}
	
	@Override
	public int exchangeParkingListCount(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("Note.exchangeParkingListCount", m);
	}

	@Override
	public int selectCouponListCount(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("Note.selectCouponListCount", m);
	}

	@Override
	public int selectExchangeMoneyListCount(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("Note.selectExchangeMoneyListCount", m);
	}

	//주차장 등록 현황 리스트 조회
	@Override
	public ArrayList<HashMap<String, Object>> selectParkingList(SqlSessionTemplate sqlSession, ParkingCeoPageInfo pi,
			Member m) {
		ArrayList<HashMap<String, Object>> list = null;
		int offset = (pi.getCurrentPage()-1)*pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("Note.selectParkingList", m, rowBounds);
		return list;
	}

	//주차장 정보 신청 현황 리스트 조회
	@Override
	public ArrayList<HashMap<String, Object>> selectExchangeParkingList(SqlSessionTemplate sqlSession,
			ParkingCeoPageInfo pi, Member m) {
		ArrayList<HashMap<String, Object>> list = null;
		int offset = (pi.getCurrentPage()-1)*pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("Note.selectExchangeParkingList", m, rowBounds);
		return list;
	}

	//쿠폰 신청 현황 리스트 조회
	@Override
	public ArrayList<HashMap<String, Object>> selectCouponList(SqlSessionTemplate sqlSession, ParkingCeoPageInfo pi,
			Member m) {
		ArrayList<HashMap<String, Object>> list = null;
		int offset = (pi.getCurrentPage()-1)*pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("Note.selectCouponList", m, rowBounds);
		return list;
	}

	//환전 신청 현황 리스트 조회
	@Override
	public ArrayList<HashMap<String, Object>> selectExchangeMoneyList(SqlSessionTemplate sqlSession,
			ParkingCeoPageInfo pi, Member m) {
		ArrayList<HashMap<String, Object>> list = null;
		int offset = (pi.getCurrentPage()-1)*pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("Note.selectExchangeMoneyList", m, rowBounds);
		return list;
	}

	
	//주차장 내역 리스트 카운트
	@Override
	public int selectInputCarListCount(SqlSessionTemplate sqlSession ,HashMap<String, Object> parkingSelectBox) {
		return sqlSession.selectOne("ParkingDetail.inputCarListCount",parkingSelectBox);
	}

	@Override
	public int selectOutputCarListCount(SqlSessionTemplate sqlSession, HashMap<String, Object> parkingSelectBox) {
		return sqlSession.selectOne("ParkingDetail.outputCarListCount",parkingSelectBox);
	}

	@Override
	public int selectInputOutputCarListCount(SqlSessionTemplate sqlSession, HashMap<String, Object> parkingSelectBox) {
		return sqlSession.selectOne("ParkingDetail.inputOutputCarListCount",parkingSelectBox);
	}

	@Override
	public ArrayList<HashMap<String, Object>> selectSearchParkingInputDetailList(SqlSessionTemplate sqlSession,
			ParkingCeoPageInfo pi,HashMap<String, Object> daoHmap) {
		int offset = (pi.getCurrentPage()-1)*pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		return (ArrayList)sqlSession.selectList("ParkingDetail.inputCarList", daoHmap, rowBounds);
	}

	@Override
	public ArrayList<HashMap<String, Object>> selectSearchParkingOutputDetailList(SqlSessionTemplate sqlSession,
			ParkingCeoPageInfo pi,HashMap<String, Object> daoHmap) {
		int offset = (pi.getCurrentPage()-1)*pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		return (ArrayList)sqlSession.selectList("ParkingDetail.outputCarList", daoHmap, rowBounds);
	}

	@Override
	public ArrayList<HashMap<String, Object>> selectSearchParkingInputOutputDetailList(SqlSessionTemplate sqlSession,
			ParkingCeoPageInfo pi,HashMap<String, Object> daoHmap) {
		int offset = (pi.getCurrentPage()-1)*pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		return (ArrayList)sqlSession.selectList("ParkingDetail.inputOutputCarList", daoHmap, rowBounds);
	}




}
