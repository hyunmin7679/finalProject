package com.fp.pet.admin.domain;

public class Report {

	private long reasonNum; // 신고번호

	private String declUrl; // 신고주소
	private int reason; // 신고 사유
	private String content; // 신고 내용
	private String reg_date; // 신고 날짜
	private long memberIdx; // 신고한 user
	private String reportUser;

	private String preg_date; // 게시글 등록일자
	
	private String postName; // 게시글 등록user 이름
	private String subject; // 게시글 제목
	private long communityNum; // 게시글 번호
	private int categoryNum;
	private int showNo;
	private int productNum;
	
	
	private long num ; // 
	private long showReview;
	
	
	
	public int getProductNum() {
		return productNum;
	}
	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}
	public long getShowReview() {
		return showReview;
	}
	public void setShowReview(long showReview) {
		this.showReview = showReview;
	}
	public long getNum() {
		return num;
	}
	public void setNum(long num) {
		this.num = num;
	}
	public int getShowNo() {
		return showNo;
	}
	public void setShowNo(int showNo) {
		this.showNo = showNo;
	}
	public int getCategoryNum() {
		return categoryNum;
	}
	public void setCategoryNum(int categoryNum) {
		this.categoryNum = categoryNum;
	}
	public String getReportUser() {
		return reportUser;
	}
	public void setReportUser(String reportUser) {
		this.reportUser = reportUser;
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
	public long getMemberIdx() {
		return memberIdx;
	}
	public void setMemberIdx(long memberIdx) {
		this.memberIdx = memberIdx;
	}
	public String getPreg_date() {
		return preg_date;
	}
	public void setPreg_date(String preg_date) {
		this.preg_date = preg_date;
	}
	public String getPostName() {
		return postName;
	}
	public void setPostName(String postName) {
		this.postName = postName;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public long getCommunityNum() {
		return communityNum;
	}
	public void setCommunityNum(long communityNum) {
		this.communityNum = communityNum;
	}
	
	
	
	

}
