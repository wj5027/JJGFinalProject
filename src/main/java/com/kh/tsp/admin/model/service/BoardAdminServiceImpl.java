package com.kh.tsp.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tsp.admin.model.dao.BoardAdminDao;
import com.kh.tsp.admin.model.exception.SelectBoardListException;
import com.kh.tsp.common.PageInfo;
import com.kh.tsp.customer.model.vo.Board;

@Service
public class BoardAdminServiceImpl implements BoardAdminService{

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private BoardAdminDao bd;

	// 문의 게시판 수
	@Override
	public int getListCount() throws SelectBoardListException {
		int listCount = bd.getListCount(sqlSession);
		return listCount;
	}

	// 문의 게시판 전체 리스트
	@Override
	public ArrayList<Board> selectBoardQnAList(PageInfo pi) throws SelectBoardListException {
		ArrayList<Board> list = bd.selectBoardQnAList(sqlSession,pi);
		return list;
	}

}
