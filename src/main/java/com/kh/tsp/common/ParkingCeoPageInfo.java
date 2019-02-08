package com.kh.tsp.common;

import java.io.Serializable;

public class ParkingCeoPageInfo implements Serializable {
	
	private int listCount;
	private int currentPage;
	private int limit;
	private int startPage;
	private int endPage;
	private int maxPage;
	private int btnValue;
	
	public ParkingCeoPageInfo() {}

	public ParkingCeoPageInfo(int listCount, int currentPage, int limit, int startPage, int endPage, int maxPage,
			int btnValue) {
		super();
		this.listCount = listCount;
		this.currentPage = currentPage;
		this.limit = limit;
		this.startPage = startPage;
		this.endPage = endPage;
		this.maxPage = maxPage;
		this.btnValue = btnValue;
	}
	
	

	public ParkingCeoPageInfo(int listCount, int currentPage, int limit, int startPage, int endPage, int maxPage) {
		super();
		this.listCount = listCount;
		this.currentPage = currentPage;
		this.limit = limit;
		this.startPage = startPage;
		this.endPage = endPage;
		this.maxPage = maxPage;
	}

	@Override
	public String toString() {
		return "ParkingCeoPageInfo [listCount=" + listCount + ", currentPage=" + currentPage + ", limit=" + limit
				+ ", startPage=" + startPage + ", endPage=" + endPage + ", maxPage=" + maxPage + ", btnValue="
				+ btnValue + "]";
	}

	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	public int getBtnValue() {
		return btnValue;
	}

	public void setBtnValue(int btnValue) {
		this.btnValue = btnValue;
	}
	
	


}
