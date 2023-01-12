package com.lec.jdbc.vo;

import java.util.Date;

public class VoteVO {

	private String v_title;
	private Date v_etime;
	private String v_con;
	private String v_item1;
	private String v_count1;
	private String v_item2;
	private String v_count2;
	private String v_item3;
	private String v_count3;
	private String v_item4;
	private String v_count4;
	private String v_item1Pic;
	private int v_id;
	

	public String getV_item1Pic() {
		return v_item1Pic;
	}
	public void setV_item1Pic(String v_item1Pic) {
		this.v_item1Pic = v_item1Pic;
	}
	public String getV_item3() {
		return v_item3;
	}
	public void setV_item3(String v_item3) {
		this.v_item3 = v_item3;
	}
	public String getV_count3() {
		return v_count3;
	}
	public void setV_count3(String v_count3) {
		this.v_count3 = v_count3;
	}
	public String getV_item4() {
		return v_item4;
	}
	public void setV_item4(String v_item4) {
		this.v_item4 = v_item4;
	}
	public String getV_count4() {
		return v_count4;
	}
	public void setV_count4(String v_count4) {
		this.v_count4 = v_count4;
	}
	public String getV_title() {
		return v_title;
	}
	public void setV_title(String v_title) {
		this.v_title = v_title;
	}
	public Date getV_etime() {
		return v_etime;
	}
	public void setV_etime(Date v_etime) {
		this.v_etime = v_etime;
	}
	public String getV_con() {
		return v_con;
	}
	public void setV_con(String v_con) {
		this.v_con = v_con;
	}
	public String getV_item1() {
		return v_item1;
	}
	public void setV_item1(String v_item1) {
		this.v_item1 = v_item1;
	}
	public String getV_count1() {
		return v_count1;
	}
	public void setV_count1(String v_count1) {
		this.v_count1 = v_count1;
	}
	public String getV_item2() {
		return v_item2;
	}
	public void setV_item2(String v_item2) {
		this.v_item2 = v_item2;
	}
	public String getV_count2() {
		return v_count2;
	}
	public void setV_count2(String v_count2) {
		this.v_count2 = v_count2;
	}
	public int getV_id() {
		return v_id;
	}
	public void setV_id(int v_id) {
		this.v_id = v_id;
	}
	@Override
	public String toString() {
		return "VoteVO [v_title=" + v_title + ", v_etime=" + v_etime + ", v_con=" + v_con + ", v_item1=" + v_item1
				+ ", v_count1=" + v_count1 + ", v_item2=" + v_item2 + ", v_count2=" + v_count2 + ", v_item3=" + v_item3
				+ ", v_count3=" + v_count3 + ", v_item4=" + v_item4 + ", v_count4=" + v_count4 + ", v_item1Pic="
				+ v_item1Pic + ", v_id=" + v_id + "]";
	}

}
