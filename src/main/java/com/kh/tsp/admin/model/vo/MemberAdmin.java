package com.kh.tsp.admin.model.vo;

import java.sql.Date;

public class MemberAdmin implements java.io.Serializable{
	private int memberNo;					// ȸ����ȣ - No
	private String memberId;				// ȸ�����̵� - No
	private String memberPassword;	// ��й�ȣ - No
	private String memberType;			// ����ڱ��� (������:A / �����:U / �����: B) - No
	private String idType;					// �������� (��ȸ��:M / īī��ȸ��:K / ���̹�ȸ��:N) - No
	private String oil;						// ����Ʈ - No 
	private String email;					// �̸��� - No
	private String phone;					// ��ȭ��ȣ - No
	private String memberName;		// �̸� - No
	private String memberCarNo;		// ����ȣ - Yes
	private String status;					// ���� (Y,N) - No ('Y')
	private String kakaoId;				// īī�����̵� - Yes
	private String bankId;					// ���¹�ȣ - Yes
	private String bankName;				// ���� - Yes
	private Date enrollDate;				// ������ - No
	
	public MemberAdmin() {}

	public MemberAdmin(int memberNo, String memberId, String memberPassword, String memberType, String idType,
			String oil, String email, String phone, String memberName, String memberCarNo, String status,
			String kakaoId, String bankId, String bankName, Date enrollDate) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberPassword = memberPassword;
		this.memberType = memberType;
		this.idType = idType;
		this.oil = oil;
		this.email = email;
		this.phone = phone;
		this.memberName = memberName;
		this.memberCarNo = memberCarNo;
		this.status = status;
		this.kakaoId = kakaoId;
		this.bankId = bankId;
		this.bankName = bankName;
		this.enrollDate = enrollDate;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPassword() {
		return memberPassword;
	}

	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}

	public String getMemberType() {
		return memberType;
	}

	public void setMemberType(String memberType) {
		this.memberType = memberType;
	}

	public String getIdType() {
		return idType;
	}

	public void setIdType(String idType) {
		this.idType = idType;
	}

	public String getOil() {
		return oil;
	}

	public void setOil(String oil) {
		this.oil = oil;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberCarNo() {
		return memberCarNo;
	}

	public void setMemberCarNo(String memberCarNo) {
		this.memberCarNo = memberCarNo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getKakaoId() {
		return kakaoId;
	}

	public void setKakaoId(String kakaoId) {
		this.kakaoId = kakaoId;
	}

	public String getBankId() {
		return bankId;
	}

	public void setBankId(String bankId) {
		this.bankId = bankId;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	@Override
	public String toString() {
		return "MemberAdmin [memberNo=" + memberNo + ", memberId=" + memberId + ", memberPassword=" + memberPassword
				+ ", memberType=" + memberType + ", idType=" + idType + ", oil=" + oil + ", email=" + email + ", phone="
				+ phone + ", memberName=" + memberName + ", memberCarNo=" + memberCarNo + ", status=" + status
				+ ", kakaoId=" + kakaoId + ", bankId=" + bankId + ", bankName=" + bankName + ", enrollDate="
				+ enrollDate + "]";
	}

}
