package com.kh.tsp.customer.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.tsp.common.PageInfo;
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
	//후기 상세보기
	Board selectOneReview(SqlSessionTemplate sqlSession, int bno);
	//후기 수정1
	Board updateReview(SqlSessionTemplate sqlSession, int bno);
	//후기 수정2
	int updateReview2(SqlSessionTemplate sqlSession, Board b);
	//후기 삭제
	int deleteReview(SqlSessionTemplate sqlSession, int bno);
	//후기 전체 게시글 수 조회
	int getListCount(SqlSessionTemplate sqlSession);
	//페이징 된 후기 목록 조회
	ArrayList<Board> selectReviewList(SqlSessionTemplate sqlSession, PageInfo pi);
	//공지 전체 게시글 수 조회
	int getNoticeListCount(SqlSessionTemplate sqlSession);
	//페이징 처리 된 공지 목록 조회
	ArrayList<Board> selectNoticeList(SqlSessionTemplate sqlSession, PageInfo pi);
	//문의 전체 게시글 수 조회
	int getQnaListCount(SqlSessionTemplate sqlSession);
	//페이징 처리 된 문의 목록 조회
	ArrayList<Board> selectQnaList(SqlSessionTemplate sqlSession, PageInfo pi);
	//페이징 처리 된 주차장 문의 목록 조회
	ArrayList<Board> selectParkingQnaList(SqlSessionTemplate sqlSession, PageInfo pi, String pno);
	//주차장 문의 상세보기
	Board selectOneParkingQna(SqlSessionTemplate sqlSession, int bno);
	//페이징 처리 된 주차장 후기 목록
	ArrayList<Board> selectParkingReviewList(SqlSessionTemplate sqlSession, PageInfo pi, String pno);
	//주차장 후기 상세보기
	Board selectOneParkingReview(SqlSessionTemplate sqlSession, int bno);
	//주차장 후기 등록
	int insertParkingReview(SqlSessionTemplate sqlSession, Board b);
	//주차장 후기 수정1
	Board updateParkingReview(SqlSessionTemplate sqlSession, int bno);
	//주차장 후기 수정2
	int updateParkingReview2(SqlSessionTemplate sqlSession, Board b);
	//주차장 문의 전체게시글 수
	int getParkingQnaListCount(SqlSessionTemplate sqlSession, String pno);
	//주차장 후기 전체게시글 수
	int getParkingReviewListCount(SqlSessionTemplate sqlSession, String pno);
	//주차장 문의 등록
	int insertParkingQna(SqlSessionTemplate sqlSession, Board b);
	
	
	

}
