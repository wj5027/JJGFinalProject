package com.kh.tsp.admin.model.vo;

import java.sql.Date;

public class ParkingListAdmin implements java.io.Serializable{
	private String parkingListNo;					// 주차장 관리 번호
	private String parkingListName;				// 주차장명
	private String parkingListOperateType;		// 주차장 구분
	private int parkingListParkingSize;				// 주차 구획수
	private String parkingListOpenDays;			// 운영요일
	private String parkingListWeekdayStime;	// 평일 운영 시작 시간
	private String parkingListWeekdayEtime;	// 평일 운영 종료 시간
	private String parkingListSatStime;			// 토요일 운영 시작 시간
	private String parkingListSatEtime;			// 토요일 운영 종료 시간
	private String parkingListHollydayStime;	// 공휴일 운영 시작 시간
	private String parkingListHollydayEtime;	// 공휴일 운용 종료 시간
	private String parkingListPriceInfo;			// 요금정보
	private int parkingListNtime;					// 주차장 기본시간
	private int parkingListNprice;					// 주차장 기본요금
	private int parkingListAtime;					// 추가 단위 시간
	private int parkingListAprice;					// 추가 단위 요금
	private String parkingListPayType;				// 결제 방법
	private String parkingListStatus;				// 상태 (default Y)
	private int memberNo;								// 회원 번호
	private String parkingNo;							// 주차장 번호
	private String parkingListReason;				// 반송 사유
	private Date modifyDate;							// 변경 날짜

	/* 주차장 테이블 */
	private String parkingType;						// 주차장 유형
	private String parkingAddress;					// 소재지 지번주소
	private String parkingRoadAddress;			// 소재지 도로명주소
	private String remarks;							// 특기사항
	private String parkingManagement;			// 관리 기관명
	private Date allianceDate;						// 신청날짜
	
	/* 사업자 테이블 */
	private String phone;								// 전화번호
	private String memberId;							// 회원 아이디
	
	public ParkingListAdmin() {
		super();
	}

	public ParkingListAdmin(String parkingListNo, String parkingListName, String parkingListOperateType,
			int parkingListParkingSize, String parkingListOpenDays, String parkingListWeekdayStime,
			String parkingListWeekdayEtime, String parkingListSatStime, String parkingListSatEtime,
			String parkingListHollydayStime, String parkingListHollydayEtime, String parkingListPriceInfo,
			int parkingListNtime, int parkingListNprice, int parkingListAtime, int parkingListAprice,
			String parkingListPayType, String parkingListStatus, int memberNo, String parkingNo,
			String parkingListReason, Date modifyDate, String parkingType, String parkingAddress,
			String parkingRoadAddress, String remarks, String parkingManagement, Date allianceDate, String phone,
			String memberId) {
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
		this.parkingListNtime = parkingListNtime;
		this.parkingListNprice = parkingListNprice;
		this.parkingListAtime = parkingListAtime;
		this.parkingListAprice = parkingListAprice;
		this.parkingListPayType = parkingListPayType;
		this.parkingListStatus = parkingListStatus;
		this.memberNo = memberNo;
		this.parkingNo = parkingNo;
		this.parkingListReason = parkingListReason;
		this.modifyDate = modifyDate;
		this.parkingType = parkingType;
		this.parkingAddress = parkingAddress;
		this.parkingRoadAddress = parkingRoadAddress;
		this.remarks = remarks;
		this.parkingManagement = parkingManagement;
		this.allianceDate = allianceDate;
		this.phone = phone;
		this.memberId = memberId;
	}

	public String getParkingListNo() {
		return parkingListNo;
	}

	public void setParkingListNo(String parkingListNo) {
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

	public int getParkingListNtime() {
		return parkingListNtime;
	}

	public void setParkingListNtime(int parkingListNtime) {
		this.parkingListNtime = parkingListNtime;
	}

	public int getParkingListNprice() {
		return parkingListNprice;
	}

	public void setParkingListNprice(int parkingListNprice) {
		this.parkingListNprice = parkingListNprice;
	}

	public int getParkingListAtime() {
		return parkingListAtime;
	}

	public void setParkingListAtime(int parkingListAtime) {
		this.parkingListAtime = parkingListAtime;
	}

	public int getParkingListAprice() {
		return parkingListAprice;
	}

	public void setParkingListAprice(int parkingListAprice) {
		this.parkingListAprice = parkingListAprice;
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

	public String getParkingType() {
		return parkingType;
	}

	public void setParkingType(String parkingType) {
		this.parkingType = parkingType;
	}

	public String getParkingAddress() {
		return parkingAddress;
	}

	public void setParkingAddress(String parkingAddress) {
		this.parkingAddress = parkingAddress;
	}

	public String getParkingRoadAddress() {
		return parkingRoadAddress;
	}

	public void setParkingRoadAddress(String parkingRoadAddress) {
		this.parkingRoadAddress = parkingRoadAddress;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getParkingManagement() {
		return parkingManagement;
	}

	public void setParkingManagement(String parkingManagement) {
		this.parkingManagement = parkingManagement;
	}

	public Date getAllianceDate() {
		return allianceDate;
	}

	public void setAllianceDate(Date allianceDate) {
		this.allianceDate = allianceDate;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "ParkingListAdmin [parkingListNo=" + parkingListNo + ", parkingListName=" + parkingListName
				+ ", parkingListOperateType=" + parkingListOperateType + ", parkingListParkingSize="
				+ parkingListParkingSize + ", parkingListOpenDays=" + parkingListOpenDays + ", parkingListWeekdayStime="
				+ parkingListWeekdayStime + ", parkingListWeekdayEtime=" + parkingListWeekdayEtime
				+ ", parkingListSatStime=" + parkingListSatStime + ", parkingListSatEtime=" + parkingListSatEtime
				+ ", parkingListHollydayStime=" + parkingListHollydayStime + ", parkingListHollydayEtime="
				+ parkingListHollydayEtime + ", parkingListPriceInfo=" + parkingListPriceInfo + ", parkingListNtime="
				+ parkingListNtime + ", parkingListNprice=" + parkingListNprice + ", parkingListAtime="
				+ parkingListAtime + ", parkingListAprice=" + parkingListAprice + ", parkingListPayType="
				+ parkingListPayType + ", parkingListStatus=" + parkingListStatus + ", memberNo=" + memberNo
				+ ", parkingNo=" + parkingNo + ", parkingListReason=" + parkingListReason + ", modifyDate=" + modifyDate
				+ ", parkingType=" + parkingType + ", parkingAddress=" + parkingAddress + ", parkingRoadAddress="
				+ parkingRoadAddress + ", remarks=" + remarks + ", parkingManagement=" + parkingManagement
				+ ", allianceDate=" + allianceDate + ", phone=" + phone + ", memberId=" + memberId + "]";
	}

	
	
}
