package com.kh.tsp.customer.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.tsp.customer.model.vo.Member;
import com.kh.tsp.customer.model.vo.Parking;

public interface CustomerMainService {

	Member selectCheckMember(Member m);

	ArrayList<Parking> getnearParkings();

	HashMap<Integer, Parking> searchVoiceParking(String keyword, String type);
	

}
