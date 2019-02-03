package com.kh.tsp.admin.model.service;

import java.util.ArrayList;

import com.kh.tsp.admin.model.exception.ParkingCEOSelectListException;
import com.kh.tsp.admin.model.vo.MemberAdmin;
import com.kh.tsp.common.PageInfo;

public interface ParkingCEOService {

	// ����� ��
	int getListCount() throws ParkingCEOSelectListException;

	// ����� ��ȸ
	ArrayList<MemberAdmin> selectParkingCEOList(PageInfo pi) throws ParkingCEOSelectListException;

	// ȸ�� Ż��
	int deleteParkingCEO(MemberAdmin md) throws ParkingCEOSelectListException;

	// ȸ�� ����
	int updateRecoverParkingCEO(MemberAdmin md) throws ParkingCEOSelectListException;

}
