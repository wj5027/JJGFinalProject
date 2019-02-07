package com.kh.tsp.customer.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.tsp.customer.model.vo.Member;
import com.kh.tsp.customer.model.vo.Parking;

@Repository
public class CustomerMainDaoImpl implements CustomerMainDao {

	public CustomerMainDaoImpl() {
		// 기본 생성자
	}

	@Override
	public Member selectCheckMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("Member.selectCheckMember",m);
	}

	@Override
	public ArrayList<Parking> selectnearParkings(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("Member.selectnearParkings");
	}

	@Override
	public HashMap<Integer, Parking> searchVoiceLocalParking(SqlSessionTemplate sqlSession, String keyword) {
		HashMap<Integer, Parking> hmap = new HashMap<>();
		
		ArrayList<Parking> list = (ArrayList)sqlSession.selectList("Member.searchLocalParkings", keyword);
		
		for (int i = 0; i < list.size(); i++) {
			hmap.put(i + 1, list.get(i));
		}
		
		return hmap;
	}

	@Override
	public HashMap<Integer, Parking> searchVoiceNearParking(SqlSessionTemplate sqlSession, double lat, double lon) {
		HashMap<Integer, Parking> hmap = new HashMap<>();
		
		ArrayList<Parking> list = (ArrayList)sqlSession.selectList("Member.searchLocalParkings", lat);
		
		for (int i = 0; i < list.size(); i++) {
			hmap.put(i + 1, list.get(i));
		}
		
		return hmap;
	}

}
