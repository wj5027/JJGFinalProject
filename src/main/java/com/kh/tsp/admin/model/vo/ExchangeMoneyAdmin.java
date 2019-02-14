package com.kh.tsp.admin.model.vo;

import java.sql.Date;

public class ExchangeMoneyAdmin implements java.io.Serializable{
	private int exchangeNo;							// 내역번호
	private String status;								// 상태 (환전진행중, 환불진행중, 승인, 반송)
	private int oil;										// 오일 (포인트)
	private int cash;										// 환전/환불 액수
	private Date applicationDate;					// 신청날짜
	private Date approvalDate;						// 승인날짜
	private int memberNo;								// 회원 번호
	private String cancelReason;					// 반송 사유
	private String accountHolder;					// 예금주
	private String applicationBank;					// 은행명
	private String applicationAccountNumber;	// 계좌번호

	private String memberType;					// 회원 구분	
	private String memberId;						// 회원 아이디	

	public ExchangeMoneyAdmin() {}

	public ExchangeMoneyAdmin(int exchangeNo, String status, int oil, int cash, Date applicationDate, Date approvalDate,
			int memberNo, String cancelReason, String accountHolder, String applicationBank,
			String applicationAccountNumber, String memberType, String memberId) {
		super();
		this.exchangeNo = exchangeNo;
		this.status = status;
		this.oil = oil;
		this.cash = cash;
		this.applicationDate = applicationDate;
		this.approvalDate = approvalDate;
		this.memberNo = memberNo;
		this.cancelReason = cancelReason;
		this.accountHolder = accountHolder;
		this.applicationBank = applicationBank;
		this.applicationAccountNumber = applicationAccountNumber;
		this.memberType = memberType;
		this.memberId = memberId;
	}

	public int getExchangeNo() {
		return exchangeNo;
	}

	public void setExchangeNo(int exchangeNo) {
		this.exchangeNo = exchangeNo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getOil() {
		return oil;
	}

	public void setOil(int oil) {
		this.oil = oil;
	}

	public int getCash() {
		return cash;
	}

	public void setCash(int cash) {
		this.cash = cash;
	}

	public Date getApplicationDate() {
		return applicationDate;
	}

	public void setApplicationDate(Date applicationDate) {
		this.applicationDate = applicationDate;
	}

	public Date getApprovalDate() {
		return approvalDate;
	}

	public void setApprovalDate(Date approvalDate) {
		this.approvalDate = approvalDate;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getCancelReason() {
		return cancelReason;
	}

	public void setCancelReason(String cancelReason) {
		this.cancelReason = cancelReason;
	}

	public String getAccountHolder() {
		return accountHolder;
	}

	public void setAccountHolder(String accountHolder) {
		this.accountHolder = accountHolder;
	}

	public String getApplicationBank() {
		return applicationBank;
	}

	public void setApplicationBank(String applicationBank) {
		this.applicationBank = applicationBank;
	}

	public String getApplicationAccountNumber() {
		return applicationAccountNumber;
	}

	public void setApplicationAccountNumber(String applicationAccountNumber) {
		this.applicationAccountNumber = applicationAccountNumber;
	}

	public String getMemberType() {
		return memberType;
	}

	public void setMemberType(String memberType) {
		this.memberType = memberType;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "ExchangeMoneyAdmin [exchangeNo=" + exchangeNo + ", status=" + status + ", oil=" + oil + ", cash=" + cash
				+ ", applicationDate=" + applicationDate + ", approvalDate=" + approvalDate + ", memberNo=" + memberNo
				+ ", cancelReason=" + cancelReason + ", accountHolder=" + accountHolder + ", applicationBank="
				+ applicationBank + ", applicationAccountNumber=" + applicationAccountNumber + ", memberType="
				+ memberType + ", memberId=" + memberId + "]";
	}

}
