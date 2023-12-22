package com.fp.pet.domain;

public class Purchase {
	private int productNum;
	private int categoryNum;
	private int purchaseCount;
	private int reviewCount;
	private int orderDetailNum;
	private int orderState;
	private int detailState;
	private String order_date;
	private int userScore;
	
	public int getProductNum() {
		return productNum;
	}
	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}
	public int getCategoryNum() {
		return categoryNum;
	}
	public void setCategoryNum(int categoryNum) {
		this.categoryNum = categoryNum;
	}
	public int getPurchaseCount() {
		return purchaseCount;
	}
	public void setPurchaseCount(int purchaseCount) {
		this.purchaseCount = purchaseCount;
	}
	public int getReviewCount() {
		return reviewCount;
	}
	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}
	public int getOrderDetailNum() {
		return orderDetailNum;
	}
	public void setOrderDetailNum(int orderDetailNum) {
		this.orderDetailNum = orderDetailNum;
	}
	public int getOrderState() {
		return orderState;
	}
	public void setOrderState(int orderState) {
		this.orderState = orderState;
	}
	public int getDetailState() {
		return detailState;
	}
	public void setDetailState(int detailState) {
		this.detailState = detailState;
	}
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
	public int getUserScore() {
		return userScore;
	}
	public void setUserScore(int userScore) {
		this.userScore = userScore;
	}
	
}
