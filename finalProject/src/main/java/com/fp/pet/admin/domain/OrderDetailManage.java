package com.fp.pet.admin.domain;

public class OrderDetailManage {
	private String userName;
	private long memberIdx;
	
	private long productNum;
	private String productName;
	private int price;
    private int discountRate;
    private int delivery;
    private int couponPrice;

    private String orderNum;
    private long orderDetailNum;
	private String orderDate;
	private int usedSaved;
    private int payment;
    private int totalMoney;
    private int deliveryCharge;
    private int salePrice;
	private int qty;
	private int productMoney;
	private int savedMoney;
	private int productCancelM;
	
	private long detailNum;
	private String optionValue;
	private Long detailNum2;
	private String optionValue2;
	
	private long detailNum3;
	private String optionValue3;
	private Long detailNum4;
	private String optionValue4;
	
	
	
	private int orderState;
	private String orderStateInfo;
	private int detailState;
	private String detailStateInfo;
	private String detailStateDate;
	private String stateMemo;
	private String stateDate;
	private String stateProduct;
	
	private String deliveryName; // 택배사
	private String invoiceNumber; // 송장번호
	
	private String payMethod;
	
	private String reg_date;
	private String com_date;
	private String changeSortInfo;
	private int changeSort;
	
	private String adminMemo;
	private long changeNum;
	private int cancelCost;
	private int fileNum;
	private String fileName;
	private int changeState;
	
	private long couponNum;
	
	private String zip;
	private String addr1;
	private String addr2;
	private String destMemo;
	
	
	
	
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
	public long getCouponNum() {
		return couponNum;
	}
	public void setCouponNum(long couponNum) {
		this.couponNum = couponNum;
	}
	public long getDetailNum3() {
		return detailNum3;
	}
	public void setDetailNum3(long detailNum3) {
		this.detailNum3 = detailNum3;
	}
	public String getOptionValue3() {
		return optionValue3;
	}
	public void setOptionValue3(String optionValue3) {
		this.optionValue3 = optionValue3;
	}
	public Long getDetailNum4() {
		return detailNum4;
	}
	public void setDetailNum4(Long detailNum4) {
		this.detailNum4 = detailNum4;
	}
	public String getOptionValue4() {
		return optionValue4;
	}
	public void setOptionValue4(String optionValue4) {
		this.optionValue4 = optionValue4;
	}
	public long getMemberIdx() {
		return memberIdx;
	}
	public void setMemberIdx(long memberIdx) {
		this.memberIdx = memberIdx;
	}
	public int getChangeState() {
		return changeState;
	}
	public void setChangeState(int changeState) {
		this.changeState = changeState;
	}
	public int getFileNum() {
		return fileNum;
	}
	public void setFileNum(int fileNum) {
		this.fileNum = fileNum;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public int getCancelCost() {
		return cancelCost;
	}
	public void setCancelCost(int cancelCost) {
		this.cancelCost = cancelCost;
	}
	public long getChangeNum() {
		return changeNum;
	}
	public void setChangeNum(long changeNum) {
		this.changeNum = changeNum;
	}
	public String getAdminMemo() {
		return adminMemo;
	}
	public void setAdminMemo(String adminMemo) {
		this.adminMemo = adminMemo;
	}
	public String getCom_date() {
		return com_date;
	}
	public void setCom_date(String com_date) {
		this.com_date = com_date;
	}
	public int getChangeSort() {
		return changeSort;
	}
	public void setChangeSort(int changeSort) {
		this.changeSort = changeSort;
	}
	public String getChangeSortInfo() {
		return changeSortInfo;
	}
	public void setChangeSortInfo(String changeSortInfo) {
		this.changeSortInfo = changeSortInfo;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public int getProductCancelM() {
		return productCancelM;
	}
	public void setProductCancelM(int productCancelM) {
		this.productCancelM = productCancelM;
	}
	public String getPayMethod() {
		return payMethod;
	}
	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getDetailStateDate() {
		return detailStateDate;
	}
	public void setDetailStateDate(String detailStateDate) {
		this.detailStateDate = detailStateDate;
	}
	public int getCouponPrice() {
		return couponPrice;
	}
	public void setCouponPrice(int couponPrice) {
		this.couponPrice = couponPrice;
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
	public int getDelivery() {
		return delivery;
	}
	public void setDelivery(int delivery) {
		this.delivery = delivery;
	}
	public String getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}
	public long getOrderDetailNum() {
		return orderDetailNum;
	}
	public void setOrderDetailNum(long orderDetailNum) {
		this.orderDetailNum = orderDetailNum;
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
	public int getSavedMoney() {
		return savedMoney;
	}
	public void setSavedMoney(int savedMoney) {
		this.savedMoney = savedMoney;
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
	
	
}
