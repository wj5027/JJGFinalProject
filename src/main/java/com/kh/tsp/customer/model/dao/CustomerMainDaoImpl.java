package com.kh.tsp.customer.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.tsp.customer.model.vo.Member;
import com.kh.tsp.customer.model.vo.Parking;
import com.kh.tsp.customer.model.vo.Reservation;;

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
	public HashMap<String, Parking> searchVoiceLocalParking(SqlSessionTemplate sqlSession, String keyword) {
		HashMap<String, Parking> hmap = new HashMap<String, Parking>();
		System.out.println(keyword);
		ArrayList<Parking> list = (ArrayList)sqlSession.selectList("Member.selectSearchTitleParking", keyword);// 1. 이름 기준 검색
		
		for (int i = 0; i < list.size(); i++) {
			hmap.put("" + (i + 100001), list.get(i));
		}
		
		list = (ArrayList)sqlSession.selectList("Member.searchAddrParking", keyword); // 2. 주소 기준 검색
		
		for (int i = 0; i < list.size(); i++) {
			hmap.put("" + (i + 200001), list.get(i));
		}
		
		System.out.println(hmap);
		
		return hmap;
	}

	@Override
	public HashMap<String, Parking> searchVoiceNearParking(SqlSessionTemplate sqlSession, double lat, double lon) {
		HashMap<String, Parking> hmap = new HashMap<String, Parking>();
		
		ArrayList<Parking> list = (ArrayList)sqlSession.selectList("Member.searchLocalParkings", lat);
		
		for (int i = 0; i < list.size(); i++) {
			hmap.put("" + (i + 1), list.get(i));
		}
		
		return hmap;
	}

	@Override
	public HashMap<String, Parking> selectSearchTextParking(SqlSessionTemplate sqlSession, String keyword) {
		HashMap<String, Parking> hmap = new HashMap<String, Parking>();
		System.out.println(keyword);
		ArrayList<Parking> list = (ArrayList)sqlSession.selectList("Member.selectSearchTitleParking", keyword);// 1. 이름 기준 검색
		
		for (int i = 0; i < list.size(); i++) {
			hmap.put("" + (i + 100001), list.get(i));
		}
		
		list = (ArrayList)sqlSession.selectList("Member.searchAddrParking", keyword); // 2. 주소 기준 검색
		
		for (int i = 0; i < list.size(); i++) {
			hmap.put("" + (i + 200001), list.get(i));
		}
		
		System.out.println(hmap);
		
		return hmap;
	}

	@Override
	public ArrayList<Reservation> selectShowReserv(SqlSessionTemplate sqlSession, Member member) {
		return (ArrayList)sqlSession.selectList("Member.selectReserve", member);
	}

    
	public Member selectCheckKakao(SqlSessionTemplate sqlSession, String kakao_id) {

		return sqlSession.selectOne("Member.selectCheckKakao", kakao_id);
	}
	//카카오톡 회원가입
	@Override
	public int insertKakao(SqlSessionTemplate sqlSession, Member m) {

		return sqlSession.insert("Member.insertKakao",m);

	}
	//아이디 중복확인
	@Override
	public Member idCheck(SqlSessionTemplate sqlSession, String member_id) {

		return sqlSession.selectOne("Member.idCheck", member_id);
	}
	//일반 회원가입
	@Override
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {

		return sqlSession.insert("Member.insertMember", m);
	}

}
