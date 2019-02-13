package com.kh.tsp.customer.model.vo;

import java.io.Serializable;

public class ChargeOil implements Serializable{
	private String imp_uid;			// 아임포트 고유번호
	private String merchant_uid;	// 우리 결제번호
	private boolean imp_success;	// 성공여부
	private int memberNo;			// 결제한 회원 번호
	private int oil;				// 충전할 오일
	
	public ChargeOil () {
		
	}

	public ChargeOil(String imp_uid, String merchant_uid, boolean imp_success, int memberNo, int oil) {
		super();
		this.imp_uid = imp_uid;
		this.merchant_uid = merchant_uid;
		this.imp_success = imp_success;
		this.memberNo = memberNo;
		this.oil = oil;
	}

	public String getImp_uid() {
		return imp_uid;
	}

	public void setImp_uid(String imp_uid) {
		this.imp_uid = imp_uid;
	}

	public String getMerchant_uid() {
		return merchant_uid;
	}

	public void setMerchant_uid(String merchant_uid) {
		this.merchant_uid = merchant_uid;
	}

	public boolean isImp_success() {
		return imp_success;
	}

	public void setImp_success(boolean imp_success) {
		this.imp_success = imp_success;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getOil() {
		return oil;
	}

	public void setOil(int oil) {
		this.oil = oil;
	}

	@Override
	public String toString() {
		return "ChargeOil [imp_uid=" + imp_uid + ", merchant_uid=" + merchant_uid + ", imp_success=" + imp_success
				+ ", memberNo=" + memberNo + ", oil=" + oil + "]";
	}
	
	
}
