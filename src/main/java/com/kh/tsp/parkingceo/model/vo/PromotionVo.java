package com.kh.tsp.parkingceo.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class PromotionVo implements Serializable {

	private int parking_no;
	private int member_no;
	private String coupon_name;
	private String selectDiscount;
	private double discountValue;
	private double pDiscountValue;
	private int oDiscountValue;
	private String startDay;
	private String endDay;
	private String remark;
	private int amount;
	private String coupon_type;
	private Date coupon_start_date;
	private Date coupon_end_date;
	
	public PromotionVo() {
		// TODO Auto-generated constructor stub
	}

	public PromotionVo(int parking_no, int member_no, String coupon_name, String selectDiscount, double discountValue,
			double pDiscountValue, int oDiscountValue, String startDay, String endDay, String remark, int amount,
			String coupon_type, Date coupon_start_date, Date coupon_end_date) {
		super();
		this.parking_no = parking_no;
		this.member_no = member_no;
		this.coupon_name = coupon_name;
		this.selectDiscount = selectDiscount;
		this.discountValue = discountValue;
		this.pDiscountValue = pDiscountValue;
		this.oDiscountValue = oDiscountValue;
		this.startDay = startDay;
		this.endDay = endDay;
		this.remark = remark;
		this.amount = amount;
		this.coupon_type = coupon_type;
		this.coupon_start_date = coupon_start_date;
		this.coupon_end_date = coupon_end_date;
	}

	@Override
	public String toString() {
		return "PromotionVo [parking_no=" + parking_no + ", member_no=" + member_no + ", coupon_name=" + coupon_name
				+ ", selectDiscount=" + selectDiscount + ", discountValue=" + discountValue + ", pDiscountValue="
				+ pDiscountValue + ", oDiscountValue=" + oDiscountValue + ", startDay=" + startDay + ", endDay="
				+ endDay + ", remark=" + remark + ", amount=" + amount + ", coupon_type=" + coupon_type
				+ ", coupon_start_date=" + coupon_start_date + ", coupon_end_date=" + coupon_end_date + "]";
	}

	public int getParking_no() {
		return parking_no;
	}

	public void setParking_no(int parking_no) {
		this.parking_no = parking_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getCoupon_name() {
		return coupon_name;
	}

	public void setCoupon_name(String coupon_name) {
		this.coupon_name = coupon_name;
	}

	public String getSelectDiscount() {
		return selectDiscount;
	}

	public void setSelectDiscount(String selectDiscount) {
		this.selectDiscount = selectDiscount;
	}

	public double getDiscountValue() {
		return discountValue;
	}

	public void setDiscountValue(double discountValue) {
		this.discountValue = discountValue;
	}

	public double getpDiscountValue() {
		return pDiscountValue;
	}

	public void setpDiscountValue(double pDiscountValue) {
		this.pDiscountValue = pDiscountValue;
	}

	public int getoDiscountValue() {
		return oDiscountValue;
	}

	public void setoDiscountValue(int oDiscountValue) {
		this.oDiscountValue = oDiscountValue;
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

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getCoupon_type() {
		return coupon_type;
	}

	public void setCoupon_type(String coupon_type) {
		this.coupon_type = coupon_type;
	}

	public Date getCoupon_start_date() {
		return coupon_start_date;
	}

	public void setCoupon_start_date(Date coupon_start_date) {
		this.coupon_start_date = coupon_start_date;
	}

	public Date getCoupon_end_date() {
		return coupon_end_date;
	}

	public void setCoupon_end_date(Date coupon_end_date) {
		this.coupon_end_date = coupon_end_date;
	}

	

}
