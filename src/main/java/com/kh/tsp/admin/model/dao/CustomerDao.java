package com.kh.tsp.admin.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.tsp.admin.model.exception.CustomerSelectListException;
import com.kh.tsp.admin.model.vo.MemberAdmin;
import com.kh.tsp.common.PageInfo;

public interface CustomerDao {

	// 사용자 수
	int getListCount(SqlSessionTemplate sqlSession) throws CustomerSelectListException;

	// 사용자 리스트
	ArrayList<MemberAdmin> selectCustomerList(SqlSessionTemplate sqlSession, PageInfo pi) throws CustomerSelectListException;

	// 회원 탈퇴
	int deleteCustomer(SqlSessionTemplate sqlSession, MemberAdmin md) throws CustomerSelectListException;

	// 회원 복구
	int updateRecoverCustomer(SqlSessionTemplate sqlSession, MemberAdmin md) throws CustomerSelectListException;

	// 사용자 검색 수
	int getSearchListCount(SqlSessionTemplate sqlSession, String selectStatus, String memberId, String today,
			String startDate, String endDate) throws CustomerSelectListException;

	// 사용자 검색 결과
	ArrayList<MemberAdmin> selectSearchCustomerList(SqlSessionTemplate sqlSession, PageInfo pi, String selectStatus,
			String memberId, String today, String startDate, String endDate) throws CustomerSelectListException;

}
