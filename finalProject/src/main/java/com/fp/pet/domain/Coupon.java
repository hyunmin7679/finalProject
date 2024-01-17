package com.fp.pet.domain;

public class Coupon {

	private long couponNum;
	private long categoryNum;
	private String couponName;
	private int couponDiscount;
	private String startCouponDate;
	private String endCouponDate;
	private String couponMemo;
	
	
	private long memberIdx;
	
	
	public long getMemberIdx() {
		return memberIdx;
	}
	public void setMemberIdx(long memberIdx) {
		this.memberIdx = memberIdx;
	}
	public long getCouponNum() {
		return couponNum;
	}
	public void setCouponNum(long couponNum) {
		this.couponNum = couponNum;
	}
	public long getCategoryNum() {
		return categoryNum;
	}
	public void setCategoryNum(long categoryNum) {
		this.categoryNum = categoryNum;
	}
	public String getCouponName() {
		return couponName;
	}
	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}
	public int getCouponDiscount() {
		return couponDiscount;
	}
	public void setCouponDiscount(int couponDiscount) {
		this.couponDiscount = couponDiscount;
	}
	public String getStartCouponDate() {
		return startCouponDate;
	}
	public void setStartCouponDate(String startCouponDate) {
		this.startCouponDate = startCouponDate;
	}
	public String getEndCouponDate() {
		return endCouponDate;
	}
	public void setEndCouponDate(String endCouponDate) {
		this.endCouponDate = endCouponDate;
	}
	public String getCouponMemo() {
		return couponMemo;
	}
	public void setCouponMemo(String couponMemo) {
		this.couponMemo = couponMemo;
	}
	
	
	
}
