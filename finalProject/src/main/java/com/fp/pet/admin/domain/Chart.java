package com.fp.pet.admin.domain;

public class Chart {
	private String title;
	private double value;
	private int pay;
	private String months;
	
	private String daySale_date;
	private int daySale;
	
	private int categoryNum;
	private String categoryName;
	private int postCount;
	private double postPercentage;
	
	
	

	public Chart() {
	}
	
	public Chart(String daySale_date, int daySale) {
		this.daySale_date = daySale_date;
		this.daySale = daySale;
	}
	
	
	public int getCategoryNum() {
		return categoryNum;
	}

	public void setCategoryNum(int categoryNum) {
		this.categoryNum = categoryNum;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public int getPostCount() {
		return postCount;
	}

	public void setPostCount(int postCount) {
		this.postCount = postCount;
	}

	public double getPostPercentage() {
		return postPercentage;
	}

	public void setPostPercentage(double postPercentage) {
		this.postPercentage = postPercentage;
	}

	public String getDaySale_date() {
		return daySale_date;
	}

	public void setDaySale_date(String daySale_date) {
		this.daySale_date = daySale_date;
	}

	public int getDaySale() {
		return daySale;
	}

	public void setDaySale(int daySale) {
		this.daySale = daySale;
	}
	

	public String getMonths() {
		return months;
	}

	public void setMonths(String months) {
		this.months = months;
	}

	public int getPay() {
		return pay;
	}

	public void setPay(int pay) {
		this.pay = pay;
	}

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public double getValue() {
		return value;
	}
	public void setValue(double value) {
		this.value = value;
	}
	
}
