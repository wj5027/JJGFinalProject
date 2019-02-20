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
import com.kh.tsp.admin.model.vo.OilListAdmin;
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

	// 반송사유 입력 완료 시 오일 +
	@Override
	public int updateAddOil(ExchangeMoneyAdmin em) throws ExchangeMoneyException {
		int result = emd.updateAddOil(sqlSession, em);
		return result;
	}

	// 승인버튼 (결제취소) - 환불진행중
	@Override
	public int insertConfirmRefundMoney(OilListAdmin oa) throws ExchangeMoneyException {
		int result = emd.insertConfirmRefundMoney(sqlSession, oa);
		return result;
	}

	// 승인버튼 (환전) - 환전진행중
	@Override
	public int insertConfirmExchangeMoney(OilListAdmin oa) throws ExchangeMoneyException {
		int result = emd.insertConfirmExchangeMoney(sqlSession, oa);
		return result;
	}

	// 반송버튼 (환불취소) - 환불진행중
	@Override
	public int insertCancelRefundMoney(OilListAdmin oa) throws ExchangeMoneyException {
		int result = emd.insertCancelRefundMoney(sqlSession, oa);
		return result;
	}

	// 반송버튼 (환전취소) - 환전진행중
	@Override
	public int insertCancelExchangeMoney(OilListAdmin oa) throws ExchangeMoneyException {
		int result = emd.insertCancelExchangeMoney(sqlSession, oa);
		return result;
	}

}
