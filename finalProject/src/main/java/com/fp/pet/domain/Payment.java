package com.fp.pet.domain;

public class Payment {
	
	// 주문
	private String userId;

	private String priductName;
	private String thumbnail;
	private int price;
	private int discountRate;
	private int savedMoney;
	private int delivery;
	private String productName;
	private long productNum;
	
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

	// 리뷰 유무
	private int reviewWrite; // 리뷰 유무


	public int getCancelCost() {
		return cancelCost;
	}

	public void setCancelCost(int cancelCost) {
		this.cancelCost = cancelCost;
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

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPriductName() {
		return priductName;
	}

	public void setPriductName(String priductName) {
		this.priductName = priductName;
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

	public int getReviewWrite() {
		return reviewWrite;
	}

	public void setReviewWrite(int reviewWrite) {
		this.reviewWrite = reviewWrite;
	}
	
}
