package com.kh.tsp.customer.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tsp.customer.model.dao.CustomerMainDao;
import com.kh.tsp.customer.model.vo.Member;
import com.kh.tsp.customer.model.vo.Parking;
import com.kh.tsp.customer.model.vo.Points;
import com.kh.tsp.customer.model.vo.Reservation;

@Service
public class CustomerMainServiceImpl implements CustomerMainService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private CustomerMainDao cmd;
	
	
	
	public CustomerMainServiceImpl() {
		// 기본 생성자
	}

	@Override
	public Member selectCheckMember(Member m) {
		
		return cmd.selectCheckMember(sqlSession,m);
	}

	@Override
	public ArrayList<Parking> getnearParkings(Points p) {
		return cmd.selectnearParkings(p,sqlSession);
	}

	@Override
	public HashMap<String, Parking> searchVoiceParking(String keyword, String type) {
		
		HashMap<String, Parking> hmap;
		
		if (type.equals("지역")) {
			hmap = cmd.searchVoiceLocalParking(sqlSession, keyword);
		} else if (type.equals("근처 주차장")) {
			//37.4996559/127.0330656
			String[] temp = keyword.split("/");
			double lat = Double.parseDouble(temp[0]);
			double lon = Double.parseDouble(temp[1]);
			
			hmap = cmd.searchVoiceNearParking(sqlSession, lat, lon);
		} else {
			hmap = null;
		}
		
		return hmap;
	}

	@Override
	public HashMap<String, Parking> selectSearchTextParking(String keyword) {
		return cmd.selectSearchTextParking(sqlSession, keyword);
	}

	@Override
	public ArrayList<Reservation> selectShowReserv(Member member) {
		return cmd.selectShowReserv(sqlSession, member);
	}

	public Member selectCheckKakao(String kakao_id) {

		return cmd.selectCheckKakao(sqlSession, kakao_id);
	}
	//카카오톡 회원가입
	@Override
	public int insertKakao(Member m) {

		return cmd.insertKakao(sqlSession, m);
	}
	//아이디 중복확인
	@Override
	public Member idCheck(String member_id) {

		return cmd.idCheck(sqlSession, member_id);
	}
	//일반 회원가입
	@Override
	public int insertMember(Member m) {

		return cmd.insertMember(sqlSession, m);
	}

	

	
}
