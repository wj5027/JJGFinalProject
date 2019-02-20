package com.kh.tsp.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.tsp.admin.model.exception.CouponListException;
import com.kh.tsp.admin.model.exception.ExchangeMoneyException;
import com.kh.tsp.admin.model.exception.SelectBoardListException;
import com.kh.tsp.admin.model.vo.ExchangeMoneyAdmin;
import com.kh.tsp.admin.model.vo.OilListAdmin;
import com.kh.tsp.common.PageInfo;
import com.kh.tsp.customer.model.vo.Board;

@Repository
public class ExchangeMoneyAdminDaoImpl  implements ExchangeMoneyAdminDao{

	// 환전/환불 전체 리스트 수
	@Override
	public int getListCount(SqlSessionTemplate sqlSession) throws ExchangeMoneyException {
		int listCount = sqlSession.selectOne("ExchangeMoneyAdmin.getListCount");
		System.out.println("문의 게시판 수 : "+listCount);
		if(listCount <=0) {
			throw new ExchangeMoneyException("환전/환불 전체 리스트 수 조회 실패!");
		}
		return listCount;
	}

	// 환전/환불 전체 리스트
	@Override
	public ArrayList<ExchangeMoneyAdmin> selectExchangeMoneyList(SqlSessionTemplate sqlSession, PageInfo pi)
			throws ExchangeMoneyException {
		ArrayList<ExchangeMoneyAdmin> list = null;
		int offset = (pi.getCurrentPage()-1)* pi.getLimit();	
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		list = (ArrayList)sqlSession.selectList("ExchangeMoneyAdmin.selectExchangeMoneyList", null, rowBounds);
		System.out.println("문의 게시판 전체 리스트 : "+list);
		if(list == null) {
			throw new ExchangeMoneyException("환전/환불 전체 리스트 조회 실패!");
		}
		return list;
	}

	// 환전 환불 리스트 상세보기 ajax
	@Override
	public ExchangeMoneyAdmin detailExchangeMoneym(SqlSessionTemplate sqlSession, ExchangeMoneyAdmin em)
			throws ExchangeMoneyException {

		int exchangeNo = em.getExchangeNo();
		
		em = sqlSession.selectOne("ExchangeMoneyAdmin.detailExchangeMoneym", exchangeNo);
		System.out.println("result(DAO 환전 환불 리스트 ) : "+em);
		
		if(em==null) {
			throw new ExchangeMoneyException("특정 환전 환불 리스트 불러오가 실패!");
		}
		return em;
	}

	// 환전 환불 승인
	@Override
	public int updateRefundExchangeMoney(SqlSessionTemplate sqlSession, ExchangeMoneyAdmin em)
			throws ExchangeMoneyException {

		int exchangeNo = em.getExchangeNo();
		
		int result = sqlSession.update("ExchangeMoneyAdmin.updateRefundExchangeMoney", exchangeNo);
		
		if(result<=0) {
			throw new ExchangeMoneyException("환전 환불 승인 실패!");
		}
		return result;
	}

	// 환전 환불 반송
	@Override
	public int deleteExchangeMoney(SqlSessionTemplate sqlSession, ExchangeMoneyAdmin em) throws ExchangeMoneyException {
		
		int result = sqlSession.update("ExchangeMoneyAdmin.deleteExchangeMoney", em);
		
		if(result<=0) {
			throw new ExchangeMoneyException("환전 환불 반송 실패!");
		}
		return result;
	}

	// 반송 사유 ajax
	@Override
	public ExchangeMoneyAdmin cancelReasonDetail(SqlSessionTemplate sqlSession, ExchangeMoneyAdmin em)
			throws ExchangeMoneyException {

		int exchangeNo = em.getExchangeNo();
		
		em = sqlSession.selectOne("ExchangeMoneyAdmin.cancelReasonDetail", exchangeNo);
		
		if(em==null) {
			throw new ExchangeMoneyException("반송 사유 ajax 불러오가 실패!");
		}
		return em;
	}

	// 환전 환불 검색 수
	@Override
	public int getSearchListCount(SqlSessionTemplate sqlSession, String status, String memberId, String memberType,
			String today, String startDate, String endDate) throws ExchangeMoneyException {

		Map<String, Object> hmap = new HashMap<String, Object>();

		hmap.put("status", status);
		hmap.put("memberId", memberId);
		hmap.put("memberType", memberType);
		hmap.put("today", today);
		hmap.put("startDate", startDate);
		hmap.put("endDate", endDate);
		
		int listCount = sqlSession.selectOne("ExchangeMoneyAdmin.getSearchListCount", hmap);
		System.out.println("listCount DAO : "+listCount);
		return listCount;
	}

	// 환전 환불 검색 결과
	@Override
	public ArrayList<ExchangeMoneyAdmin> selectSearchExchangeMoneyAdminList(SqlSessionTemplate sqlSession, PageInfo pi,
			String status, String memberId, String memberType, String today, String startDate, String endDate)
			throws ExchangeMoneyException {
		
		ArrayList<ExchangeMoneyAdmin> list = null;
		
		int offset = (pi.getCurrentPage()-1)* pi.getLimit();			
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		Map<String, Object> hmap = new HashMap();

		hmap.put("status", status);
		hmap.put("memberId", memberId);
		hmap.put("memberType", memberType);
		hmap.put("today", today);
		hmap.put("startDate", startDate);
		hmap.put("endDate", endDate);
		
		list = (ArrayList)sqlSession.selectList("ExchangeMoneyAdmin.selectSearchExchangeMoneyAdminList", hmap, rowBounds);
		
		System.out.println("DAO list : "+list);

		return list;
	}

	// 반송사유 입력 완료 시 오일 +
	@Override
	public int updateAddOil(SqlSessionTemplate sqlSession, ExchangeMoneyAdmin em)
			throws ExchangeMoneyException {
		
		int result = sqlSession.update("ExchangeMoneyAdmin.updateAddOil", em);
		
		if(result<=0) {
			throw new ExchangeMoneyException("반송사유 입력 완료 시 오일 + 실패!");
		}
		return result;
	}

	// 승인버튼 (결제취소) - 환불진행중
	@Override
	public int insertConfirmRefundMoney(SqlSessionTemplate sqlSession, OilListAdmin oa) throws ExchangeMoneyException {
		
		int result = sqlSession.insert("ExchangeMoneyAdmin.insertConfirmRefundMoney", oa);
		
		if(result<=0) {
			throw new ExchangeMoneyException("반송사유 입력 완료 시 오일 + 실패!");
		}
		return result;
	}

	// 승인버튼 (환전) - 환전진행중
	@Override
	public int insertConfirmExchangeMoney(SqlSessionTemplate sqlSession, OilListAdmin oa)
			throws ExchangeMoneyException {
		
		int result = sqlSession.insert("ExchangeMoneyAdmin.insertConfirmExchangeMoney", oa);
		
		if(result<=0) {
			throw new ExchangeMoneyException("반송사유 입력 완료 시 오일 + 실패!");
		}
		return result;
	}

	// 반송버튼 (환불취소) - 환불진행중
	@Override
	public int insertCancelRefundMoney(SqlSessionTemplate sqlSession, OilListAdmin oa) throws ExchangeMoneyException {
		
		int result = sqlSession.insert("ExchangeMoneyAdmin.insertCancelRefundMoney", oa);
		
		if(result<=0) {
			throw new ExchangeMoneyException("반송사유 입력 완료 시 오일 + 실패!");
		}
		return result;
	}

	// 반송버튼 (환전취소) - 환전진행중
	@Override
	public int insertCancelExchangeMoney(SqlSessionTemplate sqlSession, OilListAdmin oa) throws ExchangeMoneyException {
		
		int result = sqlSession.insert("ExchangeMoneyAdmin.insertCancelExchangeMoney", oa);
		
		if(result<=0) {
			throw new ExchangeMoneyException("반송사유 입력 완료 시 오일 + 실패!");
		}
		return result;
	}


}
