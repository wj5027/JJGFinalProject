package com.kh.tsp.admin.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class OilListAdmin implements Serializable{
	private int oilListNo;				// 키값
	private String oilListType;		// 분류
	private Date oilListDate;			// 기록 날짜
	private int oil;						// 오일
	private int memberNo;				// 회원번호
	private String parkingNo;			// 주차장 번호
	private int resNo;					// 예약 번호
	private String paymentNo;		// 아임포트 번호
	private String transNo;			// 결제번호
	
	private String memberId;			// 회원 아이디
	private String memeberName;	// 회원 이름
	
	private String parkingName;		// 주차장 이름

	public OilListAdmin() {
		super();
	}

	public OilListAdmin(int oilListNo, String oilListType, Date oilListDate, int oil, int memberNo, String parkingNo,
			int resNo, String paymentNo, String transNo, String memberId, String memeberName, String parkingName) {
		super();
		this.oilListNo = oilListNo;
		this.oilListType = oilListType;
		this.oilListDate = oilListDate;
		this.oil = oil;
		this.memberNo = memberNo;
		this.parkingNo = parkingNo;
		this.resNo = resNo;
		this.paymentNo = paymentNo;
		this.transNo = transNo;
		this.memberId = memberId;
		this.memeberName = memeberName;
		this.parkingName = parkingName;
	}

	public int getOilListNo() {
		return oilListNo;
	}

	public void setOilListNo(int oilListNo) {
		this.oilListNo = oilListNo;
	}

	public String getOilListType() {
		return oilListType;
	}

	public void setOilListType(String oilListType) {
		this.oilListType = oilListType;
	}

	public Date getOilListDate() {
		return oilListDate;
	}

	public void setOilListDate(Date oilListDate) {
		this.oilListDate = oilListDate;
	}

	public int getOil() {
		return oil;
	}

	public void setOil(int oil) {
		this.oil = oil;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getParkingNo() {
		return parkingNo;
	}

	public void setParkingNo(String parkingNo) {
		this.parkingNo = parkingNo;
	}

	public int getResNo() {
		return resNo;
	}

	public void setResNo(int resNo) {
		this.resNo = resNo;
	}

	public String getPaymentNo() {
		return paymentNo;
	}

	public void setPaymentNo(String paymentNo) {
		this.paymentNo = paymentNo;
	}

	public String getTransNo() {
		return transNo;
	}

	public void setTransNo(String transNo) {
		this.transNo = transNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemeberName() {
		return memeberName;
	}

	public void setMemeberName(String memeberName) {
		this.memeberName = memeberName;
	}

	public String getParkingName() {
		return parkingName;
	}

	public void setParkingName(String parkingName) {
		this.parkingName = parkingName;
	}

	@Override
	public String toString() {
		return "OilListAdmin [oilListNo=" + oilListNo + ", oilListType=" + oilListType + ", oilListDate=" + oilListDate
				+ ", oil=" + oil + ", memberNo=" + memberNo + ", parkingNo=" + parkingNo + ", resNo=" + resNo
				+ ", paymentNo=" + paymentNo + ", transNo=" + transNo + ", memberId=" + memberId + ", memeberName="
				+ memeberName + ", parkingName=" + parkingName + "]";
	}

}
