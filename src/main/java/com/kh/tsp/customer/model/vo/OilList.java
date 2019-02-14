package com.kh.tsp.customer.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class OilList implements Serializable{
	private int oilListNo;		// 키값
	private String oilListType;	// 분류
	private Date oilListDate;	// 기록 날짜
	private int oil;			// 오일
	private int memberNo;		// 회원번호
	private String parkingNo;	// 주차장 번호
	private int resNo;			// 예약 번호
	private String paymentNo;	// 아임포트 번호
	private String transNo;		// 결제번호
	
	private String parkingName;	// 주차장 이름
	
	// 검색용 필드
	private Date startDate;
	private Date endDate;
	private String selectedListInfo;
	
	public OilList() {
		
	}

	public OilList(int oilListNo, String oilListType, Date oilListDate, int oil, int memberNo, String parkingNo,
			int resNo, String paymentNo, String transNo, String parkingName, Date startDate, Date endDate,
			String selectedListInfo) {
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
		this.parkingName = parkingName;
		this.startDate = startDate;
		this.endDate = endDate;
		this.selectedListInfo = selectedListInfo;
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

	public String getParkingName() {
		return parkingName;
	}

	public void setParkingName(String parkingName) {
		this.parkingName = parkingName;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getSelectedListInfo() {
		return selectedListInfo;
	}

	public void setSelectedListInfo(String selectedListInfo) {
		this.selectedListInfo = selectedListInfo;
	}

	@Override
	public String toString() {
		return "OilList [oilListNo=" + oilListNo + ", oilListType=" + oilListType + ", oilListDate=" + oilListDate
				+ ", oil=" + oil + ", memberNo=" + memberNo + ", parkingNo=" + parkingNo + ", resNo=" + resNo
				+ ", paymentNo=" + paymentNo + ", transNo=" + transNo + ", parkingName=" + parkingName + ", startDate="
				+ startDate + ", endDate=" + endDate + ", selectedListInfo=" + selectedListInfo + "]";
	}
	
}
