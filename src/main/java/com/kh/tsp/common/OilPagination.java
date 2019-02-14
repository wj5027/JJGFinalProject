package com.kh.tsp.common;

import com.kh.tsp.common.PageInfo;

public class OilPagination {

	public OilPagination() {}

	public static PageInfo getPageInfo(int currentPage, int listCount) {
		PageInfo pi = null;
		int limit = 50;
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
		pi = new PageInfo(listCount, currentPage, limit, startPage, endPage, maxPage);
		
		return pi;
	}

}
