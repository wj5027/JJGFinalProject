package com.kh.tsp.parkingceo.model.service;

import com.kh.tsp.customer.model.vo.Member;
import com.kh.tsp.parkingceo.model.vo.ExchangeMoneyVo;

public interface ExchangeMoneyService {


	void insertExchangeMoney(ExchangeMoneyVo ev);

	void updateMemberExchangeMoney(ExchangeMoneyVo ev);

	Member selectCheckMember(Member m);

	void insertOilList(ExchangeMoneyVo ev);



}
