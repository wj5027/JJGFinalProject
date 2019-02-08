package com.kh.tsp.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.tsp.admin.model.exception.SelectBoardListException;
import com.kh.tsp.common.PageInfo;
import com.kh.tsp.customer.model.vo.Board;

@Repository
public class BoardAdminDaoImpl  implements BoardAdminDao{

	// 문의 게시판 수
	@Override
	public int getListCount(SqlSessionTemplate sqlSession) throws SelectBoardListException {
		int listCount = sqlSession.selectOne("BoardAdmin.getListCount");
		System.out.println("문의 게시판 수 : "+listCount);
		if(listCount <=0) {
			throw new SelectBoardListException("문의 게시판 수 조회 실패!");
		}
		return listCount;
	}

	// 문의 게시판 전체 리스트
	@Override
	public ArrayList<Board> selectBoardQnAList(SqlSessionTemplate sqlSession, PageInfo pi) throws SelectBoardListException {
		ArrayList<Board> list = null;
		int offset = (pi.getCurrentPage()-1)* pi.getLimit();	
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("BoardAdmin.selectBoardQnAList", null, rowBounds);
		System.out.println("문의 게시판 전체 리스트 : "+list);
		if(list == null) {
			throw new SelectBoardListException("문의 게시판 전체 리스트 조회 실패");
		}
		return list;
	}

}
