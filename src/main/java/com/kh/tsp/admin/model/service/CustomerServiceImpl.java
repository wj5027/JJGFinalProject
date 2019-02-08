package com.kh.tsp.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tsp.admin.model.dao.CustomerDao;
import com.kh.tsp.admin.model.exception.CustomerSelectListException;
import com.kh.tsp.admin.model.vo.MemberAdmin;
import com.kh.tsp.common.PageInfo;

@Service
public class CustomerServiceImpl implements CustomerService{

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private CustomerDao cd;
	
	// 사용자 수
	@Override
	public int getListCount() throws CustomerSelectListException {
		int listCount = cd.getListCount(sqlSession);
		return listCount;
	}

	// 사용자 리스트
	@Override
	public ArrayList<MemberAdmin> selectCustomerList(PageInfo pi) throws CustomerSelectListException {
		ArrayList<MemberAdmin> list = cd.selectCustomerList(sqlSession,pi);
		return list;
	}

	// 회원 탈퇴
	@Override
	public int deleteCustomer(MemberAdmin md) throws CustomerSelectListException {
		int result = cd.deleteCustomer(sqlSession, md);
		return result;
	}

	// 회원 탈퇴
	@Override
	public int updateRecoverCustomer(MemberAdmin md) throws CustomerSelectListException {
		int result = cd.updateRecoverCustomer(sqlSession, md);
		return result;
	}

	// 사용자 검색 수
	@Override
	public int getSearchListCount(String selectStatus, String memberId, String today, String startDate, String endDate)
			throws CustomerSelectListException {
		int listCount = cd.getSearchListCount(sqlSession,selectStatus, memberId, today, startDate, endDate);
		return listCount;
	}

	// 사용자 검색 결과
	@Override
	public ArrayList<MemberAdmin> selectSearchCustomerList(PageInfo pi, String selectStatus, String memberId,
			String today, String startDate, String endDate) throws CustomerSelectListException {
		ArrayList<MemberAdmin> list = cd.selectSearchCustomerList(sqlSession,pi, selectStatus, memberId, today, startDate, endDate);
		return list;
	}

}
