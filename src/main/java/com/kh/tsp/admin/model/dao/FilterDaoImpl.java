package com.kh.tsp.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.tsp.admin.model.exception.FilterException;
import com.kh.tsp.admin.model.exception.SelectBoardListException;
import com.kh.tsp.admin.model.vo.Filter;
import com.kh.tsp.common.PageInfo;
import com.kh.tsp.customer.model.vo.Board;

@Repository
public class FilterDaoImpl  implements FilterDao{

	// 필터 전체 수
	@Override
	public int getListCount(SqlSessionTemplate sqlSession) throws FilterException {
		int listCount = sqlSession.selectOne("Filter.getListCount");
		System.out.println("필터 전체 수 : "+listCount);
		if(listCount <=0) {
			throw new FilterException("필터 전체 수 조회 실패!");
		}
		return listCount;
	}

	// 필터 전체 리스트
	@Override
	public ArrayList<Filter> selectFilterList(SqlSessionTemplate sqlSession) throws FilterException {
		
		ArrayList<Filter> list = null;
		
		list = (ArrayList)sqlSession.selectList("Filter.selectFilterList");
		System.out.println("필터 전체 리스트 : "+list);
		if(list == null) {
			throw new FilterException("필터 전체 리스트 조회 실패");
		}
		return list;
	}

	// 필터 추가
	@Override
	public int insertFilter(SqlSessionTemplate sqlSession, String fContent) throws FilterException {
		
		int result = sqlSession.insert("Filter.insertFilter", fContent);
		
		if(result<=0) {
			throw new FilterException("필터 추가 실패!");
		}
		return result;
	}

	// 필터 삭제
	@Override
	public int deleteFilter(SqlSessionTemplate sqlSession, String fContent) throws FilterException {
		
		int result = sqlSession.update("Filter.deleteFilter", fContent);
		
		if(result<=0) {
			throw new FilterException("필터 삭제 실패!");
		}
		return result;
	}

}
