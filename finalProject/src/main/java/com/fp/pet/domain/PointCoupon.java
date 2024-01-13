package com.fp.pet.domain;

public class PointCoupon {
	
	private long memberIdx;
	
	// 쿠폰
	private long couponNum;
	private long categoryNum;
	private String couponCode;
	private String couponName;
	private int couponstate;
	private int couponDiscount;
	private String startCouponDate;
	private String endCouponDate;
	private String categoryName;
	
	// 포인트
	private long pointNum;
	private long orderDetailNum;
	private String reg_date;
	private String memo;
	private int p_qyt;
	private int p_sort;  //구분 (1:적립, 0:사용)
	
	
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
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
	public String getCouponCode() {
		return couponCode;
	}
	public void setCouponCode(String couponCode) {
		this.couponCode = couponCode;
	}
	public String getCouponName() {
		return couponName;
	}
	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}
	public int getCouponstate() {
		return couponstate;
	}
	public void setCouponstate(int couponstate) {
		this.couponstate = couponstate;
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
	public long getPointNum() {
		return pointNum;
	}
	public void setPointNum(long pointNum) {
		this.pointNum = pointNum;
	}
	public long getOrderDetailNum() {
		return orderDetailNum;
	}
	public void setOrderDetailNum(long orderDetailNum) {
		this.orderDetailNum = orderDetailNum;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public int getP_qyt() {
		return p_qyt;
	}
	public void setP_qyt(int p_qyt) {
		this.p_qyt = p_qyt;
	}
	public int getP_sort() {
		return p_sort;
	}
	public void setP_sort(int p_sort) {
		this.p_sort = p_sort;
	}
	
}
