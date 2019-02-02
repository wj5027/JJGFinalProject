package com.kh.tsp.customer.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.tsp.customer.model.vo.Board;

public interface BoardDao {
	//공지사항 리스트
	List<Board> selectNoticeList(Board b);
	//게시물 조회수 증가
	int updateCount(SqlSessionTemplate sqlSession, int bno);
	//공지사항 상세보기
	Board selectOneNotice(SqlSessionTemplate sqlSession, int bno);
	//공지사항 삭제
	int deleteNotice(SqlSessionTemplate sqlSession, int bno);
	
	
	

}
