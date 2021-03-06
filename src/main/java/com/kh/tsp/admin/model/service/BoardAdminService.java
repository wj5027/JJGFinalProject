package com.kh.tsp.admin.model.service;

import java.util.ArrayList;

import com.kh.tsp.admin.model.exception.SelectBoardListException;
import com.kh.tsp.common.PageInfo;
import com.kh.tsp.customer.model.vo.Board;

public interface BoardAdminService {

	// 문의 게시판 수
	int getListCount() throws SelectBoardListException;

	// 문의 게시판 전체 리스트
	ArrayList<Board> selectBoardQnAList(PageInfo pi) throws SelectBoardListException;

	// 문의 게시판 삭제
	int deleteBoardQnA(Board b) throws SelectBoardListException;

	// 문의 게시판 복구
	int updateRecoverBoardQnA(Board b) throws SelectBoardListException;

	// 문의 게시판 검색 수
	int getSearchListCount(String selectStatus, String mId, String bTitle, String today, String startDate, String endDate) throws SelectBoardListException;

	// 문의 게시판 검색 리스트
	ArrayList<Board> selectSearchBoardQnAList(PageInfo pi, String selectStatus, String mId, String bTitle, String today, String startDate,
			String endDate) throws SelectBoardListException;

	// 문의 게시판 답변
	Board answerBoardQnA(Board b) throws SelectBoardListException;

	// 답변 작성
	int insertAnswerBoard(String bno, String mno, String textareaId) throws SelectBoardListException;

	// 답변 수정
	int updateAnswerBoard(String updateTextareaId, String replyNo) throws SelectBoardListException;

	
	

	// 후기 게시판 수
	int getReviewListCount() throws SelectBoardListException;

	// 문의 게시판 전체 리스트
	ArrayList<Board> selectBoardReviewList(PageInfo pi) throws SelectBoardListException;

	// 후기 게시판 답변 ajax
	Board detailBoardReview(Board b) throws SelectBoardListException;

	// 후기 게시판 삭제
	int deleteBoardReview(Board b) throws SelectBoardListException;

	// 후기 게시판 복구
	int updateRecoverBoardReview(Board b) throws SelectBoardListException;

	// 후기 게시판 검색 수
	int getSearchReviewListCount(String selectStatus, String mId, String parkingName, String bTitle, String today,
			String startDate, String endDate) throws SelectBoardListException;

	// 후기 게시판 검색 결과
	ArrayList<Board> selectSearchBoardReviewList(PageInfo pi, String selectStatus, String mId, String parkingName,
			String bTitle, String today, String startDate, String endDate) throws SelectBoardListException;

}
