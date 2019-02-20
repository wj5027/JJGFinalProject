package com.kh.tsp.parkingceo.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.tsp.common.ParkingCeoPageInfo;

@Repository
public class ParkingReservationDaoImpl implements ParkingReservationDao{

	public ParkingReservationDaoImpl() {
		// TODO Auto-generated constructor stub
	}

	
	//예약 내역 리스트 카운트 조회
	@Override
	public int selectResAllListCount(SqlSessionTemplate sqlSession, HashMap<String, Object> selectHmap) {
		return sqlSession.selectOne("ParkingCeoReservation.selectResAllListCount", selectHmap);
	}

	@Override
	public int selectResOkListCount(SqlSessionTemplate sqlSession, HashMap<String, Object> selectHmap) {
		return sqlSession.selectOne("ParkingCeoReservation.selectResOkListCount", selectHmap);
	}

	@Override
	public int selectResReadyListCount(SqlSessionTemplate sqlSession, HashMap<String, Object> selectHmap) {
		return sqlSession.selectOne("ParkingCeoReservation.selectResReadyListCount", selectHmap);
	}

	@Override
	public int selectResCancelListCount(SqlSessionTemplate sqlSession, HashMap<String, Object> selectHmap) {
		return sqlSession.selectOne("ParkingCeoReservation.selectResCancelListCount", selectHmap);
	}

	@Override
	public int selectResCompleteListCount(SqlSessionTemplate sqlSession, HashMap<String, Object> selectHmap) {
		return sqlSession.selectOne("ParkingCeoReservation.selectResCompleteListCount", selectHmap);
	}

	@Override
	public int selectResSelfCancelListCount(SqlSessionTemplate sqlSession, HashMap<String, Object> selectHmap) {
		return sqlSession.selectOne("ParkingCeoReservation.selectResSelfCancelListCount", selectHmap);
	}


	@Override
	public ArrayList<HashMap<String, Object>> selectResAllList(SqlSessionTemplate sqlSession,
			HashMap<String, Object> selectHmap, ParkingCeoPageInfo pi) {
		ArrayList<HashMap<String, Object>> list = null;
		int offset = (pi.getCurrentPage()-1)*pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("ParkingCeoReservation.selectResAllList", selectHmap, rowBounds);
		return list;
	}


	@Override
	public ArrayList<HashMap<String, Object>> selectResOkList(SqlSessionTemplate sqlSession,
			HashMap<String, Object> selectHmap, ParkingCeoPageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		return (ArrayList)sqlSession.selectList("ParkingCeoReservation.selectResOkList", selectHmap, rowBounds);
	}


	@Override
	public ArrayList<HashMap<String, Object>> selectResReadyList(SqlSessionTemplate sqlSession,
			HashMap<String, Object> selectHmap, ParkingCeoPageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		return (ArrayList)sqlSession.selectList("ParkingCeoReservation.selectResReadyList", selectHmap, rowBounds);
	}


	@Override
	public ArrayList<HashMap<String, Object>> selectResCancelList(SqlSessionTemplate sqlSession,
			HashMap<String, Object> selectHmap, ParkingCeoPageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		return (ArrayList)sqlSession.selectList("ParkingCeoReservation.selectResCancelList", selectHmap, rowBounds);
	}


	@Override
	public ArrayList<HashMap<String, Object>> selectResCompleteList(SqlSessionTemplate sqlSession,
			HashMap<String, Object> selectHmap, ParkingCeoPageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		return (ArrayList)sqlSession.selectList("ParkingCeoReservation.selectResCompleteList", selectHmap, rowBounds);
	}


	@Override
	public ArrayList<HashMap<String, Object>> selectResSelfCancelList(SqlSessionTemplate sqlSession,
			HashMap<String, Object> selectHmap, ParkingCeoPageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		return (ArrayList)sqlSession.selectList("ParkingCeoReservation.selectResSelfCancelList", selectHmap, rowBounds);
	}

}
