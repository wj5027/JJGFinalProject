package com.kh.tsp.admin.model.vo;

import java.sql.Date;

public class Filter implements java.io.Serializable{
	private int bFilterNo;		// 필터 번호
	private String fContent;	// 필터 내용
	private Date fDate;			// 등록일
	private String fStatus;		// 상태 (Y,N)
	private int memberNo;		// 작성자
	
	public Filter() {}

	public Filter(int bFilterNo, String fContent, Date fDate, String fStatus, int memberNo) {
		super();
		this.bFilterNo = bFilterNo;
		this.fContent = fContent;
		this.fDate = fDate;
		this.fStatus = fStatus;
		this.memberNo = memberNo;
	}

	public int getbFilterNo() {
		return bFilterNo;
	}

	public void setbFilterNo(int bFilterNo) {
		this.bFilterNo = bFilterNo;
	}

	public String getfContent() {
		return fContent;
	}

	public void setfContent(String fContent) {
		this.fContent = fContent;
	}

	public Date getfDate() {
		return fDate;
	}

	public void setfDate(Date fDate) {
		this.fDate = fDate;
	}

	public String getfStatus() {
		return fStatus;
	}

	public void setfStatus(String fStatus) {
		this.fStatus = fStatus;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	@Override
	public String toString() {
		return "Filter [bFilterNo=" + bFilterNo + ", fContent=" + fContent + ", fDate=" + fDate + ", fStatus=" + fStatus
				+ ", memberNo=" + memberNo + "]";
	}

}
