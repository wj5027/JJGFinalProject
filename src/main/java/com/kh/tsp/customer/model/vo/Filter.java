package com.kh.tsp.customer.model.vo;

public class Filter {
	
	private int fno;
	private String content;
	private String date;
	private String status;
	private String mno;
	
	public Filter() {}

	public Filter(int fno, String content, String date, String status, String mno) {
		super();
		this.fno = fno;
		this.content = content;
		this.date = date;
		this.status = status;
		this.mno = mno;
	}

	public int getFno() {
		return fno;
	}

	public void setFno(int fno) {
		this.fno = fno;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getMno() {
		return mno;
	}

	public void setMno(String mno) {
		this.mno = mno;
	}

	@Override
	public String toString() {
		return "Filter [fno=" + fno + ", content=" + content + ", date=" + date + ", status=" + status + ", mno=" + mno
				+ "]";
	}
	
	
	
}
