package com.kh.tsp.parkingceo.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.tsp.customer.model.vo.Member;
import com.kh.tsp.parkingceo.model.vo.PromotionVo;

@Repository
public class PromotionDaoImpl implements PromotionDao {

	public PromotionDaoImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public ArrayList<HashMap<String, Object>> selectCurrentParkingList(SqlSessionTemplate sqlSession, Member m) {
		return (ArrayList)sqlSession.selectList("ParkingCeoPromotion.selectCurrentParkingList", m);
	}

	@Override
	public void insertPromotion(SqlSessionTemplate sqlSession, PromotionVo pv) {
		System.out.println("여기까진 오니?");
		System.out.println(pv);
		sqlSession.insert("ParkingCeoPromotion.insertPromotion", pv);
	}

}
