package com.kh.tsp.admin.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.tsp.admin.model.exception.ParkingCEOSelectListException;
import com.kh.tsp.admin.model.vo.MemberAdmin;
import com.kh.tsp.common.PageInfo;

public interface ParkingCEODao {

	// ����� ��
	int getListCount(SqlSessionTemplate sqlSession) throws ParkingCEOSelectListException;

	// ����� ����Ʈ
	ArrayList<MemberAdmin> selectParkingCEOList(SqlSessionTemplate sqlSession, PageInfo pi) throws ParkingCEOSelectListException;

	// ȸ�� Ż��
	int deleteParkingCEO(SqlSessionTemplate sqlSession, MemberAdmin md) throws ParkingCEOSelectListException;

	// ȸ�� ����
	int updateRecoverParkingCEO(SqlSessionTemplate sqlSession, MemberAdmin md) throws ParkingCEOSelectListException;

	// ����� �˻� ���
	ArrayList<MemberAdmin> selectSearchParkingCEOList(SqlSessionTemplate sqlSession, PageInfo pi, String selectStatus,
			String memberId, String today, String startDate, String endDate) throws ParkingCEOSelectListException;

}
