package com.kh.tsp.customer.model.vo;

public class Points implements java.io.Serializable{
	
	private double x00;
	private double x01;
	private double y00;
	private double y01;
	
	
	public Points() {
		super();
	}
	
	
	public Points(double x00, double x01, double y00, double y01) {
		super();
		this.x00 = x00;
		this.x01 = x01;
		this.y00 = y00;
		this.y01 = y01;
	}


	public double getX00() {
		return x00;
	}
	public void setX00(double x00) {
		this.x00 = x00;
	}
	public double getX01() {
		return x01;
	}
	public void setX01(double x01) {
		this.x01 = x01;
	}
	public double getY00() {
		return y00;
	}
	public void setY00(double y00) {
		this.y00 = y00;
	}
	public double getY01() {
		return y01;
	}
	public void setY01(double y01) {
		this.y01 = y01;
	}
	@Override
	public String toString() {
		return "points [x00=" + x00 + ", x01=" + x01 + ", y00=" + y00 + ", y01=" + y01 + "]";
	}
	
	
}
