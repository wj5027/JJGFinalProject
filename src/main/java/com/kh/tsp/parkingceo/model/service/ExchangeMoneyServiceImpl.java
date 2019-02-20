package com.kh.tsp.parkingceo.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tsp.customer.model.vo.Member;
import com.kh.tsp.parkingceo.model.dao.ExchangeMoneyDao;
import com.kh.tsp.parkingceo.model.vo.ExchangeMoneyVo;

@Service
public class ExchangeMoneyServiceImpl implements ExchangeMoneyService {
	
	@Autowired
	private ExchangeMoneyDao emd;
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ExchangeMoneyServiceImpl()  {
		// TODO Auto-generated constructor stub
	}

	@Override
	public void insertExchangeMoney(ExchangeMoneyVo ev) {
		emd.insertExchangeMoney(sqlSession,ev);
	}

	@Override
	public void updateMemberExchangeMoney(ExchangeMoneyVo ev) {
		emd.updateMemberExchangeMoney(sqlSession,ev);
	}

	@Override
	public Member selectCheckMember(Member m) {
		 Member loginUser = emd.selectCheckMeber(sqlSession,m);
		return loginUser;
	}

	@Override
	public void insertOilList(ExchangeMoneyVo ev) {
		emd.insertOilList(sqlSession,ev);
	}



	

}
