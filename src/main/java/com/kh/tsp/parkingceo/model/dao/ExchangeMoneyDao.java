package com.kh.tsp.parkingceo.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.tsp.customer.model.vo.Member;
import com.kh.tsp.parkingceo.model.vo.ExchangeMoneyVo;

public interface ExchangeMoneyDao {

	void insertExchangeMoney(SqlSessionTemplate sqlSession, ExchangeMoneyVo ev);

	void updateMemberExchangeMoney(SqlSessionTemplate sqlSession, ExchangeMoneyVo ev);

	Member selectCheckMeber(SqlSessionTemplate sqlSession, Member m);

	void insertOilList(SqlSessionTemplate sqlSession, ExchangeMoneyVo ev);



}
