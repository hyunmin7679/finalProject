package com.fp.pet.admin.domain;

public class Report {

	private long reasonNum; // 신고번호
	
	private String declUrl;
	private int reason;
	private String content;
	private String reg_date;
	private String preg_date;
	
	private String userName;
	private long memberIdx;
	
	private String productName;
	private long productNum;
	
	
	
	public String getPreg_date() {
		return preg_date;
	}
	public void setPreg_date(String preg_date) {
		this.preg_date = preg_date;
	}
	public long getReasonNum() {
		return reasonNum;
	}
	public void setReasonNum(long reasonNum) {
		this.reasonNum = reasonNum;
	}
	public String getDeclUrl() {
		return declUrl;
	}
	public void setDeclUrl(String declUrl) {
		this.declUrl = declUrl;
	}
	public int getReason() {
		return reason;
	}
	public void setReason(int reason) {
		this.reason = reason;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public long getMemberIdx() {
		return memberIdx;
	}
	public void setMemberIdx(long memberIdx) {
		this.memberIdx = memberIdx;
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
	
	
	
}
