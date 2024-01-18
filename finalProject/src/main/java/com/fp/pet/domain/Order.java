package com.fp.pet.domain;

import java.util.List;

public class Order {
	private long productNum;
	private String productName;
	private String thumbnail;
	private int price;
	private int discountRate;
	private int discountPrice;
	private int savedMoney;
	private int delivery;
	private int changeSort;
	private int detailState;
	private int changeState;

	private long memberIdx;
	private String userId;
	private long memberIdx2;

	private String orderNum;
	private long orderDetailNum;
	private String orderDate;
	private int payment;
	private int totalMoney;
	private int deliveryCharge;
	private int salePrice;
	private long detailNum;
	private String optionValue;
	private String optionValue2;
	private int qty;
	private int productMoney;

	private Long detailNum2;

	private String optionName;
	private String optionName2;
	private List<String> optionNames;
	private List<String> optionNames2;

	private List<Long> productNums;

	private List<Long> detailNums;
	private List<Long> detailNums2;
	private List<String> optionValues;
	private List<String> optionValues2;
	private List<Integer> buyQtys;
	private List<Integer> productMoneys;
	private List<Integer> prices;
	private List<Integer> salePrices;
	private List<Integer> savedMoneys;

	// 배송지 정보
	private String recipientName;
	private String tel1;
	private String tel2;
	private String tel3;
	private String tel;
	private String zip;
	private String addr1;
	private String addr2;
	private String destMemo;

	// 결제 내역 정보
	private String payMethod;
	private String cardName;
	private String authNumber;
	private String authDate;
	
	// 포인트
	private int usedSaved;
	private int totalSavedMoney;
	private int point;
	private int usePoint;
	
	private List<Integer> categoryNums;
	private List<Long> couponNums;
	private List<String> couponNames;
	private List<Integer> couponDiscounts;
	
	private int categoryNum;
	private Long couponNum;
	private String couponName;
	private int couponDiscount;
	
	private String friendname;
	private int ordersort;
	
	private List<Integer> disMoney;
	private int dismon;
	
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
	public int getDiscountPrice() {
		return discountPrice;
	}
	public void setDiscountPrice(int discountPrice) {
		this.discountPrice = discountPrice;
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
	public int getChangeSort() {
		return changeSort;
	}
	public void setChangeSort(int changeSort) {
		this.changeSort = changeSort;
	}
	public int getDetailState() {
		return detailState;
	}
	public void setDetailState(int detailState) {
		this.detailState = detailState;
	}
	public int getChangeState() {
		return changeState;
	}
	public void setChangeState(int changeState) {
		this.changeState = changeState;
	}
	public long getMemberIdx() {
		return memberIdx;
	}
	public void setMemberIdx(long memberIdx) {
		this.memberIdx = memberIdx;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
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
	public String getOptionValue2() {
		return optionValue2;
	}
	public void setOptionValue2(String optionValue2) {
		this.optionValue2 = optionValue2;
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
	public Long getDetailNum2() {
		return detailNum2;
	}
	public void setDetailNum2(Long detailNum2) {
		this.detailNum2 = detailNum2;
	}
	public String getOptionName() {
		return optionName;
	}
	public void setOptionName(String optionName) {
		this.optionName = optionName;
	}
	public String getOptionName2() {
		return optionName2;
	}
	public void setOptionName2(String optionName2) {
		this.optionName2 = optionName2;
	}
	public List<String> getOptionNames() {
		return optionNames;
	}
	public void setOptionNames(List<String> optionNames) {
		this.optionNames = optionNames;
	}
	public List<String> getOptionNames2() {
		return optionNames2;
	}
	public void setOptionNames2(List<String> optionNames2) {
		this.optionNames2 = optionNames2;
	}
	public List<Long> getProductNums() {
		return productNums;
	}
	public void setProductNums(List<Long> productNums) {
		this.productNums = productNums;
	}
	public List<Long> getDetailNums() {
		return detailNums;
	}
	public void setDetailNums(List<Long> detailNums) {
		this.detailNums = detailNums;
	}
	public List<Long> getDetailNums2() {
		return detailNums2;
	}
	public void setDetailNums2(List<Long> detailNums2) {
		this.detailNums2 = detailNums2;
	}
	public List<String> getOptionValues() {
		return optionValues;
	}
	public void setOptionValues(List<String> optionValues) {
		this.optionValues = optionValues;
	}
	public List<String> getOptionValues2() {
		return optionValues2;
	}
	public void setOptionValues2(List<String> optionValues2) {
		this.optionValues2 = optionValues2;
	}
	public List<Integer> getBuyQtys() {
		return buyQtys;
	}
	public void setBuyQtys(List<Integer> buyQtys) {
		this.buyQtys = buyQtys;
	}
	public List<Integer> getProductMoneys() {
		return productMoneys;
	}
	public void setProductMoneys(List<Integer> productMoneys) {
		this.productMoneys = productMoneys;
	}
	public List<Integer> getPrices() {
		return prices;
	}
	public void setPrices(List<Integer> prices) {
		this.prices = prices;
	}
	public List<Integer> getSalePrices() {
		return salePrices;
	}
	public void setSalePrices(List<Integer> salePrices) {
		this.salePrices = salePrices;
	}
	public List<Integer> getSavedMoneys() {
		return savedMoneys;
	}
	public void setSavedMoneys(List<Integer> savedMoneys) {
		this.savedMoneys = savedMoneys;
	}
	public String getRecipientName() {
		return recipientName;
	}
	public void setRecipientName(String recipientName) {
		this.recipientName = recipientName;
	}
	public String getTel1() {
		return tel1;
	}
	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}
	public String getTel2() {
		return tel2;
	}
	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}
	public String getTel3() {
		return tel3;
	}
	public void setTel3(String tel3) {
		this.tel3 = tel3;
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
	public String getPayMethod() {
		return payMethod;
	}
	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}
	public String getCardName() {
		return cardName;
	}
	public void setCardName(String cardName) {
		this.cardName = cardName;
	}
	public String getAuthNumber() {
		return authNumber;
	}
	public void setAuthNumber(String authNumber) {
		this.authNumber = authNumber;
	}
	public String getAuthDate() {
		return authDate;
	}
	public void setAuthDate(String authDate) {
		this.authDate = authDate;
	}
	public int getUsedSaved() {
		return usedSaved;
	}
	public void setUsedSaved(int usedSaved) {
		this.usedSaved = usedSaved;
	}
	public int getTotalSavedMoney() {
		return totalSavedMoney;
	}
	public void setTotalSavedMoney(int totalSavedMoney) {
		this.totalSavedMoney = totalSavedMoney;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getUsePoint() {
		return usePoint;
	}
	public void setUsePoint(int usePoint) {
		this.usePoint = usePoint;
	}
	public List<Integer> getCategoryNums() {
		return categoryNums;
	}
	public void setCategoryNums(List<Integer> categoryNums) {
		this.categoryNums = categoryNums;
	}
	public List<Long> getCouponNums() {
		return couponNums;
	}
	public void setCouponNums(List<Long> couponNums) {
		this.couponNums = couponNums;
	}
	public List<String> getCouponNames() {
		return couponNames;
	}
	public void setCouponNames(List<String> couponNames) {
		this.couponNames = couponNames;
	}
	public List<Integer> getCouponDiscounts() {
		return couponDiscounts;
	}
	public void setCouponDiscounts(List<Integer> couponDiscounts) {
		this.couponDiscounts = couponDiscounts;
	}
	public int getCategoryNum() {
		return categoryNum;
	}
	public void setCategoryNum(int categoryNum) {
		this.categoryNum = categoryNum;
	}
	public Long getCouponNum() {
		return couponNum;
	}
	public void setCouponNum(Long couponNum) {
		this.couponNum = couponNum;
	}
	public String getCouponName() {
		return couponName;
	}
	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}
	public int getCouponDiscount() {
		return couponDiscount;
	}
	public void setCouponDiscount(int couponDiscount) {
		this.couponDiscount = couponDiscount;
	}
	public String getFriendname() {
		return friendname;
	}
	public void setFriendname(String friendname) {
		this.friendname = friendname;
	}
	public int getOrdersort() {
		return ordersort;
	}
	public void setOrdersort(int ordersort) {
		this.ordersort = ordersort;
	}
	public long getMemberIdx2() {
		return memberIdx2;
	}
	public void setMemberIdx2(long memberIdx2) {
		this.memberIdx2 = memberIdx2;
	}
	public List<Integer> getDisMoney() {
		return disMoney;
	}
	public void setDisMoney(List<Integer> disMoney) {
		this.disMoney = disMoney;
	}
	public int getDismon() {
		return dismon;
	}
	public void setDismon(int dismon) {
		this.dismon = dismon;
	}
	
	

	
}
