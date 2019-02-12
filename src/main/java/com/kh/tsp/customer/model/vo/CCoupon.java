package com.kh.tsp.customer.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class CCoupon implements Serializable{
	// Coupon Request List Table
	private int couponReqNo;          // 신청번호 (KEY값)
	private String couponName;         // 쿠폰명
	private String couponType;         // 분류
	private Date couponStartDate;      // 시작날짜
	private Date couponEndDate;      // 종료날짜
	private int amount;                  // 수량(개수)
	private String remark;               // 비고
	private int businessMemberNo;               // 회원번호(사업자)
	private String parkingNo;            // 주차장 관리번호
	private String refuseReason;      // 반송사유
	private int couponOdiscount;      // 할인금액 (오일할인)
	private double couponPdiscount;      // 할인율 (퍼센트할인)
	private String couponReqStatus;   // 상태('신청중','반송','발급완료')
	
	// Coupon Table
	private int couponNo;          // 쿠폰 번호
	private Date createDate;       // 발급 날짜
	private String couponStatus;   // 상태
	
	// Coupon Create Table
	private int couponCRNo;        // 발급 이력 번호
	private int userMemberNo;      // 회원번호(일반 유저)
	private Date userDate;         // 사용 날짜
	private String userYN;         // 사용 여부
	
	// 그 외 값들
	private String parkingName;         // 주차장명
	private String memberId;            // 회원아이디
	private String startDay;			// 시작일 문자열
	private String endDay;				// 종료일 문자열
	
	public CCoupon() {
		
	}

	public CCoupon(int couponReqNo, String couponName, String couponType, Date couponStartDate, Date couponEndDate,
			int amount, String remark, int businessMemberNo, String parkingNo, String refuseReason, int couponOdiscount,
			double couponPdiscount, String couponReqStatus, int couponNo, Date createDate, String couponStatus,
			int couponCRNo, int userMemberNo, Date userDate, String userYN, String parkingName, String memberId,
			String startDay, String endDay) {
		super();
		this.couponReqNo = couponReqNo;
		this.couponName = couponName;
		this.couponType = couponType;
		this.couponStartDate = couponStartDate;
		this.couponEndDate = couponEndDate;
		this.amount = amount;
		this.remark = remark;
		this.businessMemberNo = businessMemberNo;
		this.parkingNo = parkingNo;
		this.refuseReason = refuseReason;
		this.couponOdiscount = couponOdiscount;
		this.couponPdiscount = couponPdiscount;
		this.couponReqStatus = couponReqStatus;
		this.couponNo = couponNo;
		this.createDate = createDate;
		this.couponStatus = couponStatus;
		this.couponCRNo = couponCRNo;
		this.userMemberNo = userMemberNo;
		this.userDate = userDate;
		this.userYN = userYN;
		this.parkingName = parkingName;
		this.memberId = memberId;
		this.startDay = startDay;
		this.endDay = endDay;
	}

	public int getCouponReqNo() {
		return couponReqNo;
	}

	public void setCouponReqNo(int couponReqNo) {
		this.couponReqNo = couponReqNo;
	}

	public String getCouponName() {
		return couponName;
	}

	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}

	public String getCouponType() {
		return couponType;
	}

	public void setCouponType(String couponType) {
		this.couponType = couponType;
	}

	public Date getCouponStartDate() {
		return couponStartDate;
	}

	public void setCouponStartDate(Date couponStartDate) {
		this.couponStartDate = couponStartDate;
	}

	public Date getCouponEndDate() {
		return couponEndDate;
	}

	public void setCouponEndDate(Date couponEndDate) {
		this.couponEndDate = couponEndDate;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public int getBusinessMemberNo() {
		return businessMemberNo;
	}

	public void setBusinessMemberNo(int businessMemberNo) {
		this.businessMemberNo = businessMemberNo;
	}

	public String getParkingNo() {
		return parkingNo;
	}

	public void setParkingNo(String parkingNo) {
		this.parkingNo = parkingNo;
	}

	public String getRefuseReason() {
		return refuseReason;
	}

	public void setRefuseReason(String refuseReason) {
		this.refuseReason = refuseReason;
	}

	public int getCouponOdiscount() {
		return couponOdiscount;
	}

	public void setCouponOdiscount(int couponOdiscount) {
		this.couponOdiscount = couponOdiscount;
	}

	public double getCouponPdiscount() {
		return couponPdiscount;
	}

	public void setCouponPdiscount(double couponPdiscount) {
		this.couponPdiscount = couponPdiscount;
	}

	public String getCouponReqStatus() {
		return couponReqStatus;
	}

	public void setCouponReqStatus(String couponReqStatus) {
		this.couponReqStatus = couponReqStatus;
	}

	public int getCouponNo() {
		return couponNo;
	}

	public void setCouponNo(int couponNo) {
		this.couponNo = couponNo;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getCouponStatus() {
		return couponStatus;
	}

	public void setCouponStatus(String couponStatus) {
		this.couponStatus = couponStatus;
	}

	public int getCouponCRNo() {
		return couponCRNo;
	}

	public void setCouponCRNo(int couponCRNo) {
		this.couponCRNo = couponCRNo;
	}

	public int getUserMemberNo() {
		return userMemberNo;
	}

	public void setUserMemberNo(int userMemberNo) {
		this.userMemberNo = userMemberNo;
	}

	public Date getUserDate() {
		return userDate;
	}

	public void setUserDate(Date userDate) {
		this.userDate = userDate;
	}

	public String getUserYN() {
		return userYN;
	}

	public void setUserYN(String userYN) {
		this.userYN = userYN;
	}

	public String getParkingName() {
		return parkingName;
	}

	public void setParkingName(String parkingName) {
		this.parkingName = parkingName;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getStartDay() {
		return startDay;
	}

	public void setStartDay(String startDay) {
		this.startDay = startDay;
	}

	public String getEndDay() {
		return endDay;
	}

	public void setEndDay(String endDay) {
		this.endDay = endDay;
	}

	@Override
	public String toString() {
		return "CCoupon [couponReqNo=" + couponReqNo + ", couponName=" + couponName + ", couponType=" + couponType
				+ ", couponStartDate=" + couponStartDate + ", couponEndDate=" + couponEndDate + ", amount=" + amount
				+ ", remark=" + remark + ", businessMemberNo=" + businessMemberNo + ", parkingNo=" + parkingNo
				+ ", refuseReason=" + refuseReason + ", couponOdiscount=" + couponOdiscount + ", couponPdiscount="
				+ couponPdiscount + ", couponReqStatus=" + couponReqStatus + ", couponNo=" + couponNo + ", createDate="
				+ createDate + ", couponStatus=" + couponStatus + ", couponCRNo=" + couponCRNo + ", userMemberNo="
				+ userMemberNo + ", userDate=" + userDate + ", userYN=" + userYN + ", parkingName=" + parkingName
				+ ", memberId=" + memberId + ", startDay=" + startDay + ", endDay=" + endDay + "]";
	}
	
	
}
