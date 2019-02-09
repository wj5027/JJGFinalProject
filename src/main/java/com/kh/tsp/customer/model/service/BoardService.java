package com.kh.tsp.customer.model.service;


import java.util.ArrayList;
import java.util.List;

import org.springframework.ui.Model;

import com.kh.tsp.common.PageInfo;
import com.kh.tsp.customer.model.exception.BoardSelectListException;
import com.kh.tsp.customer.model.vo.Board;

public interface BoardService {
	//공지사항 리스트
	List<Board> selectNoticeList(Board b);
	//공지사항 상세보기
	Board selectOneNotice(int bno);
	//공지사항 삭제
	int deleteNotice(int bno);
	//공지사항 수정1
	Board updateNotice(int bno);
	//공지사항 수정2
	int updateNotice2(Board b);
	//공지사항 등록
	int insertNotice(Board b);
	//후기 등록
	List<Board> selectQnaList(Board b);
	//문의 등록
	int insertQna(Board b);
	//문의 상세보기
	Board selectOneQna(int bno);
	//문의 수정1
	Board updateQna(int bno);
	//문의 수정2
	int updateQna2(Board b);
	//문의 삭제
	int deleteQna(int bno);
	//후기 목록
	List<Board> selectReviewList(Board b);
	//후기 작성
	int insertReview(Board b);
	//후기 상세보기
	Board selectOneReview(int bno);
	//후기 수정1(상세보기)
	Board updateReview(int bno);
	//후기 수정2
	int updateReview2(Board b);
	//후기 삭제
	int deleteReview(int bno);
	//후기 전체 게시물 수 
	int getListCount();
	//후기 목록
	ArrayList<Board> selectReviewList(PageInfo pi);
	//공지 전체 게시글 수 조회
	int getNoticeListCount();
	//공지 목록 
	ArrayList<Board> selectNoticeList(PageInfo pi);
	//문의 전체 게시글 수 조회
	int getQnaListCount();
	//페이징 된 문의 목록
	ArrayList<Board> selectQnaList(PageInfo pi);
	
	
	
	
	
	

}
