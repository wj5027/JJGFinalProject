package com.kh.tsp.customer.model.vo;

import java.sql.Date;

public class Reply implements java.io.Serializable{
	
	private int replyNo;		// 답변 번호
	private String context;		// 내용
	private Date replyDate;		// 작성날짜
	private String cancelYN;	// 삭제여부
	private String modifyYN;	// 수정여부
	private int boardNo;		// 게시물 번호
	private String memberNo;		// 회원 번호
	private int reCnt;
	
	
	public Reply() {}



	public Reply(int replyNo, String context, Date replyDate, String cancelYN, String modifyYN, int boardNo,
			String memberNo) {
		super();
		this.replyNo = replyNo;
		this.context = context;
		this.replyDate = replyDate;
		this.cancelYN = cancelYN;
		this.modifyYN = modifyYN;
		this.boardNo = boardNo;
		this.memberNo = memberNo;
	}



	public int getReplyNo() {
		return replyNo;
	}



	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}



	public String getContext() {
		return context;
	}



	public void setContext(String context) {
		this.context = context;
	}



	public Date getReplyDate() {
		return replyDate;
	}



	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}



	public String getCancelYN() {
		return cancelYN;
	}



	public void setCancelYN(String cancelYN) {
		this.cancelYN = cancelYN;
	}



	public String getModifyYN() {
		return modifyYN;
	}



	public void setModifyYN(String modifyYN) {
		this.modifyYN = modifyYN;
	}



	public int getBoardNo() {
		return boardNo;
	}



	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}



	public String getMemberNo() {
		return memberNo;
	}



	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}



	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", context=" + context + ", replyDate=" + replyDate + ", cancelYN="
				+ cancelYN + ", modifyYN=" + modifyYN + ", boardNo=" + boardNo + ", memberNo=" + memberNo + "]";
	}


	
	

	
	
	
}
