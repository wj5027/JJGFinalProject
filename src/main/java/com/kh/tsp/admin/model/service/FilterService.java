package com.kh.tsp.admin.model.service;

import java.util.ArrayList;

import com.kh.tsp.admin.model.exception.FilterException;
import com.kh.tsp.admin.model.vo.Filter;
import com.kh.tsp.common.PageInfo;

public interface FilterService {

	// 필터 전체 수
	int getListCount() throws FilterException;

	// 필터 전체 리스트
	ArrayList<Filter> selectFilterList() throws FilterException;

	// 필터 추가
	int insertFilter(String fContent) throws FilterException;

	// 필터 삭제
	int deleteFilter(String fContent) throws FilterException;

}
