package com.fp.pet.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Payment {
	
	// 주문
	private String userId;
	private long memberIdx;
	private String iconImage;

	private String thumbnail;
	private int price;
	private int discountRate;
	private int savedMoney;
	private int delivery;
	private String productName;
	private long productNum;
	private String from_friend;
	
	// 주문상세
	private long orderDetailNum;
	private String orderNum;
	private String orderDate;
	private int usedSaved;
	private int payment;
	private int totalMoney;
	private int deliveryCharge;
	private int salePrice;
	private int qty;
	private int productMoney;
	
	private int couponPrice;
	private int orderSort; 
	
	private String payMethod;
	private String recipientName;
	private String tel;
	private String zip;
	private String addr1;
	private String addr2;
	private String destMemo;
	
	private String userMemo;
	
	

	// 주문상세의 옵션
	private long detailNum;
	private String optionValue;
	private Long detailNum2;
	private String optionValue2;

	// 주문 상세 상태
	private int orderState;
	private String orderStateInfo;
	private int detailState;
	private String detailStateInfo;
	private String stateMemo;
	private String stateDate;
	private String stateProduct;

	// 주문완료 후 주문수정될 사항
	private String orderStateDate; // 상태변경일
	private String deliveryName; // 배송업체
	private String invoiceNumber; // 송장 번호
	private long afterDelivery; // 배송완료 후 날짜
	
	// 주문취소
	private String reg_date;
	private String changeSortInfo;
	private int changeSort;
	private String com_date;
	private int changeState;
	private String changeStateInfo;
	private int cancelCost;
	
	private List<MultipartFile> selectFile;
	private String filename;

	// 리뷰 유무
	private int reviewWrite; // 리뷰 유무
	
	

	public String getFrom_friend() {
		return from_friend;
	}

	public void setFrom_friend(String from_friend) {
		this.from_friend = from_friend;
	}

	public String getIconImage() {
		return iconImage;
	}

	public void setIconImage(String iconImage) {
		this.iconImage = iconImage;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public long getMemberIdx() {
		return memberIdx;
	}

	public void setMemberIdx(long memberIdx) {
		this.memberIdx = memberIdx;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
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

	public int getDelivery() {
		return delivery;
	}

	public void setDelivery(int delivery) {
		this.delivery = delivery;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public long getProductNum() {
		return productNum;
	}

	public void setProductNum(long productNum) {
		this.productNum = productNum;
	}

	public long getOrderDetailNum() {
		return orderDetailNum;
	}

	public void setOrderDetailNum(long orderDetailNum) {
		this.orderDetailNum = orderDetailNum;
	}

	public String getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public int getUsedSaved() {
		return usedSaved;
	}

	public void setUsedSaved(int usedSaved) {
		this.usedSaved = usedSaved;
	}

	public int getPayment() {
		return payment;
	}

	public void setPayment(int payment) {
		this.payment = payment;
	}

	public int getTotalMoney() {
		return totalMoney;
	}

	public void setTotalMoney(int totalMoney) {
		this.totalMoney = totalMoney;
	}

	public int getDeliveryCharge() {
		return deliveryCharge;
	}

	public void setDeliveryCharge(int deliveryCharge) {
		this.deliveryCharge = deliveryCharge;
	}

	public int getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(int salePrice) {
		this.salePrice = salePrice;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public int getProductMoney() {
		return productMoney;
	}

	public void setProductMoney(int productMoney) {
		this.productMoney = productMoney;
	}

	public int getCouponPrice() {
		return couponPrice;
	}

	public void setCouponPrice(int couponPrice) {
		this.couponPrice = couponPrice;
	}

	public int getOrderSort() {
		return orderSort;
	}

	public void setOrderSort(int orderSort) {
		this.orderSort = orderSort;
	}

	public String getPayMethod() {
		return payMethod;
	}

	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}

	public String getRecipientName() {
		return recipientName;
	}

	public void setRecipientName(String recipientName) {
		this.recipientName = recipientName;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getDestMemo() {
		return destMemo;
	}

	public void setDestMemo(String destMemo) {
		this.destMemo = destMemo;
	}

	public String getUserMemo() {
		return userMemo;
	}

	public void setUserMemo(String userMemo) {
		this.userMemo = userMemo;
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

	public Long getDetailNum2() {
		return detailNum2;
	}

	public void setDetailNum2(Long detailNum2) {
		this.detailNum2 = detailNum2;
	}

	public String getOptionValue2() {
		return optionValue2;
	}

	public void setOptionValue2(String optionValue2) {
		this.optionValue2 = optionValue2;
	}

	public int getOrderState() {
		return orderState;
	}

	public void setOrderState(int orderState) {
		this.orderState = orderState;
	}

	public String getOrderStateInfo() {
		return orderStateInfo;
	}

	public void setOrderStateInfo(String orderStateInfo) {
		this.orderStateInfo = orderStateInfo;
	}

	public int getDetailState() {
		return detailState;
	}

	public void setDetailState(int detailState) {
		this.detailState = detailState;
	}

	public String getDetailStateInfo() {
		return detailStateInfo;
	}

	public void setDetailStateInfo(String detailStateInfo) {
		this.detailStateInfo = detailStateInfo;
	}

	public String getStateMemo() {
		return stateMemo;
	}

	public void setStateMemo(String stateMemo) {
		this.stateMemo = stateMemo;
	}

	public String getStateDate() {
		return stateDate;
	}

	public void setStateDate(String stateDate) {
		this.stateDate = stateDate;
	}

	public String getStateProduct() {
		return stateProduct;
	}

	public void setStateProduct(String stateProduct) {
		this.stateProduct = stateProduct;
	}

	public String getOrderStateDate() {
		return orderStateDate;
	}

	public void setOrderStateDate(String orderStateDate) {
		this.orderStateDate = orderStateDate;
	}

	public String getDeliveryName() {
		return deliveryName;
	}

	public void setDeliveryName(String deliveryName) {
		this.deliveryName = deliveryName;
	}

	public String getInvoiceNumber() {
		return invoiceNumber;
	}

	public void setInvoiceNumber(String invoiceNumber) {
		this.invoiceNumber = invoiceNumber;
	}

	public long getAfterDelivery() {
		return afterDelivery;
	}

	public void setAfterDelivery(long afterDelivery) {
		this.afterDelivery = afterDelivery;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public String getChangeSortInfo() {
		return changeSortInfo;
	}

	public void setChangeSortInfo(String changeSortInfo) {
		this.changeSortInfo = changeSortInfo;
	}

	public int getChangeSort() {
		return changeSort;
	}

	public void setChangeSort(int changeSort) {
		this.changeSort = changeSort;
	}

	public String getCom_date() {
		return com_date;
	}

	public void setCom_date(String com_date) {
		this.com_date = com_date;
	}

	public int getChangeState() {
		return changeState;
	}

	public void setChangeState(int changeState) {
		this.changeState = changeState;
	}

	public String getChangeStateInfo() {
		return changeStateInfo;
	}

	public void setChangeStateInfo(String changeStateInfo) {
		this.changeStateInfo = changeStateInfo;
	}

	public int getCancelCost() {
		return cancelCost;
	}

	public void setCancelCost(int cancelCost) {
		this.cancelCost = cancelCost;
	}

	public List<MultipartFile> getSelectFile() {
		return selectFile;
	}

	public void setSelectFile(List<MultipartFile> selectFile) {
		this.selectFile = selectFile;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public int getReviewWrite() {
		return reviewWrite;
	}

	public void setReviewWrite(int reviewWrite) {
		this.reviewWrite = reviewWrite;
	}

}
