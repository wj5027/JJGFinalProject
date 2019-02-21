package com.kh.tsp.parkingceo.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.tsp.common.ParkingCeoPageInfo;

@Repository
public class ParkingMainDaoImpl implements ParkingMainDao {

	public ParkingMainDaoImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public int selectListCountInsertParkingSystemList(SqlSessionTemplate sqlSession,
			HashMap<String, Object> selectHmap) {
		return sqlSession.selectOne("ParkingMain.selectListCountInsertParkingSystemList", selectHmap);
	}

	@Override
	public ArrayList<HashMap<String, Object>> selectSearchInsertParkingSystemList(SqlSessionTemplate sqlSession,
			HashMap<String, Object> selectHmap, ParkingCeoPageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getLimit();
		RowBounds rowbounds = new RowBounds(offset, pi.getLimit());
		return (ArrayList)sqlSession.selectList("ParkingMain.selectSearchInsertParkingSystemList", selectHmap, rowbounds);
	}

	@Override
	public int selectListCountResParkingList(SqlSessionTemplate sqlSession, HashMap<String, Object> selectParkingBox) {
		return sqlSession.selectOne("ParkingMain.selectListCountResParkingList", selectParkingBox);
	}

	@Override
	public ArrayList<HashMap<String, Object>> selectSearchResParkingList(SqlSessionTemplate sqlSession,
			HashMap<String, Object> selectParkingBox, ParkingCeoPageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getLimit();
		RowBounds rowbounds = new RowBounds(offset, pi.getLimit());
		return (ArrayList)sqlSession.selectList("ParkingMain.selectSearchResParkingList", selectParkingBox, rowbounds);
	}

	@Override
	public void updateResComplete(SqlSessionTemplate sqlSession, int completeResNo) {
		sqlSession.update("ParkingMain.updateResComplete", completeResNo);
	}

	@Override
	public void updateResCancel(SqlSessionTemplate sqlSession, int completeResNo) {
		sqlSession.update("ParkingMain.updateResCancel1", completeResNo);
	}

	@Override
	public void updateResCancel(SqlSessionTemplate sqlSession, int completeResNo, String resCancelText) {
		HashMap<String, Object> hmap = new HashMap<String,Object>();
		hmap.put("completeResNo", completeResNo);
		hmap.put("resCancelText", resCancelText);
		sqlSession.update("ParkingMain.updateResCancel2", hmap);
	}





}
