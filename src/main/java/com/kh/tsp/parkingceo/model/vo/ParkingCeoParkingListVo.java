package com.kh.tsp.parkingceo.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class ParkingCeoParkingListVo implements Serializable {
	
	
	private int parkingListNo;
	private String parkingListName;
	private String parkingListOperateType;
	private int parkingListParkingSize;
	private String parkingListOpenDays;
	private String parkingListWeekdayStime;
	private String parkingListWeekdayEtime;
	private String parkingListSatStime;
	private String parkingListSatEtime;
	private String parkingListHollydayStime;
	private String parkingListHollydayEtime;
	private String parkingListPriceInfo;					
	private int parkingListParkingNtime;				
	private int parkingListParkingNprice;					
	private int parkingListParkingAtime;					
	private int parkingListParkingAprice;					
	private String parkingListPayType;	
	private String parkingListStatus;
	private int memberNo;
	private String parkingNo;
	private String parkingListReason;
	private Date modifyDate;
	

	public ParkingCeoParkingListVo() {
		super();
	}


	public ParkingCeoParkingListVo(int parkingListNo, String parkingListName, String parkingListOperateType,
			int parkingListParkingSize, String parkingListOpenDays, String parkingListWeekdayStime,
			String parkingListWeekdayEtime, String parkingListSatStime, String parkingListSatEtime,
			String parkingListHollydayStime, String parkingListHollydayEtime, String parkingListPriceInfo,
			int parkingListParkingNtime, int parkingListParkingNprice, int parkingListParkingAtime,
			int parkingListParkingAprice, String parkingListPayType, String parkingListStatus, int memberNo,
			String parkingNo, String parkingListReason, Date modifyDate) {
		super();
		this.parkingListNo = parkingListNo;
		this.parkingListName = parkingListName;
		this.parkingListOperateType = parkingListOperateType;
		this.parkingListParkingSize = parkingListParkingSize;
		this.parkingListOpenDays = parkingListOpenDays;
		this.parkingListWeekdayStime = parkingListWeekdayStime;
		this.parkingListWeekdayEtime = parkingListWeekdayEtime;
		this.parkingListSatStime = parkingListSatStime;
		this.parkingListSatEtime = parkingListSatEtime;
		this.parkingListHollydayStime = parkingListHollydayStime;
		this.parkingListHollydayEtime = parkingListHollydayEtime;
		this.parkingListPriceInfo = parkingListPriceInfo;
		this.parkingListParkingNtime = parkingListParkingNtime;
		this.parkingListParkingNprice = parkingListParkingNprice;
		this.parkingListParkingAtime = parkingListParkingAtime;
		this.parkingListParkingAprice = parkingListParkingAprice;
		this.parkingListPayType = parkingListPayType;
		this.parkingListStatus = parkingListStatus;
		this.memberNo = memberNo;
		this.parkingNo = parkingNo;
		this.parkingListReason = parkingListReason;
		this.modifyDate = modifyDate;
	}


	@Override
	public String toString() {
		return "ParkingCeoParkingListVo [parkingListNo=" + parkingListNo + ", parkingListName=" + parkingListName
				+ ", parkingListOperateType=" + parkingListOperateType + ", parkingListParkingSize="
				+ parkingListParkingSize + ", parkingListOpenDays=" + parkingListOpenDays + ", parkingListWeekdayStime="
				+ parkingListWeekdayStime + ", parkingListWeekdayEtime=" + parkingListWeekdayEtime
				+ ", parkingListSatStime=" + parkingListSatStime + ", parkingListSatEtime=" + parkingListSatEtime
				+ ", parkingListHollydayStime=" + parkingListHollydayStime + ", parkingListHollydayEtime="
				+ parkingListHollydayEtime + ", parkingListPriceInfo=" + parkingListPriceInfo
				+ ", parkingListParkingNtime=" + parkingListParkingNtime + ", parkingListParkingNprice="
				+ parkingListParkingNprice + ", parkingListParkingAtime=" + parkingListParkingAtime
				+ ", parkingListParkingAprice=" + parkingListParkingAprice + ", parkingListPayType="
				+ parkingListPayType + ", parkingListStatus=" + parkingListStatus + ", memberNo=" + memberNo
				+ ", parkingNo=" + parkingNo + ", parkingListReason=" + parkingListReason + ", modifyDate=" + modifyDate
				+ "]";
	}


	public int getParkingListNo() {
		return parkingListNo;
	}


	public void setParkingListNo(int parkingListNo) {
		this.parkingListNo = parkingListNo;
	}


	public String getParkingListName() {
		return parkingListName;
	}


	public void setParkingListName(String parkingListName) {
		this.parkingListName = parkingListName;
	}


	public String getParkingListOperateType() {
		return parkingListOperateType;
	}


	public void setParkingListOperateType(String parkingListOperateType) {
		this.parkingListOperateType = parkingListOperateType;
	}


	public int getParkingListParkingSize() {
		return parkingListParkingSize;
	}


	public void setParkingListParkingSize(int parkingListParkingSize) {
		this.parkingListParkingSize = parkingListParkingSize;
	}


	public String getParkingListOpenDays() {
		return parkingListOpenDays;
	}


	public void setParkingListOpenDays(String parkingListOpenDays) {
		this.parkingListOpenDays = parkingListOpenDays;
	}


	public String getParkingListWeekdayStime() {
		return parkingListWeekdayStime;
	}


	public void setParkingListWeekdayStime(String parkingListWeekdayStime) {
		this.parkingListWeekdayStime = parkingListWeekdayStime;
	}


	public String getParkingListWeekdayEtime() {
		return parkingListWeekdayEtime;
	}


	public void setParkingListWeekdayEtime(String parkingListWeekdayEtime) {
		this.parkingListWeekdayEtime = parkingListWeekdayEtime;
	}


	public String getParkingListSatStime() {
		return parkingListSatStime;
	}


	public void setParkingListSatStime(String parkingListSatStime) {
		this.parkingListSatStime = parkingListSatStime;
	}


	public String getParkingListSatEtime() {
		return parkingListSatEtime;
	}


	public void setParkingListSatEtime(String parkingListSatEtime) {
		this.parkingListSatEtime = parkingListSatEtime;
	}


	public String getParkingListHollydayStime() {
		return parkingListHollydayStime;
	}


	public void setParkingListHollydayStime(String parkingListHollydayStime) {
		this.parkingListHollydayStime = parkingListHollydayStime;
	}


	public String getParkingListHollydayEtime() {
		return parkingListHollydayEtime;
	}


	public void setParkingListHollydayEtime(String parkingListHollydayEtime) {
		this.parkingListHollydayEtime = parkingListHollydayEtime;
	}


	public String getParkingListPriceInfo() {
		return parkingListPriceInfo;
	}


	public void setParkingListPriceInfo(String parkingListPriceInfo) {
		this.parkingListPriceInfo = parkingListPriceInfo;
	}


	public int getParkingListParkingNtime() {
		return parkingListParkingNtime;
	}


	public void setParkingListParkingNtime(int parkingListParkingNtime) {
		this.parkingListParkingNtime = parkingListParkingNtime;
	}


	public int getParkingListParkingNprice() {
		return parkingListParkingNprice;
	}


	public void setParkingListParkingNprice(int parkingListParkingNprice) {
		this.parkingListParkingNprice = parkingListParkingNprice;
	}


	public int getParkingListParkingAtime() {
		return parkingListParkingAtime;
	}


	public void setParkingListParkingAtime(int parkingListParkingAtime) {
		this.parkingListParkingAtime = parkingListParkingAtime;
	}


	public int getParkingListParkingAprice() {
		return parkingListParkingAprice;
	}


	public void setParkingListParkingAprice(int parkingListParkingAprice) {
		this.parkingListParkingAprice = parkingListParkingAprice;
	}


	public String getParkingListPayType() {
		return parkingListPayType;
	}


	public void setParkingListPayType(String parkingListPayType) {
		this.parkingListPayType = parkingListPayType;
	}


	public String getParkingListStatus() {
		return parkingListStatus;
	}


	public void setParkingListStatus(String parkingListStatus) {
		this.parkingListStatus = parkingListStatus;
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


	public String getParkingListReason() {
		return parkingListReason;
	}


	public void setParkingListReason(String parkingListReason) {
		this.parkingListReason = parkingListReason;
	}


	public Date getModifyDate() {
		return modifyDate;
	}


	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	
	
	
	

}
