package com.kh.tsp.customer.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Reservation implements Serializable {
	private int rnum;
	private int resNo;
	private Date resApplyDate;
	private Date resDate;
	private String status;
	private int memberNo;
	private String parkingNo;
	private String parkingName;
	private String cancelReason;
	private String carNo;
	private String reserveTime;
	
	private String stringResDate;
	
	public Reservation() {
		
	}

	public Reservation(int rnum, int resNo, Date resApplyDate, Date resDate, String status, int memberNo,
			String parkingNo, String parkingName, String cancelReason, String carNo, String reserveTime,
			String stringResDate) {
		super();
		this.rnum = rnum;
		this.resNo = resNo;
		this.resApplyDate = resApplyDate;
		this.resDate = resDate;
		this.status = status;
		this.memberNo = memberNo;
		this.parkingNo = parkingNo;
		this.parkingName = parkingName;
		this.cancelReason = cancelReason;
		this.carNo = carNo;
		this.reserveTime = reserveTime;
		this.stringResDate = stringResDate;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public int getResNo() {
		return resNo;
	}

	public void setResNo(int resNo) {
		this.resNo = resNo;
	}

	public Date getResApplyDate() {
		return resApplyDate;
	}

	public void setResApplyDate(Date resApplyDate) {
		this.resApplyDate = resApplyDate;
	}

	public Date getResDate() {
		return resDate;
	}

	public void setResDate(Date resDate) {
		this.resDate = resDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
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

	public String getParkingName() {
		return parkingName;
	}

	public void setParkingName(String parkingName) {
		this.parkingName = parkingName;
	}

	public String getCancelReason() {
		return cancelReason;
	}

	public void setCancelReason(String cancelReason) {
		this.cancelReason = cancelReason;
	}

	public String getCarNo() {
		return carNo;
	}

	public void setCarNo(String carNo) {
		this.carNo = carNo;
	}

	public String getReserveTime() {
		return reserveTime;
	}

	public void setReserveTime(String reserveTime) {
		this.reserveTime = reserveTime;
	}

	public String getStringResDate() {
		return stringResDate;
	}

	public void setStringResDate(String stringResDate) {
		this.stringResDate = stringResDate;
	}

	@Override
	public String toString() {
		return "Reservation [rnum=" + rnum + ", resNo=" + resNo + ", resApplyDate=" + resApplyDate + ", resDate="
				+ resDate + ", status=" + status + ", memberNo=" + memberNo + ", parkingNo=" + parkingNo
				+ ", parkingName=" + parkingName + ", cancelReason=" + cancelReason + ", carNo=" + carNo
				+ ", reserveTime=" + reserveTime + ", stringResDate=" + stringResDate + "]";
	}
	
}
