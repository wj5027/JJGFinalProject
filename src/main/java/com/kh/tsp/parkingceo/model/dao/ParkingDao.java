package com.kh.tsp.parkingceo.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.tsp.common.ParkingCeoPageInfo;
import com.kh.tsp.customer.model.vo.Member;
import com.kh.tsp.parkingceo.model.vo.ParkingCeoAttachmentVo;
import com.kh.tsp.parkingceo.model.vo.ParkingCeoParkingListVo;
import com.kh.tsp.parkingceo.model.vo.ParkingCeoVo;

public interface ParkingDao {

	int insertParkingCeo(SqlSessionTemplate sqlSession, Member m);

	int selectParkingListCount(SqlSessionTemplate sqlSession, Member m);

	int exchangeParkingListCount(SqlSessionTemplate sqlSession, Member m);

	int selectCouponListCount(SqlSessionTemplate sqlSession, Member m);

	int selectExchangeMoneyListCount(SqlSessionTemplate sqlSession, Member m);

	ArrayList<HashMap<String, Object>> selectParkingList(SqlSessionTemplate sqlSession, ParkingCeoPageInfo pi,
			Member m);

	ArrayList<HashMap<String, Object>> selectExchangeParkingList(SqlSessionTemplate sqlSession, ParkingCeoPageInfo pi,
			Member m);

	ArrayList<HashMap<String, Object>> selectCouponList(SqlSessionTemplate sqlSession, ParkingCeoPageInfo pi, Member m);

	ArrayList<HashMap<String, Object>> selectExchangeMoneyList(SqlSessionTemplate sqlSession, ParkingCeoPageInfo pi,
			Member m);

	int selectInputCarListCount(SqlSessionTemplate sqlSession, HashMap<String, Object> parkingSelectBox);

	int selectOutputCarListCount(SqlSessionTemplate sqlSession, HashMap<String, Object> parkingSelectBox);

	int selectInputOutputCarListCount(SqlSessionTemplate sqlSession, HashMap<String, Object> parkingSelectBox);

	ArrayList<HashMap<String, Object>> selectSearchParkingInputDetailList(SqlSessionTemplate sqlSession,
			ParkingCeoPageInfo pi, HashMap<String, Object> daoHmap);

	ArrayList<HashMap<String, Object>> selectSearchParkingOutputDetailList(SqlSessionTemplate sqlSession,
			ParkingCeoPageInfo pi, HashMap<String, Object> daoHmap);

	ArrayList<HashMap<String, Object>> selectSearchParkingInputOutputDetailList(SqlSessionTemplate sqlSession,
			ParkingCeoPageInfo pi, HashMap<String, Object> daoHmap);

	void insertParkingOne(SqlSessionTemplate sqlSession, ParkingCeoVo parking);

	String selectParkingNo(SqlSessionTemplate sqlSession);

	void insertPakringListOne(SqlSessionTemplate sqlSession, ParkingCeoVo parking);

	int selectParkingListNo(SqlSessionTemplate sqlSession);

	void insertAttachment(SqlSessionTemplate sqlSession, ParkingCeoAttachmentVo parkingCeoAttachmentVo);

	HashMap<String, Object> selectSearchParkingOne(SqlSessionTemplate sqlSession, ParkingCeoVo parking);






}
