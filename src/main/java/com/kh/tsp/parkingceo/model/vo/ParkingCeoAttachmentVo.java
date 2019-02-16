package com.kh.tsp.parkingceo.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class ParkingCeoAttachmentVo implements Serializable {

	
	private int fid;
	private String bid;
	private String origin_name;
	private String change_name;
	private String file_path;
	private Date upload_date;
	private int file_level;
	private String status;
	private String parking_no;
	private int board_no;
	private int parking_list_no;
	
	
	public ParkingCeoAttachmentVo() {
		// TODO Auto-generated constructor stub
	}


	public ParkingCeoAttachmentVo(int fid, String bid, String origin_name, String change_name, String file_path,
			Date upload_date, int file_level, String status, String parking_no, int board_no, int parking_list_no) {
		super();
		this.fid = fid;
		this.bid = bid;
		this.origin_name = origin_name;
		this.change_name = change_name;
		this.file_path = file_path;
		this.upload_date = upload_date;
		this.file_level = file_level;
		this.status = status;
		this.parking_no = parking_no;
		this.board_no = board_no;
		this.parking_list_no = parking_list_no;
	}


	@Override
	public String toString() {
		return "ParkingCeoAttachmentVo [fid=" + fid + ", bid=" + bid + ", origin_name=" + origin_name + ", change_name="
				+ change_name + ", file_path=" + file_path + ", upload_date=" + upload_date + ", file_level="
				+ file_level + ", status=" + status + ", parking_no=" + parking_no + ", board_no=" + board_no
				+ ", parking_list_no=" + parking_list_no + "]";
	}


	public int getFid() {
		return fid;
	}


	public void setFid(int fid) {
		this.fid = fid;
	}


	public String getBid() {
		return bid;
	}


	public void setBid(String bid) {
		this.bid = bid;
	}


	public String getOrigin_name() {
		return origin_name;
	}


	public void setOrigin_name(String origin_name) {
		this.origin_name = origin_name;
	}


	public String getChange_name() {
		return change_name;
	}


	public void setChange_name(String change_name) {
		this.change_name = change_name;
	}


	public String getFile_path() {
		return file_path;
	}


	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}


	public Date getUpload_date() {
		return upload_date;
	}


	public void setUpload_date(Date upload_date) {
		this.upload_date = upload_date;
	}


	public int getFile_level() {
		return file_level;
	}


	public void setFile_level(int file_level) {
		this.file_level = file_level;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public String getParking_no() {
		return parking_no;
	}


	public void setParking_no(String parking_no) {
		this.parking_no = parking_no;
	}


	public int getBoard_no() {
		return board_no;
	}


	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}


	public int getParking_list_no() {
		return parking_list_no;
	}


	public void setParking_list_no(int parking_list_no) {
		this.parking_list_no = parking_list_no;
	}
	
	

}
