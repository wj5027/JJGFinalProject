package com.kh.tsp.customer.model.vo;

public class Parking implements java.io.Serializable{
//	PARKING_NO	VARCHAR2(100 BYTE)
	String PARKING_NO;
//	PARKING_NAME	VARCHAR2(100 BYTE)
	String PARKING_NAME;
//	OPERATE_TYPE	VARCHAR2(20 BYTE)
	String OPERATE_TYPE;
//	PARKING_TYPE	VARCHAR2(20 BYTE)
	String PARKING_TYPE;
//	ROAD_ADDRESS	VARCHAR2(150 BYTE)
	String ROAD_ADDRESS;
//	ADDRESS	VARCHAR2(150 BYTE)
	String ADDRESS;
//	PARKING_SIZE	NUMBER
	int PARKING_SIZE;
//	OPEN_DAYS	VARCHAR2(50 BYTE)
	String OPEN_DAYS;
//	WEEKDAY_STIME	VARCHAR2(30 BYTE)
	String WEEKDAY_STIME;
//	WEEKDAY_ETIME	VARCHAR2(30 BYTE)
	String WEEKDAY_ETIME;
//	SAT_STIME	VARCHAR2(30 BYTE)
	String SAT_STIME;
//	SAT_ETIME	VARCHAR2(30 BYTE)
	String SAT_ETIME;
//	HOLIDAY_STIME	VARCHAR2(30 BYTE)
	String HOLIDAY_STIME;
//	HOLIDAY_ETIME	VARCHAR2(30 BYTE)
	String HOLIDAY_ETIME;
//	PRICE_INFO	VARCHAR2(10 BYTE)
	String PRICE_INFO;
//	PARKING_NTIME	NUMBER
	int PARKING_NTIME;
//	PARKING_NPRICE	NUMBER
	int PARKING_NPRICE;
//	PARKING_ATIME	NUMBER
	int PARKING_ATIME;
//	PARKING_APRICE	NUMBER
	int PARKING_APRICE;
//	PAY_TYPE	VARCHAR2(30 BYTE)
	String PAY_TYPE;
//	REMARKS	VARCHAR2(100 BYTE)
	String REMARKS;
//	LATITUDE	VARCHAR2(50 BYTE)
	String LATITUDE;
//	LONGITUDE	VARCHAR2(50 BYTE)
	String LONGITUDE;
//	PARKING_MANGEMENT	VARCHAR2(50 BYTE)
	String PARKING_MANGEMENT;
//	MANAGEMENT_TEL	VARCHAR2(50 BYTE)
	String MANAGEMENT_TEL;
//	MEMBER_NO	NUMBER
	int MEMBER_NO;
//	LEFT_SIZE	NUMBER
	int LEFT_SIZE;
//	STATUS	CHAR(1 BYTE)
	String STATUS;
	
	
	
	
	
	
	public Parking() {
	super();
	
	
}
	public Parking(String pARKING_NO, String pARKING_NAME, String oPERATE_TYPE, String pARKING_TYPE,
			String rOAD_ADDRESS, String aDDRESS, int pARKING_SIZE, String oPEN_DAYS, String wEEKDAY_STIME,
			String wEEKDAY_ETIME, String sAT_STIME, String sAT_ETIME, String hOLIDAY_STIME, String hOLIDAY_ETIME,
			String pRICE_INFO, int pARKING_NTIME, int pARKING_NPRICE, int pARKING_ATIME, int pARKING_APRICE,
			String pAY_TYPE, String rEMARKS, String lATITUDE, String lONGITUDE, String pARKING_MANGEMENT,
			String mANAGEMENT_TEL, int mEMBER_NO, int lEFT_SIZE, String sTATUS) {
		super();
		PARKING_NO = pARKING_NO;
		PARKING_NAME = pARKING_NAME;
		OPERATE_TYPE = oPERATE_TYPE;
		PARKING_TYPE = pARKING_TYPE;
		ROAD_ADDRESS = rOAD_ADDRESS;
		ADDRESS = aDDRESS;
		PARKING_SIZE = pARKING_SIZE;
		OPEN_DAYS = oPEN_DAYS;
		WEEKDAY_STIME = wEEKDAY_STIME;
		WEEKDAY_ETIME = wEEKDAY_ETIME;
		SAT_STIME = sAT_STIME;
		SAT_ETIME = sAT_ETIME;
		HOLIDAY_STIME = hOLIDAY_STIME;
		HOLIDAY_ETIME = hOLIDAY_ETIME;
		PRICE_INFO = pRICE_INFO;
		PARKING_NTIME = pARKING_NTIME;
		PARKING_NPRICE = pARKING_NPRICE;
		PARKING_ATIME = pARKING_ATIME;
		PARKING_APRICE = pARKING_APRICE;
		PAY_TYPE = pAY_TYPE;
		REMARKS = rEMARKS;
		LATITUDE = lATITUDE;
		LONGITUDE = lONGITUDE;
		PARKING_MANGEMENT = pARKING_MANGEMENT;
		MANAGEMENT_TEL = mANAGEMENT_TEL;
		MEMBER_NO = mEMBER_NO;
		LEFT_SIZE = lEFT_SIZE;
		STATUS = sTATUS;
	}
	public String getPARKING_NO() {
		return PARKING_NO;
	}
	public void setPARKING_NO(String pARKING_NO) {
		PARKING_NO = pARKING_NO;
	}
	public String getPARKING_NAME() {
		return PARKING_NAME;
	}
	public void setPARKING_NAME(String pARKING_NAME) {
		PARKING_NAME = pARKING_NAME;
	}
	public String getOPERATE_TYPE() {
		return OPERATE_TYPE;
	}
	public void setOPERATE_TYPE(String oPERATE_TYPE) {
		OPERATE_TYPE = oPERATE_TYPE;
	}
	public String getPARKING_TYPE() {
		return PARKING_TYPE;
	}
	public void setPARKING_TYPE(String pARKING_TYPE) {
		PARKING_TYPE = pARKING_TYPE;
	}
	public String getROAD_ADDRESS() {
		return ROAD_ADDRESS;
	}
	public void setROAD_ADDRESS(String rOAD_ADDRESS) {
		ROAD_ADDRESS = rOAD_ADDRESS;
	}
	public String getADDRESS() {
		return ADDRESS;
	}
	public void setADDRESS(String aDDRESS) {
		ADDRESS = aDDRESS;
	}
	public int getPARKING_SIZE() {
		return PARKING_SIZE;
	}
	public void setPARKING_SIZE(int pARKING_SIZE) {
		PARKING_SIZE = pARKING_SIZE;
	}
	public String getOPEN_DAYS() {
		return OPEN_DAYS;
	}
	public void setOPEN_DAYS(String oPEN_DAYS) {
		OPEN_DAYS = oPEN_DAYS;
	}
	public String getWEEKDAY_STIME() {
		return WEEKDAY_STIME;
	}
	public void setWEEKDAY_STIME(String wEEKDAY_STIME) {
		WEEKDAY_STIME = wEEKDAY_STIME;
	}
	public String getWEEKDAY_ETIME() {
		return WEEKDAY_ETIME;
	}
	public void setWEEKDAY_ETIME(String wEEKDAY_ETIME) {
		WEEKDAY_ETIME = wEEKDAY_ETIME;
	}
	public String getSAT_STIME() {
		return SAT_STIME;
	}
	public void setSAT_STIME(String sAT_STIME) {
		SAT_STIME = sAT_STIME;
	}
	public String getSAT_ETIME() {
		return SAT_ETIME;
	}
	public void setSAT_ETIME(String sAT_ETIME) {
		SAT_ETIME = sAT_ETIME;
	}
	public String getHOLIDAY_STIME() {
		return HOLIDAY_STIME;
	}
	public void setHOLIDAY_STIME(String hOLIDAY_STIME) {
		HOLIDAY_STIME = hOLIDAY_STIME;
	}
	public String getHOLIDAY_ETIME() {
		return HOLIDAY_ETIME;
	}
	public void setHOLIDAY_ETIME(String hOLIDAY_ETIME) {
		HOLIDAY_ETIME = hOLIDAY_ETIME;
	}
	public String getPRICE_INFO() {
		return PRICE_INFO;
	}
	public void setPRICE_INFO(String pRICE_INFO) {
		PRICE_INFO = pRICE_INFO;
	}
	public int getPARKING_NTIME() {
		return PARKING_NTIME;
	}
	public void setPARKING_NTIME(int pARKING_NTIME) {
		PARKING_NTIME = pARKING_NTIME;
	}
	public int getPARKING_NPRICE() {
		return PARKING_NPRICE;
	}
	public void setPARKING_NPRICE(int pARKING_NPRICE) {
		PARKING_NPRICE = pARKING_NPRICE;
	}
	public int getPARKING_ATIME() {
		return PARKING_ATIME;
	}
	public void setPARKING_ATIME(int pARKING_ATIME) {
		PARKING_ATIME = pARKING_ATIME;
	}
	public int getPARKING_APRICE() {
		return PARKING_APRICE;
	}
	public void setPARKING_APRICE(int pARKING_APRICE) {
		PARKING_APRICE = pARKING_APRICE;
	}
	public String getPAY_TYPE() {
		return PAY_TYPE;
	}
	public void setPAY_TYPE(String pAY_TYPE) {
		PAY_TYPE = pAY_TYPE;
	}
	public String getREMARKS() {
		return REMARKS;
	}
	public void setREMARKS(String rEMARKS) {
		REMARKS = rEMARKS;
	}
	public String getLATITUDE() {
		return LATITUDE;
	}
	public void setLATITUDE(String lATITUDE) {
		LATITUDE = lATITUDE;
	}
	public String getLONGITUDE() {
		return LONGITUDE;
	}
	public void setLONGITUDE(String lONGITUDE) {
		LONGITUDE = lONGITUDE;
	}
	public String getPARKING_MANGEMENT() {
		return PARKING_MANGEMENT;
	}
	public void setPARKING_MANGEMENT(String pARKING_MANGEMENT) {
		PARKING_MANGEMENT = pARKING_MANGEMENT;
	}
	public String getMANAGEMENT_TEL() {
		return MANAGEMENT_TEL;
	}
	public void setMANAGEMENT_TEL(String mANAGEMENT_TEL) {
		MANAGEMENT_TEL = mANAGEMENT_TEL;
	}
	public int getMEMBER_NO() {
		return MEMBER_NO;
	}
	public void setMEMBER_NO(int mEMBER_NO) {
		MEMBER_NO = mEMBER_NO;
	}
	public int getLEFT_SIZE() {
		return LEFT_SIZE;
	}
	public void setLEFT_SIZE(int lEFT_SIZE) {
		LEFT_SIZE = lEFT_SIZE;
	}
	public String getSTATUS() {
		return STATUS;
	}
	public void setSTATUS(String sTATUS) {
		STATUS = sTATUS;
	}
	@Override
	public String toString() {
		return "parking [PARKING_NO=" + PARKING_NO + ", PARKING_NAME=" + PARKING_NAME + ", OPERATE_TYPE=" + OPERATE_TYPE
				+ ", PARKING_TYPE=" + PARKING_TYPE + ", ROAD_ADDRESS=" + ROAD_ADDRESS + ", ADDRESS=" + ADDRESS
				+ ", PARKING_SIZE=" + PARKING_SIZE + ", OPEN_DAYS=" + OPEN_DAYS + ", WEEKDAY_STIME=" + WEEKDAY_STIME
				+ ", WEEKDAY_ETIME=" + WEEKDAY_ETIME + ", SAT_STIME=" + SAT_STIME + ", SAT_ETIME=" + SAT_ETIME
				+ ", HOLIDAY_STIME=" + HOLIDAY_STIME + ", HOLIDAY_ETIME=" + HOLIDAY_ETIME + ", PRICE_INFO=" + PRICE_INFO
				+ ", PARKING_NTIME=" + PARKING_NTIME + ", PARKING_NPRICE=" + PARKING_NPRICE + ", PARKING_ATIME="
				+ PARKING_ATIME + ", PARKING_APRICE=" + PARKING_APRICE + ", PAY_TYPE=" + PAY_TYPE + ", REMARKS="
				+ REMARKS + ", LATITUDE=" + LATITUDE + ", LONGITUDE=" + LONGITUDE + ", PARKING_MANGEMENT="
				+ PARKING_MANGEMENT + ", MANAGEMENT_TEL=" + MANAGEMENT_TEL + ", MEMBER_NO=" + MEMBER_NO + ", LEFT_SIZE="
				+ LEFT_SIZE + ", STATUS=" + STATUS + "]";
	}
	
	
	
	
	

}
