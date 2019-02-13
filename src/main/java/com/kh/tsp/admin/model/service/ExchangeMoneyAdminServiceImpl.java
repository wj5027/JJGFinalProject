package com.kh.tsp.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tsp.admin.model.dao.BoardAdminDao;
import com.kh.tsp.admin.model.dao.ExchangeMoneyAdminDao;
import com.kh.tsp.admin.model.exception.ExchangeMoneyException;
import com.kh.tsp.admin.model.exception.SelectBoardListException;
import com.kh.tsp.admin.model.vo.ExchangeMoneyAdmin;
import com.kh.tsp.common.PageInfo;
import com.kh.tsp.customer.model.vo.Board;

@Service
public class ExchangeMoneyAdminServiceImpl implements ExchangeMoneyAdminService{

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private ExchangeMoneyAdminDao emd;

	// 환전/환불 전체 리스트 수
	@Override
	public int getListCount() throws ExchangeMoneyException {
		int listCount = emd.getListCount(sqlSession);
		return listCount;
	}

	// 환전/환불 전체 리스트
	@Override
	public ArrayList<ExchangeMoneyAdmin> selectExchangeMoneyList(PageInfo pi) throws ExchangeMoneyException {
		ArrayList<ExchangeMoneyAdmin> list = emd.selectExchangeMoneyList(sqlSession,pi);
		return list;
	}

	// 환전 환불 리스트 상세보기 ajax
	@Override
	public ExchangeMoneyAdmin detailExchangeMoneym(ExchangeMoneyAdmin em) throws ExchangeMoneyException {
		em = emd.detailExchangeMoneym(sqlSession, em);
		return em;
	}

	// 환전 환불 승인
	@Override
	public int updateRefundExchangeMoney(ExchangeMoneyAdmin em) throws ExchangeMoneyException {
		int result = emd.updateRefundExchangeMoney(sqlSession, em);
		return result;
	}

	// 환전 환불 반송
	@Override
	public int deleteExchangeMoney(ExchangeMoneyAdmin em) throws ExchangeMoneyException {
		int result = emd.deleteExchangeMoney(sqlSession, em);
		return result;
	}

	// 반송 사유 ajax
	@Override
	public ExchangeMoneyAdmin cancelReasonDetail(ExchangeMoneyAdmin em) throws ExchangeMoneyException {
		em = emd.cancelReasonDetail(sqlSession, em);
		return em;
	}

	// 환전 환불 검색 수
	@Override
	public int getSearchListCount(String status, String memberId, String memberType, String today, String startDate,
			String endDate) throws ExchangeMoneyException {
		int listCount = emd.getSearchListCount(sqlSession, status, memberId, memberType, today, startDate, endDate);
		return listCount;
	}

	// 환전 환불 검색 결과
	@Override
	public ArrayList<ExchangeMoneyAdmin> selectSearchExchangeMoneyAdminList(PageInfo pi, String status, String memberId,
			String memberType, String today, String startDate, String endDate) throws ExchangeMoneyException {
		ArrayList<ExchangeMoneyAdmin> list = emd.selectSearchExchangeMoneyAdminList(sqlSession, pi, status, memberId, memberType, today, startDate, endDate);
		return list;
	}

/*	// 문의 게시판 수
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
	public ArrayList<Board> selectSearchBoardQnAList(PageInfo pi, String selectStatus, String mId, String bTitle, String today,
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

	// 후기 게시판 검색 수
	@Override
	public int getSearchReviewListCount(String selectStatus, String mId, String parkingName, String bTitle,
			String today, String startDate, String endDate) throws SelectBoardListException {
		int listCount = bd.getSearchReviewListCount(sqlSession, selectStatus, mId, parkingName, bTitle, today, startDate, endDate);
		return listCount;
	}

	// 후기 게시판 검색 결과
	@Override
	public ArrayList<Board> selectSearchBoardReviewList(PageInfo pi, String selectStatus, String mId,
			String parkingName, String bTitle, String today, String startDate, String endDate)
			throws SelectBoardListException {
		ArrayList<Board> list = bd.selectSearchBoardReviewList(sqlSession, pi, selectStatus, mId, parkingName, bTitle, today, startDate, endDate);
		return list;
	}*/

}
