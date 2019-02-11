package com.kh.tsp.customer.model.vo;

import java.sql.Date;

public class Board implements java.io.Serializable{
	
	private int bno;
	private String bTitle;
	private String bContext;
	private int bViews;
	private Date createDate;
	private Date modifyDate;
	private String bType;
	private String status;
	private String mno;
	private String pno;
	private String mId;
	private String cancelYN;
	private String replyContext;
	
	public Board() {}

	public Board(int bno, String bTitle, String bContext, int bViews, Date createDate, Date modifyDate, String bType,
			String status, String mno, String pno, String mId, String cancelYN, String replyContext) {
		super();
		this.bno = bno;
		this.bTitle = bTitle;
		this.bContext = bContext;
		this.bViews = bViews;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.bType = bType;
		this.status = status;
		this.mno = mno;
		this.pno = pno;
		this.mId = mId;
		this.cancelYN = cancelYN;
		this.replyContext = replyContext;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getbContext() {
		return bContext;
	}

	public void setbContext(String bContext) {
		this.bContext = bContext;
	}

	public int getbViews() {
		return bViews;
	}

	public void setbViews(int bViews) {
		this.bViews = bViews;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getbType() {
		return bType;
	}

	public void setbType(String bType) {
		this.bType = bType;
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

	public String getPno() {
		return pno;
	}

	public void setPno(String pno) {
		this.pno = pno;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getCancelYN() {
		return cancelYN;
	}

	public void setCancelYN(String cancelYN) {
		this.cancelYN = cancelYN;
	}

	public String getReplyContext() {
		return replyContext;
	}

	public void setReplyContext(String replyContext) {
		this.replyContext = replyContext;
	}

	@Override
	public String toString() {
		return "Board [bno=" + bno + ", bTitle=" + bTitle + ", bContext=" + bContext + ", bViews=" + bViews
				+ ", createDate=" + createDate + ", modifyDate=" + modifyDate + ", bType=" + bType + ", status="
				+ status + ", mno=" + mno + ", pno=" + pno + ", mId=" + mId + ", cancelYN=" + cancelYN
				+ ", replyContext=" + replyContext + "]";
	}

	
}
