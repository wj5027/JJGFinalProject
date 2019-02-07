package com.kh.tsp.customer.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.tsp.customer.model.vo.Member;
import com.kh.tsp.customer.model.vo.Parking;

public interface CustomerMainDao {

	Member selectCheckMember(SqlSessionTemplate sqlSession, Member m);

	ArrayList<Parking> selectnearParkings(SqlSessionTemplate sqlSession);

	HashMap<Integer, Parking> searchVoiceLocalParking(SqlSessionTemplate sqlSession, String keyword);

	HashMap<Integer, Parking> searchVoiceNearParking(SqlSessionTemplate sqlSession, double lat, double lon);

}
