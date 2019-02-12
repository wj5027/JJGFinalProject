package com.kh.tsp.admin.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.tsp.admin.model.exception.CouponListException;
import com.kh.tsp.admin.model.exception.SelectBoardListException;
import com.kh.tsp.admin.model.vo.CouponRequestList;
import com.kh.tsp.common.PageInfo;
import com.kh.tsp.customer.model.vo.Board;

public interface CouponAdminDao {

	// 쿠폰 전체 수
	int getListCount(SqlSessionTemplate sqlSession) throws CouponListException;

	// 쿠폰 전체 리스트
	ArrayList<CouponRequestList> selectCouponList(SqlSessionTemplate sqlSession, PageInfo pi) throws CouponListException;

	// 쿠폰 발급
	int updateCoupon(SqlSessionTemplate sqlSession, CouponRequestList crl) throws CouponListException;

	// 쿠폰 반송
	int deleteCoupon(SqlSessionTemplate sqlSession, CouponRequestList crl) throws CouponListException;

	// 반송 사유 ajax
	CouponRequestList selectRefuseReason(SqlSessionTemplate sqlSession, CouponRequestList c) throws CouponListException;

	/*// 문의 게시판 수
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
