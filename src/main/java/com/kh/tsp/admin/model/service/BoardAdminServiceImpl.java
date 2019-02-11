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

	// 문의 게시판 삭제
	@Override
	public int deleteBoardQnA(Board b) throws SelectBoardListException {
		int result = bd.deleteBoardQnA(sqlSession, b);
		return result;
	}

	// 문의 게시판 복구
	@Override
	public int updateRecoverBoardQnA(Board b) throws SelectBoardListException {
		int result = bd.updateRecoverBoardQnA(sqlSession, b);
		return result;
	}

	// 문의 게시판 검색 수
	@Override
	public int getSearchListCount(String selectStatus, String mId, String bTitle, String today, String startDate, String endDate) throws SelectBoardListException {
		int listCount = bd.getSearchListCount(sqlSession, selectStatus, mId, bTitle, today, startDate, endDate);
		return listCount;
	}

	// 문의 게시판 검색 리스트
	@Override
	public ArrayList<Board> selectSearchParkingCEOList(PageInfo pi, String selectStatus, String mId, String bTitle, String today,
			String startDate, String endDate) throws SelectBoardListException {
		ArrayList<Board> list = bd.selectSearchBoardQnAList(sqlSession, pi, selectStatus, mId, bTitle, today, startDate, endDate);
		return list;
	}

	// 문의 게시판 답변
	@Override
	public Board answerBoardQnA(Board b) throws SelectBoardListException {
		b = bd.answerBoardQnA(sqlSession, b);
		return b;
	}

	// 답변 작성
	@Override
	public int insertAnswerBoard(String bno, String mno, String textareaId) throws SelectBoardListException {
		int result = bd.insertAnswerBoard(sqlSession, bno, mno, textareaId);
		return result;
	}

	// 답변 수정
	@Override
	public int updateAnswerBoard(String updateTextareaId, String replyNo) throws SelectBoardListException {
	int result = bd.updateAnswerBoard(sqlSession, updateTextareaId, replyNo);
	return result;
	}

	
	
	
	// 후기 게시판 수
	@Override
	public int getReviewListCount() throws SelectBoardListException {
		int listCount = bd.getReviewListCount(sqlSession);
		return listCount;
	}

	// 후기 게시판 전체 리스트
	@Override
	public ArrayList<Board> selectBoardReviewList(PageInfo pi) throws SelectBoardListException {
		ArrayList<Board> list = bd.selectBoardReviewList(sqlSession,pi);
		return list;
	}

	// 후기 게시판 답변 ajax
	@Override
	public Board detailBoardReview(Board b) throws SelectBoardListException {
		b = bd.detailBoardReview(sqlSession, b);
		return b;
	}

	// 후기 게시판 삭제
	@Override
	public int deleteBoardReview(Board b) throws SelectBoardListException {
		int result = bd.deleteBoardReview(sqlSession, b);
		return result;
	}

	// 후기 게시판 복구
	@Override
	public int updateRecoverBoardReview(Board b) throws SelectBoardListException {
		int result = bd.updateRecoverBoardReview(sqlSession, b);
		return result;
	}

}
