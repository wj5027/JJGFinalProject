package com.kh.tsp.admin.model.dao;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.tsp.admin.model.exception.MainStatisticsException;
import com.kh.tsp.admin.model.exception.ParkingCEOSelectListException;
import com.kh.tsp.admin.model.exception.ParkingCEOSelectListException;
import com.kh.tsp.admin.model.vo.DateAdmin;
import com.kh.tsp.admin.model.vo.MemberAdmin;
import com.kh.tsp.admin.model.vo.OilListAdmin;
import com.kh.tsp.common.PageInfo;

@Repository
public class MainDaoImpl  implements MainDao{

	// 올해 사용자 회원가입 수
	@Override
	public DateAdmin selectCustomerSignUpMonth(SqlSessionTemplate sqlSession) throws MainStatisticsException {
		
		DateAdmin da = sqlSession.selectOne("MainAdmin.selectCustomerSignUpMonth");
		
		if(da == null) {
			throw new MainStatisticsException("올해 사용자 회원가입 수 조회 실패");
		}
		return da;
	}

	// 최근 7일 사용자 회원가입 수
	@Override
	public DateAdmin selectCustomerSignUp7Days(SqlSessionTemplate sqlSession) throws MainStatisticsException {
		
		DateAdmin da = sqlSession.selectOne("MainAdmin.selectCustomerSignUp7Days");
		
		if(da == null) {
			throw new MainStatisticsException("최근 7알 사용자 회원가입 수 조회 실패");
		}
		return da;
	}

	// 올해 사용자 회원가입 수
	@Override
	public DateAdmin selectCEOSignUpMonth(SqlSessionTemplate sqlSession) throws MainStatisticsException {
		
		DateAdmin da = sqlSession.selectOne("MainAdmin.selectCEOSignUpMonth");
		
		if(da == null) {
			throw new MainStatisticsException("올해 사업자 회원가입 수 조회 실패");
		}
		return da;
	}

	// 최근 7일 사용자 회원가입 수
	@Override
	public DateAdmin selectCEOSignUp7Days(SqlSessionTemplate sqlSession) throws MainStatisticsException {
		
		DateAdmin da = sqlSession.selectOne("MainAdmin.selectCEOSignUp7Days");
		
		if(da == null) {
			throw new MainStatisticsException("최근 7알 사업자 회원가입 수 조회 실패");
		}
		return da;
	}


/*	// 통계 그래프 (월별)
	@Override
	public DateAdmin selectStatisticsMonth(SqlSessionTemplate sqlSession) throws ParkingCEOSelectListException {
		
		DateAdmin da = sqlSession.selectOne("MemberAdmin.selectStatisticsMonth");
		
		if(da == null) {
			throw new ParkingCEOSelectListException("통계 그래프 (월별) 조회 실패");
		}
		return da;
	}

	// 통계 리스트 (최근 7일)
	@Override
	public DateAdmin selectStatistics7Day(SqlSessionTemplate sqlSession) throws ParkingCEOSelectListException {
		
		DateAdmin da = sqlSession.selectOne("MemberAdmin.selectStatistics7Day");
		
		if(da == null) {
			throw new ParkingCEOSelectListException("통계 리스트 (최근 7일) 조회 실패");
		}
		return da;
	}

	// 통계 리스트 (최근 24시간)
	@Override
	public DateAdmin selectStatisticsToday(SqlSessionTemplate sqlSession) throws ParkingCEOSelectListException {
		
		DateAdmin da = sqlSession.selectOne("MemberAdmin.selectStatisticsToday");
		
		if(da == null) {
			throw new ParkingCEOSelectListException("통계 리스트 (최근 24시간) 조회 실패");
		}
		return da;
	}*/

}
