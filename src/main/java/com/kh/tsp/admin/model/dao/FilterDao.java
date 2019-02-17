package com.kh.tsp.admin.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.tsp.admin.model.exception.FilterException;
import com.kh.tsp.admin.model.exception.SelectBoardListException;
import com.kh.tsp.admin.model.vo.Filter;
import com.kh.tsp.common.PageInfo;
import com.kh.tsp.customer.model.vo.Board;

public interface FilterDao {

	// 필터 전체 수
	int getListCount(SqlSessionTemplate sqlSession) throws FilterException;

	// 필터 전체 리스트
	ArrayList<Filter> selectFilterList(SqlSessionTemplate sqlSession) throws FilterException;

	// 필터 추가
	int insertFilter(SqlSessionTemplate sqlSession, String fContent) throws FilterException;

	// 필터 삭제
	int deleteFilter(SqlSessionTemplate sqlSession, String fContent) throws FilterException;

}
