package com.kh.tsp.common;

public class ParkingCeoPagination {

	public ParkingCeoPagination() {}

	public static ParkingCeoPageInfo getPageInfo(int currentPage, int listCount) {
		ParkingCeoPageInfo pi = null;
		int limit = 10;
		int buttonCount = 10;
		int maxPage = 0;
		int startPage = 0;
		int endPage = 0;
		
		maxPage = (int)((double)listCount/limit +0.9);
		startPage = (((int)((double)currentPage/buttonCount+0.9))-1) *buttonCount+1;
		endPage = startPage + buttonCount - 1;
		if( maxPage < endPage) {
			endPage = maxPage;
		}
		pi = new ParkingCeoPageInfo(listCount, currentPage, limit, startPage, endPage, maxPage);
		
		return pi;
	}

}
