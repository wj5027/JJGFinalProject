package com.kh.tsp.parkingceo.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.Arrays;

import org.springframework.stereotype.Component;

@Component
public class ParkingCeoVo implements Serializable {

		private String parkingNo;					// 주차장 관리 번호
		private String parkingName;				// 주차장명
		private String operateType;				// 주차장 구분
		private String parkingType;				// 주차장 유형
		private String roadAddress;				// 소재지 도로명주소
		private String address;					// 소재지 지번주소
		private int parkingSize;					// 주차 구획수
		private String openDays;					// 운영요일
		private String weekdayStime;			// 평일 운영 시작 시간
		private String weekdayEtime;			// 평일 운영 종료 시간
		private String satStime;					// 토요일 운영 시작 시간
		private String satEtime;					// 토요일 운영 종료 시간
		private String hollydayStime;			// 공휴일 운영 시작 시간
		private String hollydayEtime;			// 공휴일 운용 종료 시간
		private String priceInfo;					// 요금정보
		private int parkingNtime;					// 주차장 기본시간
		private int parkingNprice;					// 주차장 기본요금
		private int parkingAtime;					// 추가 단위 시간
		private int parkingAprice;					// 추가 단위 요금
		private String payType;					// 결제 방법
		private String remarks;					// 특기사항
		private String latitude;					// 위도
		private String longitude;					// 경도
		private String parkingManagement;	// 관리 기관명
		private String managementTel;			// 전화번호
		private int memberNo;						// 회원번호
		private int leftSize;							// 잔여대수
		private String status;						// 상태 (default Y)
		
		private String parkingListReason;		// 반송 사유
		private Date modifyDate;					// 변경 날짜
		private String[] openDaysArry; // 운영 요일 배열
		private String[] pay_typeArry; // 결제 방법배열
		
		
		public ParkingCeoVo() {
			super();
		}


		public ParkingCeoVo(String parkingNo, String parkingName, String operateType, String parkingType,
				String roadAddress, String address, int parkingSize, String openDays, String weekdayStime,
				String weekdayEtime, String satStime, String satEtime, String hollydayStime, String hollydayEtime,
				String priceInfo, int parkingNtime, int parkingNprice, int parkingAtime, int parkingAprice,
				String payType, String remarks, String latitude, String longitude, String parkingManagement,
				String managementTel, int memberNo, int leftSize, String status, String parkingListReason,
				Date modifyDate, String[] openDaysArry, String[] pay_typeArry) {
			super();
			this.parkingNo = parkingNo;
			this.parkingName = parkingName;
			this.operateType = operateType;
			this.parkingType = parkingType;
			this.roadAddress = roadAddress;
			this.address = address;
			this.parkingSize = parkingSize;
			this.openDays = openDays;
			this.weekdayStime = weekdayStime;
			this.weekdayEtime = weekdayEtime;
			this.satStime = satStime;
			this.satEtime = satEtime;
			this.hollydayStime = hollydayStime;
			this.hollydayEtime = hollydayEtime;
			this.priceInfo = priceInfo;
			this.parkingNtime = parkingNtime;
			this.parkingNprice = parkingNprice;
			this.parkingAtime = parkingAtime;
			this.parkingAprice = parkingAprice;
			this.payType = payType;
			this.remarks = remarks;
			this.latitude = latitude;
			this.longitude = longitude;
			this.parkingManagement = parkingManagement;
			this.managementTel = managementTel;
			this.memberNo = memberNo;
			this.leftSize = leftSize;
			this.status = status;
			this.parkingListReason = parkingListReason;
			this.modifyDate = modifyDate;
			this.openDaysArry = openDaysArry;
			this.pay_typeArry = pay_typeArry;
		}


		@Override
		public String toString() {
			return "ParkingCeoVo [parkingNo=" + parkingNo + ", parkingName=" + parkingName + ", operateType="
					+ operateType + ", parkingType=" + parkingType + ", roadAddress=" + roadAddress + ", address="
					+ address + ", parkingSize=" + parkingSize + ", openDays=" + openDays + ", weekdayStime="
					+ weekdayStime + ", weekdayEtime=" + weekdayEtime + ", satStime=" + satStime + ", satEtime="
					+ satEtime + ", hollydayStime=" + hollydayStime + ", hollydayEtime=" + hollydayEtime
					+ ", priceInfo=" + priceInfo + ", parkingNtime=" + parkingNtime + ", parkingNprice=" + parkingNprice
					+ ", parkingAtime=" + parkingAtime + ", parkingAprice=" + parkingAprice + ", payType=" + payType
					+ ", remarks=" + remarks + ", latitude=" + latitude + ", longitude=" + longitude
					+ ", parkingManagement=" + parkingManagement + ", managementTel=" + managementTel + ", memberNo="
					+ memberNo + ", leftSize=" + leftSize + ", status=" + status + ", parkingListReason="
					+ parkingListReason + ", modifyDate=" + modifyDate + ", openDaysArry="
					+ Arrays.toString(openDaysArry) + ", pay_typeArry=" + Arrays.toString(pay_typeArry) + "]";
		}


		public String getParkingNo() {
			return parkingNo;
		}


		public void setParkingNo(String parkingNo) {
			this.parkingNo = parkingNo;
		}


		public String getParkingName() {
			return parkingName;
		}


		public void setParkingName(String parkingName) {
			this.parkingName = parkingName;
		}


		public String getOperateType() {
			return operateType;
		}


		public void setOperateType(String operateType) {
			this.operateType = operateType;
		}


		public String getParkingType() {
			return parkingType;
		}


		public void setParkingType(String parkingType) {
			this.parkingType = parkingType;
		}


		public String getRoadAddress() {
			return roadAddress;
		}


		public void setRoadAddress(String roadAddress) {
			this.roadAddress = roadAddress;
		}


		public String getAddress() {
			return address;
		}


		public void setAddress(String address) {
			this.address = address;
		}


		public int getParkingSize() {
			return parkingSize;
		}


		public void setParkingSize(int parkingSize) {
			this.parkingSize = parkingSize;
		}


		public String getOpenDays() {
			return openDays;
		}


		public void setOpenDays(String openDays) {
			this.openDays = openDays;
		}


		public String getWeekdayStime() {
			return weekdayStime;
		}


		public void setWeekdayStime(String weekdayStime) {
			this.weekdayStime = weekdayStime;
		}


		public String getWeekdayEtime() {
			return weekdayEtime;
		}


		public void setWeekdayEtime(String weekdayEtime) {
			this.weekdayEtime = weekdayEtime;
		}


		public String getSatStime() {
			return satStime;
		}


		public void setSatStime(String satStime) {
			this.satStime = satStime;
		}


		public String getSatEtime() {
			return satEtime;
		}


		public void setSatEtime(String satEtime) {
			this.satEtime = satEtime;
		}


		public String getHollydayStime() {
			return hollydayStime;
		}


		public void setHollydayStime(String hollydayStime) {
			this.hollydayStime = hollydayStime;
		}


		public String getHollydayEtime() {
			return hollydayEtime;
		}


		public void setHollydayEtime(String hollydayEtime) {
			this.hollydayEtime = hollydayEtime;
		}


		public String getPriceInfo() {
			return priceInfo;
		}


		public void setPriceInfo(String priceInfo) {
			this.priceInfo = priceInfo;
		}


		public int getParkingNtime() {
			return parkingNtime;
		}


		public void setParkingNtime(int parkingNtime) {
			this.parkingNtime = parkingNtime;
		}


		public int getParkingNprice() {
			return parkingNprice;
		}


		public void setParkingNprice(int parkingNprice) {
			this.parkingNprice = parkingNprice;
		}


		public int getParkingAtime() {
			return parkingAtime;
		}


		public void setParkingAtime(int parkingAtime) {
			this.parkingAtime = parkingAtime;
		}


		public int getParkingAprice() {
			return parkingAprice;
		}


		public void setParkingAprice(int parkingAprice) {
			this.parkingAprice = parkingAprice;
		}


		public String getPayType() {
			return payType;
		}


		public void setPayType(String payType) {
			this.payType = payType;
		}


		public String getRemarks() {
			return remarks;
		}


		public void setRemarks(String remarks) {
			this.remarks = remarks;
		}


		public String getLatitude() {
			return latitude;
		}


		public void setLatitude(String latitude) {
			this.latitude = latitude;
		}


		public String getLongitude() {
			return longitude;
		}


		public void setLongitude(String longitude) {
			this.longitude = longitude;
		}


		public String getParkingManagement() {
			return parkingManagement;
		}


		public void setParkingManagement(String parkingManagement) {
			this.parkingManagement = parkingManagement;
		}


		public String getManagementTel() {
			return managementTel;
		}


		public void setManagementTel(String managementTel) {
			this.managementTel = managementTel;
		}


		public int getMemberNo() {
			return memberNo;
		}


		public void setMemberNo(int memberNo) {
			this.memberNo = memberNo;
		}


		public int getLeftSize() {
			return leftSize;
		}


		public void setLeftSize(int leftSize) {
			this.leftSize = leftSize;
		}


		public String getStatus() {
			return status;
		}


		public void setStatus(String status) {
			this.status = status;
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


		public String[] getOpenDaysArry() {
			return openDaysArry;
		}


		public void setOpenDaysArry(String[] openDaysArry) {
			this.openDaysArry = openDaysArry;
		}


		public String[] getPay_typeArry() {
			return pay_typeArry;
		}


		public void setPay_typeArry(String[] pay_typeArry) {
			this.pay_typeArry = pay_typeArry;
		}
		
		
	


	


}
