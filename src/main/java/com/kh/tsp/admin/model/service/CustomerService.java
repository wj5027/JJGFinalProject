package com.kh.tsp.admin.model.service;

import java.util.ArrayList;

import com.kh.tsp.admin.model.exception.CustomerSelectListException;
import com.kh.tsp.admin.model.vo.MemberAdmin;
import com.kh.tsp.common.PageInfo;

public interface CustomerService {

	// 사업자 수
	int getListCount() throws CustomerSelectListException;

	// 사업자 리스트
	ArrayList<MemberAdmin> selectCustomerList(PageInfo pi) throws CustomerSelectListException;

	// 회원 탈퇴
	int deleteCustomer(MemberAdmin md) throws CustomerSelectListException;

	// 회원 복구
	int updateRecoverCustomer(MemberAdmin md) throws CustomerSelectListException;
	
	// 사업자 검색 수
	int getSearchListCount(String selectStatus, String memberId, String today, String startDate, String endDate) throws CustomerSelectListException;

	// 사업자 검색결과
	ArrayList<MemberAdmin> selectSearchCustomerList(PageInfo pi, String selectStatus, String memberId, String today,
			String startDate, String endDate) throws CustomerSelectListException;


}