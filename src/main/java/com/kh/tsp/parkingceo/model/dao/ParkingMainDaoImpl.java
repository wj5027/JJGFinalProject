package com.kh.tsp.parkingceo.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.tsp.common.ParkingCeoPageInfo;
import com.kh.tsp.customer.model.vo.Member;

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

	@Override
	public HashMap<String, Object> searchPakringSize(SqlSessionTemplate sqlSession,
			HashMap<String, Object> searchHmap) {
		return sqlSession.selectOne("ParkingMain.searchNonMemberPakringSize", searchHmap);
	}

	@Override
	public void insertNonMemberEntryList(SqlSessionTemplate sqlSession, HashMap<String, Object> searchHashmap) {
		sqlSession.insert("ParkingMain.insertNonMemberEntryList", searchHashmap);
	}

	/////////////////////////////////////////////////////////////////////////
	@Override
	public void insertNomalMemberEntryList(SqlSessionTemplate sqlSession, HashMap<String, Object> searchHashmap) {
		sqlSession.insert("ParkingMain.insertNomalMemberEntryList", searchHashmap);
		
	}

	@Override
	public void insertResMemberEntryList(SqlSessionTemplate sqlSession, HashMap<String, Object> searchHashmap) {
		sqlSession.insert("ParkingMain.insertResMemberEntryList", searchHashmap);
	}

	@Override
	public void updateLeftSize(SqlSessionTemplate sqlSession, HashMap<String, Object> searchHashmap) {
		sqlSession.update("ParkingMain.updateLeftSize1",searchHashmap);
	}

	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	@Override
	public void updateNonMemberTimes(SqlSessionTemplate sqlSession,HashMap<String, Object> searchData) {
		sqlSession.update("ParkingMain.updateNonMemberTimes",searchData);
	}

	@Override
	public HashMap<String, Object> selectNonMemberUseTime(SqlSessionTemplate sqlSession,HashMap<String, Object> searchData) {
		return sqlSession.selectOne("ParkingMain.selectNonMemberUseTime",searchData);
	}

	@Override
	public HashMap<String, Integer> selectNonMemberParkingUseTimeAndPrice(SqlSessionTemplate sqlSession,
			String selectParkingBox) {
		HashMap<String, Object> hmap = new HashMap<String,Object>();
		hmap.put("parking_no", selectParkingBox);
		return sqlSession.selectOne("ParkingMain.selectNonMemberParkingUseTimeAndPrice", hmap);
	}

	@Override
	public void updateNonMemberResultData(SqlSessionTemplate sqlSession, HashMap<String, Object> addResultData) {
		sqlSession.update("ParkingMain.updateNonMemberResultData", addResultData);
	}

	@Override
	public HashMap<String, Object> selectNonMemberResultData(SqlSessionTemplate sqlSession,
			HashMap<String, Object> searchData) {
		return sqlSession.selectOne("ParkingMain.selectNonMemberResultData", searchData);
	}

	@Override
	public void plusNonMemberParkingLeftSize(SqlSessionTemplate sqlSession, HashMap<String, Object> searchData) {
		sqlSession.update("ParkingMain.plusNonMemberParkingLeftSize", searchData);
	}

	@Override
	public Member selectNomalMemberInformation(SqlSessionTemplate sqlSession, HashMap<String, Object> selectHmap) {
		return sqlSession.selectOne("ParkingMain.selectNomalMemberInformation", selectHmap);
	}

	@Override
	public HashMap<String, Object> selectNomalMemberMemberNo(SqlSessionTemplate sqlSession,
			HashMap<String, Object> member_idHmap) {
		return sqlSession.selectOne("ParkingMain.selectNomalMemberMemberNo", member_idHmap);
	}

	@Override
	public HashMap<String, Object> selectNomalMemberUseTiems(SqlSessionTemplate sqlSession,
			HashMap<String, Object> selectHmap) {
		return sqlSession.selectOne("ParkingMain.selectNomalMemberUseTiems", selectHmap);
	}

	@Override
	public void updateNomalMemberCurrentPayment(SqlSessionTemplate sqlSession, HashMap<String, Object> data) {
		sqlSession.update("ParkingMain.updateNomalMemberCurrentPayment", data);
	}

	@Override
	public HashMap<String, Object> selectSearchNomalMemberPoint(SqlSessionTemplate sqlSession,
			HashMap<String, Object> selectHmap) {
		return sqlSession.selectOne("ParkingMain.selectSearchNomalMemberPoint", selectHmap);
	}

	@Override
	public void updateNomalMemberPointPayment(SqlSessionTemplate sqlSession, HashMap<String, Object> data) {
		sqlSession.update("ParkingMain.updateNomalMemberPointPayment", data);
	}

	@Override
	public void updateNomalMemberOil(SqlSessionTemplate sqlSession, HashMap<String, Object> data) {
		sqlSession.update("ParkingMain.updateNomalMemberOil", data);
	}

	@Override
	public HashMap<String, Object> searchResInformation(SqlSessionTemplate sqlSession,
			HashMap<String, Object> selectHmap) {
		return sqlSession.selectOne("ParkingMain.searchResInformation", selectHmap);
	}

	@Override
	public HashMap<String, Object> searchOutResInformation(SqlSessionTemplate sqlSession,
			HashMap<String, Object> selectHmap) {
		return sqlSession.selectOne("ParkingMain.searchOutResInformation", selectHmap);
	}

	@Override
	public void updateResMemberCurrentPayment(SqlSessionTemplate sqlSession, HashMap<String, Object> data) {
		sqlSession.update("ParkingMain.updateResMemberCurrentPayment", data);
	}

	@Override
	public void updateResMemberEntryList(SqlSessionTemplate sqlSession, HashMap<String, Object> data) {
		sqlSession.update("ParkingMain.updateResMemberEntryList", data);
	}

	@Override
	public void updateResMemberOil(SqlSessionTemplate sqlSession, HashMap<String, Object> data) {
		sqlSession.update("ParkingMain.updateResMemberOil", data);
	}

	@Override
	public void updateResMemberParkingLeftSize(SqlSessionTemplate sqlSession, HashMap<String, Object> data) {
		sqlSession.update("ParkingMain.updateResMemberParkingLeftSize", data);
	}

	@Override
	public void AddNomalPointToPakringCeo(SqlSessionTemplate sqlSession, HashMap<String, Object> data) {
		sqlSession.update("ParkingMain.AddNomalPointToPakringCeo", data);
	}

	@Override
	public Member selectCheckMember(SqlSessionTemplate sqlSession, HashMap<String, Object> data) {
		return sqlSession.selectOne("ParkingMain.selectCheckMember2", data);
	}

	@Override
	public void updateCompleteResOil(SqlSessionTemplate sqlSession, HashMap<String, Object> data) {
		sqlSession.update("ParkingMain.updateCompleteResOil",data);
	}

	@Override
	public void updateCancelResPoint(SqlSessionTemplate sqlSession, HashMap<String, Object> data) {
		sqlSession.update("ParkingMain.updateCancelResPoint", data);
	}








}
