package com.kh.tsp.parkingceo.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.tsp.customer.model.vo.Member;
import com.kh.tsp.parkingceo.model.vo.PromotionVo;

public interface PromotionService {

	ArrayList<HashMap<String, Object>> selectCurrentParkingList(Member m);

	void insertPromotion(PromotionVo pv);



	

}
