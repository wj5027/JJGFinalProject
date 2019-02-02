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

	// 사업자 수
	@Override
	public int getListCount(SqlSessionTemplate sqlSession) throws ParkingCEOSelectListException {
		int listCount = sqlSession.selectOne("MemberAdmin.getListCount");
		if(listCount <=0) {
			throw new ParkingCEOSelectListException("사업자 회원 수 조회 실패!");
		}
		return listCount;
	}

	// 사업자 조회
	@Override
	public ArrayList<MemberAdmin> selectParkingCEOList(SqlSessionTemplate sqlSession, PageInfo pi) throws ParkingCEOSelectListException {
		ArrayList<MemberAdmin> list = null;
		int offset = (pi.getCurrentPage()-1)* pi.getLimit();	
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("MemberAdmin.selectParkingCEOList", null, rowBounds);
		
		if(list == null) {
			throw new ParkingCEOSelectListException("사업자 회원 조회 실패");
		}
		return list;
	}

}
