package com.kh.tsp.admin.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.tsp.admin.model.exception.SelectBoardListException;
import com.kh.tsp.common.PageInfo;
import com.kh.tsp.customer.model.vo.Board;

public interface BoardAdminDao {

	// 문의 게시판 수
	int getListCount(SqlSessionTemplate sqlSession) throws SelectBoardListException;

	// 문의 게시판 전체 리스트
	ArrayList<Board> selectBoardQnAList(SqlSessionTemplate sqlSession, PageInfo pi) throws SelectBoardListException;

}
