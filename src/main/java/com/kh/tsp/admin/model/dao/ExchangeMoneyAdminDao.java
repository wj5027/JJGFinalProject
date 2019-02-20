package com.kh.tsp.admin.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.tsp.admin.model.exception.ExchangeMoneyException;
import com.kh.tsp.admin.model.exception.SelectBoardListException;
import com.kh.tsp.admin.model.vo.ExchangeMoneyAdmin;
import com.kh.tsp.admin.model.vo.OilListAdmin;
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

	// 반송사유 입력 완료 시 오일 +
	int updateAddOil(SqlSessionTemplate sqlSession, ExchangeMoneyAdmin em) throws ExchangeMoneyException;

	// 승인버튼 (결제취소) - 환불진행중
	int insertConfirmRefundMoney(SqlSessionTemplate sqlSession, OilListAdmin oa) throws ExchangeMoneyException;

	// 승인버튼 (환전) - 환전진행중	
	int insertConfirmExchangeMoney(SqlSessionTemplate sqlSession, OilListAdmin oa) throws ExchangeMoneyException;

	// 반송버튼 (환불취소) - 환불진행중
	int insertCancelRefundMoney(SqlSessionTemplate sqlSession, OilListAdmin oa) throws ExchangeMoneyException;

	// 반송버튼 (환전취소) - 환전진행중
	int insertCancelExchangeMoney(SqlSessionTemplate sqlSession, OilListAdmin oa) throws ExchangeMoneyException;

}
