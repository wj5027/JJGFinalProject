package com.kh.tsp.customer.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.kh.tsp.customer.model.exception.BoardSelectListException;
import com.kh.tsp.customer.model.vo.Board;

@Repository
public class BoardDaoImpl implements BoardDao{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//공지사항 리스트 
	@Override
	public List<Board> selectNoticeList(Board b) {
		
		return sqlSession.selectList("boardList", b);
	}
	//조회수 업데이트
	@Override
	public int updateCount(SqlSessionTemplate sqlSession, int bno) {
		
		
		return sqlSession.update("Board.updateBoardCount", bno);
	}
	//공지사항 상세보기
	@Override
	public Board selectOneNotice(SqlSessionTemplate sqlSession, int bno) {
		
		return sqlSession.selectOne("Board.selectOneNotice", bno);
	}
	//공지사항 삭제
	@Override
	public int deleteNotice(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.delete("Board.deleteNotice", bno);
	}
	
	
	
	

}
