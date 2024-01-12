package com.fp.pet.domain;

public class Icon {
	//보유아이콘
	private long iconSeq;
	private long iconNum;
	private long memberIdx;
	private int iconUse;
	
	//
	private String iconName;
	private String iconImage;
	private int iconPrice;
	private int iconCategory;
	
	private int userPoint;
	
	
	public long getIconSeq() {
		return iconSeq;
	}
	public void setIconSeq(long iconSeq) {
		this.iconSeq = iconSeq;
	}
	public long getIconNum() {
		return iconNum;
	}
	public void setIconNum(long iconNum) {
		this.iconNum = iconNum;
	}
	public long getMemberIdx() {
		return memberIdx;
	}
	public void setMemberIdx(long memberIdx) {
		this.memberIdx = memberIdx;
	}
	public int getIconUse() {
		return iconUse;
	}
	public void setIconUse(int iconUse) {
		this.iconUse = iconUse;
	}
	public String getIconName() {
		return iconName;
	}
	public void setIconName(String iconName) {
		this.iconName = iconName;
	}
	public String getIconImage() {
		return iconImage;
	}
	public void setIconImage(String iconImage) {
		this.iconImage = iconImage;
	}
	public int getIconPrice() {
		return iconPrice;
	}
	public void setIconPrice(int iconPrice) {
		this.iconPrice = iconPrice;
	}
	public int getIconCategory() {
		return iconCategory;
	}
	public void setIconCategory(int iconCategory) {
		this.iconCategory = iconCategory;
	}
	public int getUserPoint() {
		return userPoint;
	}
	public void setUserPoint(int userPoint) {
		this.userPoint = userPoint;
	}

}
