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
	//공지사항 수정
	Board updateNotice(SqlSessionTemplate sqlSession, int bno);
	//공지사항 수정2
	int updateNotice2(SqlSessionTemplate sqlSession, Board b);
	//공지사항 등록
	int insertNotice(SqlSessionTemplate sqlSession, Board b);
	//문의 목록
	List<Board> selectQnaList(Board b);
	//문의 등록
	int insertQna(SqlSessionTemplate sqlSession, Board b);
	//문의 상세보기
	Board selectOneQna(SqlSessionTemplate sqlSession, int bno);
	//문의 수정1
	Board updateQna(SqlSessionTemplate sqlSession, int bno);
	//문의 수정2
	int updateQna2(SqlSessionTemplate sqlSession, Board b);
	//문의 삭제
	int deleteQna(SqlSessionTemplate sqlSession, int bno);
	//후기 목록
	List<Board> selectReviewList(SqlSessionTemplate sqlSession, Board b);
	//후기 작성
	int insertReview(SqlSessionTemplate sqlSession, Board b);
	
	
	

}
