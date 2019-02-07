package com.kh.tsp.parkingceo.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tsp.customer.model.vo.Member;
import com.kh.tsp.parkingceo.model.dao.PromotionDao;
import com.kh.tsp.parkingceo.model.vo.PromotionVo;



@Service
public class PromotionServiceImpl implements PromotionService {
	
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private PromotionDao pd;

	public PromotionServiceImpl() {
		//기본 생성자
	}

	@Override
	public ArrayList<HashMap<String, Object>> selectCurrentParkingList(Member m) {
		return pd.selectCurrentParkingList(sqlSession,m);
	}

	@Override
	public void insertPromotion(PromotionVo pv) {
		pd.insertPromotion(sqlSession,pv);
	}



}
