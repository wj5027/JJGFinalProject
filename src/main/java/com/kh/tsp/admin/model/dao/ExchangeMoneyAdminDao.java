package com.kh.tsp.admin.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.tsp.admin.model.exception.ExchangeMoneyException;
import com.kh.tsp.admin.model.exception.SelectBoardListException;
import com.kh.tsp.admin.model.vo.ExchangeMoneyAdmin;
import com.kh.tsp.common.PageInfo;
import com.kh.tsp.customer.model.vo.Board;

public interface ExchangeMoneyAdminDao {

	// 환전/환불 전체 리스트 수
	int getListCount(SqlSessionTemplate sqlSession) throws ExchangeMoneyException;

	// 환전/환불 전체 리스트
	ArrayList<ExchangeMoneyAdmin> selectExchangeMoneyList(SqlSessionTemplate sqlSession, PageInfo pi) throws ExchangeMoneyException;

	// 환전 환불 리스트 상세보기 ajax
	ExchangeMoneyAdmin detailExchangeMoneym(SqlSessionTemplate sqlSession, ExchangeMoneyAdmin em) throws ExchangeMoneyException;

	// 환전 환불 승인
	int updateRefundExchangeMoney(SqlSessionTemplate sqlSession, ExchangeMoneyAdmin em) throws ExchangeMoneyException;

	// 환전 환불 반송
	int deleteExchangeMoney(SqlSessionTemplate sqlSession, ExchangeMoneyAdmin em) throws ExchangeMoneyException;

	// 반송 사유 ajax
	ExchangeMoneyAdmin cancelReasonDetail(SqlSessionTemplate sqlSession, ExchangeMoneyAdmin em) throws ExchangeMoneyException;

	// 환전 환불 검색 수
	int getSearchListCount(SqlSessionTemplate sqlSession, String status, String memberId, String memberType,
			String today, String startDate, String endDate) throws ExchangeMoneyException;

	// 환전 환불 검색 결과
	ArrayList<ExchangeMoneyAdmin> selectSearchExchangeMoneyAdminList(SqlSessionTemplate sqlSession, PageInfo pi,
			String status, String memberId, String memberType, String today, String startDate, String endDate) throws ExchangeMoneyException;


/*	// 문의 게시판 수
	int getListCount(SqlSessionTemplate sqlSession) throws SelectBoardListException;

	// 문의 게시판 전체 리스트
	ArrayList<Board> selectBoardQnAList(SqlSessionTemplate sqlSession, PageInfo pi) throws SelectBoardListException;

	// 문의 게시판 삭제
	int deleteBoardQnA(SqlSessionTemplate sqlSession, Board b) throws SelectBoardListException;

	// 문의 게시판 복구
	int updateRecoverBoardQnA(SqlSessionTemplate sqlSession, Board b) throws SelectBoardListException;

	// 문의 게시판 검색 수
	int getSearchListCount(SqlSessionTemplate sqlSession, String selectStatus, String mId, String bTitle, String today, String startDate,
			String endDate) throws SelectBoardListException;

	// 문의 게시판 검색 리스트
	ArrayList<Board> selectSearchBoardQnAList(SqlSessionTemplate sqlSession, PageInfo pi, String selectStatus, String mId, String bTitle,
			String today, String startDate, String endDate) throws SelectBoardListException;

	// 문의 게시판 답변
	Board answerBoardQnA(SqlSessionTemplate sqlSession, Board b) throws SelectBoardListException;

	// 답변 작성
	int insertAnswerBoard(SqlSessionTemplate sqlSession, String bno, String mno, String textareaId) throws SelectBoardListException;

	// 답변 수정
	int updateAnswerBoard(SqlSessionTemplate sqlSession, String updateTextareaId, String replyNo) throws SelectBoardListException;

	
	
	
	
	// 후기 게시판 수
	int getReviewListCount(SqlSessionTemplate sqlSession) throws SelectBoardListException;

	// 후기 게시판 전체 리스트
	ArrayList<Board> selectBoardReviewList(SqlSessionTemplate sqlSession, PageInfo pi) throws SelectBoardListException;

	// 후기 게시판 답변 ajax
	Board detailBoardReview(SqlSessionTemplate sqlSession, Board b) throws SelectBoardListException;

	// 후기 게시판 삭제
	int deleteBoardReview(SqlSessionTemplate sqlSession, Board b) throws SelectBoardListException;

	// 후기 게시판 복구
	int updateRecoverBoardReview(SqlSessionTemplate sqlSession, Board b) throws SelectBoardListException;

	// 후기 게시판 검색 수
	int getSearchReviewListCount(SqlSessionTemplate sqlSession, String selectStatus, String mId, String parkingName,
			String bTitle, String today, String startDate, String endDate) throws SelectBoardListException;

	// 후기 게시판 검색 결과
	ArrayList<Board> selectSearchBoardReviewList(SqlSessionTemplate sqlSession, PageInfo pi, String selectStatus,
			String mId, String parkingName, String bTitle, String today, String startDate, String endDate) throws SelectBoardListException;
	*/

}
