package com.kh.tsp.customer.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.tsp.customer.model.vo.Member;
import com.kh.tsp.customer.model.vo.Parking;
import com.kh.tsp.customer.model.vo.Points;
import com.kh.tsp.customer.model.vo.Reservation;

public interface CustomerMainDao {

	Member selectCheckMember(SqlSessionTemplate sqlSession, Member m);

	ArrayList<Parking> selectnearParkings(Points p, SqlSessionTemplate sqlSession);

	HashMap<String, Parking> searchVoiceLocalParking(SqlSessionTemplate sqlSession, String keyword);

	HashMap<String, Parking> searchVoiceNearParking(SqlSessionTemplate sqlSession, double lat, double lon);

	HashMap<String, Parking> selectSearchTextParking(SqlSessionTemplate sqlSession, String keyword);


	ArrayList<Reservation> selectShowReserv(SqlSessionTemplate sqlSession, Member member);

	Member selectCheckKakao(SqlSessionTemplate sqlSession, String kakao_id);

	int insertKakao(SqlSessionTemplate sqlSession, Member m);

}
