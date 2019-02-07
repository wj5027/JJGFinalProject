package com.kh.tsp.customer.model.service;

import java.util.ArrayList;

import com.kh.tsp.customer.model.vo.Member;
import com.kh.tsp.customer.model.vo.Parking;

public interface CustomerMainService {

	Member selectCheckMember(Member m);

	ArrayList<Parking> getnearParkings();
	

}
