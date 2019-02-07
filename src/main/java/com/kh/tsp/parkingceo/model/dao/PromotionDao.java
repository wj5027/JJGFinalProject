package com.kh.tsp.parkingceo.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.tsp.customer.model.vo.Member;

public interface PromotionDao {

	ArrayList<HashMap<String, Object>> selectCurrentParkingList(SqlSessionTemplate sqlSession, Member m);

}
