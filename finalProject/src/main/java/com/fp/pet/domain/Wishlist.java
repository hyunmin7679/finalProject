package com.fp.pet.domain;

public class Wishlist {
	
	private String userId;
	private long productNum;
	private int secret;
	private String thumbnail;
	private String productName;
	private int price;
	
	
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
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
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public long getProductNum() {
		return productNum;
	}
	public void setProductNum(long productNum) {
		this.productNum = productNum;
	}
	public int getSecret() {
		return secret;
	}
	public void setSecret(int secret) {
		this.secret = secret;
	}

}
