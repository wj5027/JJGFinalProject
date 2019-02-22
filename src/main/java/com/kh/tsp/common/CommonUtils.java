package com.kh.tsp.common;

import java.util.UUID;

public class CommonUtils {

	public CommonUtils() {
		// TODO Auto-generated constructor stub헤헤ㅔ헤
	}
	
	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}

}
