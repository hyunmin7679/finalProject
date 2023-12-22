package com.fp.pet.admin.domain;

import org.springframework.web.multipart.MultipartFile;

public class Icon {

	private long iconNum;
	private String iconName;
	private String iconImage;
	private int iconPrice;
	private String iconCategory;

	private MultipartFile selectFile;

	public long getIconNum() {
		return iconNum;
	}

	public void setIconNum(long iconNum) {
		this.iconNum = iconNum;
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

	public String getIconCategory() {
		return iconCategory;
	}

	public void setIconCategory(String iconCategory) {
		this.iconCategory = iconCategory;
	}

	public MultipartFile getSelectFile() {
		return selectFile;
	}

	public void setSelectFile(MultipartFile selectFile) {
		this.selectFile = selectFile;
	}

}
