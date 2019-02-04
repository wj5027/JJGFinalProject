package com.kh.tsp.customer.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Member implements Serializable {
	
	private int member_no;
	private String member_id;
	private String member_pwd;
	private String member_type;
	private String id_type;
	private String oil;
	private String email;
	private String phone;
	private String member_name;
	private String member_carNo;
	private String status;
	private String kakao_id;
	private String bank_id;
	private String bank_name;
	private Date enroll_date;
	private String business_no;
	
	

	public Member() {
		// TODO Auto-generated constructor stub
	}



	public Member(int member_no, String member_id, String member_pwd, String member_type, String id_type, String oil,
			String email, String phone, String member_name, String member_carNo, String status, String kakao_id,
			String bank_id, String bank_name, Date enroll_date, String business_no) {
		super();
		this.member_no = member_no;
		this.member_id = member_id;
		this.member_pwd = member_pwd;
		this.member_type = member_type;
		this.id_type = id_type;
		this.oil = oil;
		this.email = email;
		this.phone = phone;
		this.member_name = member_name;
		this.member_carNo = member_carNo;
		this.status = status;
		this.kakao_id = kakao_id;
		this.bank_id = bank_id;
		this.bank_name = bank_name;
		this.enroll_date = enroll_date;
		this.business_no = business_no;
	}



	@Override
	public String toString() {
		return "Member [member_no=" + member_no + ", member_id=" + member_id + ", member_pwd=" + member_pwd
				+ ", member_type=" + member_type + ", id_type=" + id_type + ", oil=" + oil + ", email=" + email
				+ ", phone=" + phone + ", member_name=" + member_name + ", member_carNo=" + member_carNo + ", status="
				+ status + ", kakao_id=" + kakao_id + ", bank_id=" + bank_id + ", bank_name=" + bank_name
				+ ", enroll_date=" + enroll_date + ", business_no=" + business_no + "]";
	}



	public int getMember_no() {
		return member_no;
	}



	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}



	public String getMember_id() {
		return member_id;
	}



	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}



	public String getMember_pwd() {
		return member_pwd;
	}



	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}



	public String getMember_type() {
		return member_type;
	}



	public void setMember_type(String member_type) {
		this.member_type = member_type;
	}



	public String getId_type() {
		return id_type;
	}



	public void setId_type(String id_type) {
		this.id_type = id_type;
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



	public String getMember_name() {
		return member_name;
	}



	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}



	public String getMember_carNo() {
		return member_carNo;
	}



	public void setMember_carNo(String member_carNo) {
		this.member_carNo = member_carNo;
	}



	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}



	public String getKakao_id() {
		return kakao_id;
	}



	public void setKakao_id(String kakao_id) {
		this.kakao_id = kakao_id;
	}



	public String getBank_id() {
		return bank_id;
	}



	public void setBank_id(String bank_id) {
		this.bank_id = bank_id;
	}



	public String getBank_name() {
		return bank_name;
	}



	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}



	public Date getEnroll_date() {
		return enroll_date;
	}



	public void setEnroll_date(Date enroll_date) {
		this.enroll_date = enroll_date;
	}



	public String getBusiness_no() {
		return business_no;
	}



	public void setBusiness_no(String business_no) {
		this.business_no = business_no;
	}



	



	
	
	

}
