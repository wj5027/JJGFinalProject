package com.kh.tsp.parkingceo.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class ExchangeMoneyVo implements Serializable {
	
	private int exchange_no;
	private String status;
	private int oil;
	private int cash;
	private Date approval_date;
	private Date application_date;
	private int member_no;
	private String cancel_reason;
	private String account_holder;
	private String application_bank;
	private String application_account_number;
	
	

	public ExchangeMoneyVo() {
		// TODO Auto-generated constructor stub
	}



	public ExchangeMoneyVo(int exchange_no, String status, int oil, int cash, Date approval_date, Date application_date,
			int member_no, String cancel_reason, String account_holder, String application_bank,
			String application_account_number) {
		super();
		this.exchange_no = exchange_no;
		this.status = status;
		this.oil = oil;
		this.cash = cash;
		this.approval_date = approval_date;
		this.application_date = application_date;
		this.member_no = member_no;
		this.cancel_reason = cancel_reason;
		this.account_holder = account_holder;
		this.application_bank = application_bank;
		this.application_account_number = application_account_number;
	}



	@Override
	public String toString() {
		return "ExchangeMoneyVo [exchange_no=" + exchange_no + ", status=" + status + ", oil=" + oil + ", cash=" + cash
				+ ", approval_date=" + approval_date + ", application_date=" + application_date + ", member_no="
				+ member_no + ", cancel_reason=" + cancel_reason + ", account_holder=" + account_holder
				+ ", application_bank=" + application_bank + ", application_account_number="
				+ application_account_number + "]";
	}



	public int getExchange_no() {
		return exchange_no;
	}



	public void setExchange_no(int exchange_no) {
		this.exchange_no = exchange_no;
	}



	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}



	public int getOil() {
		return oil;
	}



	public void setOil(int oil) {
		this.oil = oil;
	}



	public int getCash() {
		return cash;
	}



	public void setCash(int cash) {
		this.cash = cash;
	}



	public Date getApproval_date() {
		return approval_date;
	}



	public void setApproval_date(Date approval_date) {
		this.approval_date = approval_date;
	}



	public Date getApplication_date() {
		return application_date;
	}



	public void setApplication_date(Date application_date) {
		this.application_date = application_date;
	}



	public int getMember_no() {
		return member_no;
	}



	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}



	public String getCancel_reason() {
		return cancel_reason;
	}



	public void setCancel_reason(String cancel_reason) {
		this.cancel_reason = cancel_reason;
	}



	public String getAccount_holder() {
		return account_holder;
	}



	public void setAccount_holder(String account_holder) {
		this.account_holder = account_holder;
	}



	public String getApplication_bank() {
		return application_bank;
	}



	public void setApplication_bank(String application_bank) {
		this.application_bank = application_bank;
	}



	public String getApplication_account_number() {
		return application_account_number;
	}



	public void setApplication_account_number(String application_account_number) {
		this.application_account_number = application_account_number;
	}


	

}
