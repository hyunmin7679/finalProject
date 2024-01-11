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
	private int category_count;
	private String category_description;
	private int ordernum;
	private String productName;
	private int price;
	private String orderdate;
	private int savedmoney; 
	private int average_score;
	private int qty;
	private String detailstates;
	
	public String getDetailstates() {
		return detailstates;
	}
	public void setDetailstates(String detailstates) {
		this.detailstates = detailstates;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public int getAverage_score() {
		return average_score;
	}
	public void setAverage_score(int average_score) {
		this.average_score = average_score;
	}
	public String getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}
	public int getOrdernum() {
		return ordernum;
	}
	public void setOrdernum(int ordernum) {
		this.ordernum = ordernum;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	public int getSavedmoney() {
		return savedmoney;
	}
	public void setSavedmoney(int savedmoney) {
		this.savedmoney = savedmoney;
	}
	public String getCategory_description() {
		return category_description;
	}
	public void setCategory_description(String category_description) {
		this.category_description = category_description;
	}
	public String getCategory_big() {
		return category_big;
	}
	public void setCategory_big(String category_big) {
		this.category_big = category_big;
	}
	private String category_big;
	
	public int getCategory_count() {
		return category_count;
	}
	public void setCategory_count(int category_count) {
		this.category_count = category_count;
	}
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
