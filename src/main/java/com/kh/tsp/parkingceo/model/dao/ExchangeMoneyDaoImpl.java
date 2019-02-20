package com.kh.tsp.parkingceo.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.tsp.customer.model.vo.Member;
import com.kh.tsp.parkingceo.model.vo.ExchangeMoneyVo;

@Repository
public class ExchangeMoneyDaoImpl implements ExchangeMoneyDao{

	public ExchangeMoneyDaoImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public void insertExchangeMoney(SqlSessionTemplate sqlSession, ExchangeMoneyVo ev) {
		sqlSession.insert("ExchangeMoney.insertExchangeMoney", ev);
	}

	@Override
	public void updateMemberExchangeMoney(SqlSessionTemplate sqlSession, ExchangeMoneyVo ev) {
		sqlSession.update("ExchangeMoney.updateMemberExchangeMoney", ev);
	}

	@Override
	public Member selectCheckMeber(SqlSessionTemplate sqlSession, Member m) {
		Member loginUser = sqlSession.selectOne("Member.selectCheckMember", m);
		return loginUser;
	}

	@Override
	public void insertOilList(SqlSessionTemplate sqlSession, ExchangeMoneyVo ev) {
		sqlSession.insert("ExchangeMoney.insertOilList", ev);
	}



}
