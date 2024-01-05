package com.fp.pet.admin.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Product {
	
	private String categoryName;
	private int sort;
	private int hitCount;
	private int productshow;
	private int noOption;
	private String thumbnail;
	private String content;
	
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
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


	public int getHitCount() {
		return hitCount;
	}

	public void setHitCount(int hitCount) {
		this.hitCount = hitCount;
	}

	public int getProductshow() {
		return productshow;
	}

	public void setProductshow(int productshow) {
		this.productshow = productshow;
	}

	public int getNoOption() {
		return noOption;
	}

	public void setNoOption(int noOption) {
		this.noOption = noOption;
	}

	public long getProductNum() {
		return productNum;
	}

	public void setProductNum(long productNum) {
		this.productNum = productNum;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getSpecial() {
		return special;
	}

	public void setSpecial(int special) {
		this.special = special;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getDiscountRate() {
		return discountRate;
	}

	public void setDiscountRate(int discountRate) {
		this.discountRate = discountRate;
	}

	public int getSavedMoney() {
		return savedMoney;
	}

	public void setSavedMoney(int savedMoney) {
		this.savedMoney = savedMoney;
	}

	public int getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(int salePrice) {
		this.salePrice = salePrice;
	}

	public int getDelivery() {
		return delivery;
	}

	public void setDelivery(int delivery) {
		this.delivery = delivery;
	}

	public int getProductShow() {
		return productShow;
	}

	public void setProductShow(int productShow) {
		this.productShow = productShow;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public String getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(String update_date) {
		this.update_date = update_date;
	}

	public MultipartFile getThumbnailFile() {
		return thumbnailFile;
	}

	public void setThumbnailFile(MultipartFile thumbnailFile) {
		this.thumbnailFile = thumbnailFile;
	}

	public long getCategoryNum() {
		return categoryNum;
	}

	public void setCategoryNum(long categoryNum) {
		this.categoryNum = categoryNum;
	}

	public Long getParentNum() {
		return parentNum;
	}

	public void setParentNum(Long parentNum) {
		this.parentNum = parentNum;
	}

	public long getFileNum() {
		return fileNum;
	}

	public void setFileNum(long fileNum) {
		this.fileNum = fileNum;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public List<MultipartFile> getAddFiles() {
		return addFiles;
	}

	public void setAddFiles(List<MultipartFile> addFiles) {
		this.addFiles = addFiles;
	}

	public long getOptionNum() {
		return optionNum;
	}

	public void setOptionNum(long optionNum) {
		this.optionNum = optionNum;
	}

	public String getOptionName() {
		return optionName;
	}

	public void setOptionName(String optionName) {
		this.optionName = optionName;
	}

	public Long getParent() {
		return parent;
	}

	public void setParent(Long parent) {
		this.parent = parent;
	}

	public long getOptionNum2() {
		return optionNum2;
	}

	public void setOptionNum2(long optionNum2) {
		this.optionNum2 = optionNum2;
	}

	public String getOptionName2() {
		return optionName2;
	}

	public void setOptionName2(String optionName2) {
		this.optionName2 = optionName2;
	}

	public long getDetailNum() {
		return detailNum;
	}

	public void setDetailNum(long detailNum) {
		this.detailNum = detailNum;
	}

	public String getOptionValue() {
		return optionValue;
	}

	public void setOptionValue(String optionValue) {
		this.optionValue = optionValue;
	}

	public List<Long> getDetailNums() {
		return detailNums;
	}

	public void setDetailNums(List<Long> detailNums) {
		this.detailNums = detailNums;
	}

	public List<String> getOptionValues() {
		return optionValues;
	}

	public void setOptionValues(List<String> optionValues) {
		this.optionValues = optionValues;
	}

	public long getDetailNum2() {
		return detailNum2;
	}

	public void setDetailNum2(long detailNum2) {
		this.detailNum2 = detailNum2;
	}

	public String getOptionValue2() {
		return optionValue2;
	}

	public void setOptionValue2(String optionValue2) {
		this.optionValue2 = optionValue2;
	}

	public List<Long> getDetailNums2() {
		return detailNums2;
	}

	public void setDetailNums2(List<Long> detailNums2) {
		this.detailNums2 = detailNums2;
	}

	public List<String> getOptionValues2() {
		return optionValues2;
	}

	public void setOptionValues2(List<String> optionValues2) {
		this.optionValues2 = optionValues2;
	}

	public int getTotalStock() {
		return totalStock;
	}

	public void setTotalStock(int totalStock) {
		this.totalStock = totalStock;
	}
	private String specialState;
	public String getSpecialState() {
		return specialState;
	}

	public void setSpecialState(String specialState) {
		this.specialState = specialState;
	}
	private long productNum;
	private String productName;
	private int special;
	private int price;
	private int discountRate;
	private int savedMoney;
	private int salePrice;
	private int delivery;
	private int productShow;
	private String reg_date;
	private String update_date;
	private MultipartFile thumbnailFile;
	
	private long categoryNum;
	private Long parentNum;

	private long fileNum;
	private String filename;
	private List<MultipartFile> addFiles;
	
	private long optionNum;
	private long optionNum1;
	public long getOptionNum1() {
		return optionNum1;
	}

	public void setOptionNum1(long optionNum1) {
		this.optionNum1 = optionNum1;
	}
	private String optionName;
	private Long parent;

	private long optionNum2;
	private String optionName2;
	
	private long detailNum;
	private String optionValue;
	private String optionValue1;
	public String getOptionValue1() {
		return optionValue1;
	}

	public void setOptionValue1(String optionValue1) {
		this.optionValue1 = optionValue1;
	}
	private List<Long> detailNums;
	private List<String> optionValues;

	private long detailNum2;
	private String optionValue2;
	private List<Long> detailNums2;
	private List<String> optionValues2;
	
	private int totalStock;
	private long detailNumber1;
	private long detailNumber2;
	

	public long getDetailNumber1() {
		return detailNumber1;
	}

	public void setDetailNumber1(long detailNumber1) {
		this.detailNumber1 = detailNumber1;
	}

	public long getDetailNumber2() {
		return detailNumber2;
	}

	public void setDetailNumber2(long detailNumber2) {
		this.detailNumber2 = detailNumber2;
	}
	
	
	private String optionName1;

	public String getOptionName1() {
		return optionName1;
	}

	public void setOptionName1(String optionName1) {
		this.optionName1 = optionName1;
	}
	
	private long detailNum1;

	public long getDetailNum1() {
		return detailNum1;
	}

	public void setDetailNum1(long detailNum1) {
		this.detailNum1 = detailNum1;
	}
	
}
