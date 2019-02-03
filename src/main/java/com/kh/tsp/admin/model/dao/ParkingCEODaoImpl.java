package com.kh.tsp.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.tsp.admin.model.exception.ParkingCEOSelectListException;
import com.kh.tsp.admin.model.vo.MemberAdmin;
import com.kh.tsp.common.PageInfo;

@Repository
public class ParkingCEODaoImpl  implements ParkingCEODao{

	// ����� ��
	@Override
	public int getListCount(SqlSessionTemplate sqlSession) throws ParkingCEOSelectListException {
		int listCount = sqlSession.selectOne("MemberAdmin.getListCount");
		if(listCount <=0) {
			throw new ParkingCEOSelectListException("����� ȸ�� �� ��ȸ ����!");
		}
		return listCount;
	}

	// ����� ��ȸ
	@Override
	public ArrayList<MemberAdmin> selectParkingCEOList(SqlSessionTemplate sqlSession, PageInfo pi) throws ParkingCEOSelectListException {
		ArrayList<MemberAdmin> list = null;
		int offset = (pi.getCurrentPage()-1)* pi.getLimit();	
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("MemberAdmin.selectParkingCEOList", null, rowBounds);
		
		if(list == null) {
			throw new ParkingCEOSelectListException("����� ȸ�� ��ȸ ����");
		}
		return list;
	}

	// ȸ�� Ż��
	@Override
	public int deleteParkingCEO(SqlSessionTemplate sqlSession, MemberAdmin md) throws ParkingCEOSelectListException {
		
		int memberNo = md.getMemberNo();
		System.out.println("memberNo : "+memberNo);
		
		int result = sqlSession.update("MemberAdmin.deleteParkingCEO", memberNo);
		System.out.println("result(DAO ȸ��Ż��) : "+result);
		
		if(result<=0) {
			throw new ParkingCEOSelectListException("����� ȸ�� Ż�� ����!");
		}
		return result;
	}

	// ȸ�� ����
	@Override
	public int updateRecoverParkingCEO(SqlSessionTemplate sqlSession, MemberAdmin md) throws ParkingCEOSelectListException {
		
		int memberNo = md.getMemberNo();
		System.out.println("memberNo : "+memberNo);
		
		int result = sqlSession.update("MemberAdmin.updateRecoverParkingCEO", memberNo);
		System.out.println("result(DAO ȸ������) : "+result);
		
		if(result<=0) {
			throw new ParkingCEOSelectListException("����� ȸ�� ���� ����!");
		}
		return result;
	}

}
