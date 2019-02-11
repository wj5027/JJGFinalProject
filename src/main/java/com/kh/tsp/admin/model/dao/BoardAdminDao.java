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

	// 문의 게시판 삭제
	int deleteBoardQnA(SqlSessionTemplate sqlSession, Board b) throws SelectBoardListException;

	// 문의 게시판 복구
	int updateRecoverBoardQnA(SqlSessionTemplate sqlSession, Board b) throws SelectBoardListException;

	// 문의 게시판 검색 수
	int getSearchListCount(SqlSessionTemplate sqlSession, String mId, String bTitle, String today, String startDate,
			String endDate) throws SelectBoardListException;

	// 문의 게시판 검색 리스트
	ArrayList<Board> selectSearchBoardQnAList(SqlSessionTemplate sqlSession, PageInfo pi, String mId, String bTitle,
			String today, String startDate, String endDate) throws SelectBoardListException;

	// 문의 게시판 답변
	Board answerBoardQnA(SqlSessionTemplate sqlSession, Board b) throws SelectBoardListException;

	// 답변 작성
	int insertAnswerBoard(SqlSessionTemplate sqlSession, String bno, String mno, String textareaId) throws SelectBoardListException;

}
