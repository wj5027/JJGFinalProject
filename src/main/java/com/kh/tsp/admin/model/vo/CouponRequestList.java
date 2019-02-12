package com.kh.tsp.admin.model.vo;

import java.sql.Date;

public class CouponRequestList implements java.io.Serializable{
	private int reqNo;						// 신청번호
	private String couponName;			// 쿠폰명
	private String couponType;			// 분류
	private Date couponStartDate;		// 시작날짜
	private Date couponEndDate;		// 종료날짜
	private int amount;						// 수량(개수)
	private String remark;					// 비고
	private int memberNo;					// 회원번호(사업자)
	private String parkingNo;				// 주차장 관리번호
	private String refuseReason;		// 반송사유
	private int couponOdiscount;		// 할인금액 (오일할인)
	private double couponPdiscount;	// 할인율 (퍼센트할인)
	private String couponReqStatus;	// 상태('신청중','반송','발급완료')
	
	private String parkingName;			// 주차장명
	private String memberId;				// 회원아이디
	
	public CouponRequestList() {}

	public CouponRequestList(int reqNo, String couponName, String couponType, Date couponStartDate, Date couponEndDate,
			int amount, String remark, int memberNo, String parkingNo, String refuseReason, int couponOdiscount,
			double couponPdiscount, String couponReqStatus, String parkingName, String memberId) {
		super();
		this.reqNo = reqNo;
		this.couponName = couponName;
		this.couponType = couponType;
		this.couponStartDate = couponStartDate;
		this.couponEndDate = couponEndDate;
		this.amount = amount;
		this.remark = remark;
		this.memberNo = memberNo;
		this.parkingNo = parkingNo;
		this.refuseReason = refuseReason;
		this.couponOdiscount = couponOdiscount;
		this.couponPdiscount = couponPdiscount;
		this.couponReqStatus = couponReqStatus;
		this.parkingName = parkingName;
		this.memberId = memberId;
	}

	public int getReqNo() {
		return reqNo;
	}

	public void setReqNo(int reqNo) {
		this.reqNo = reqNo;
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

	@Override
	public String toString() {
		return "CouponRequestList [reqNo=" + reqNo + ", couponName=" + couponName + ", couponType=" + couponType
				+ ", couponStartDate=" + couponStartDate + ", couponEndDate=" + couponEndDate + ", amount=" + amount
				+ ", remark=" + remark + ", memberNo=" + memberNo + ", parkingNo=" + parkingNo + ", refuseReason="
				+ refuseReason + ", couponOdiscount=" + couponOdiscount + ", couponPdiscount=" + couponPdiscount
				+ ", couponReqStatus=" + couponReqStatus + ", parkingName=" + parkingName + ", memberId=" + memberId
				+ "]";
	}

	
}
