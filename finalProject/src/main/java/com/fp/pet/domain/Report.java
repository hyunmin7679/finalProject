package com.fp.pet.domain;

public class Report {
	
	private long reasonNum;
	private long memberIdx;
	private String declUrl;
	private int reason; 
	private String content;
	private String reg_date;
	public long getReasonNum() {
		return reasonNum;
	}
	public void setReasonNum(long reasonNum) {
		this.reasonNum = reasonNum;
	}
	public long getMemberIdx() {
		return memberIdx;
	}
	public void setMemberIdx(long memberIdx) {
		this.memberIdx = memberIdx;
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
	

}
