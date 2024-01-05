package com.fp.pet.admin.domain;

public class Coupon {
	private long couponNum;
	private long categoryNum;
	private String couponCode;
	private String couponName ;
	private int couponState;
	private int couponDiscount;
	private String startCouponDate;
	private String endCouponDate;
	private String couponMemo;
	
	private int sort;
	private String categoryName;
	
	private long memberIdx;
	
	

	private int issuedCoupon; // 발급 받은 사용자 수
	private int useCoupon;    // 발급 받고 사용한 수 
	
	
	
	public String getCouponMemo() {
		return couponMemo;
	}
	public void setCouponMemo(String couponMemo) {
		this.couponMemo = couponMemo;
	}
	public int getIssuedCoupon() {
		return issuedCoupon;
	}
	public void setIssuedCoupon(int issuedCoupon) {
		this.issuedCoupon = issuedCoupon;
	}
	public int getUseCoupon() {
		return useCoupon;
	}
	public void setUseCoupon(int useCoupon) {
		this.useCoupon = useCoupon;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public int getSort() {
		return sort;
	}
	public void setSort(int sort) {
		this.sort = sort;
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
	public int getCouponState() {
		return couponState;
	}
	public void setCouponState(int couponState) {
		this.couponState = couponState;
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
	public long getMemberIdx() {
		return memberIdx;
	}
	public void setMemberIdx(long memberIdx) {
		this.memberIdx = memberIdx;
	}
	
	

}
