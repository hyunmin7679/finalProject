package com.fp.pet.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Community {
	
	//커뮤니티 카테고리
	private long categoryNum;
	private String categoryName;
	private int use;
	private int showNo;
	private long parentNum;
	
	// 커뮤니티
	private long communityNum;
	private String userId;
	private String subject;
	private String content;
	private String park;
	private String reg_date;
	private int hitCount;
	private String userName;
	private String parkname;
	private int friendCount;
	
	// 아이콘
	private String iconImage;

	// 커뮤니티 파일
	private long fileNum;
	private String filename;
	private List<MultipartFile> selectFile;
	
	private String[] listFilename;
	
	private boolean deletePermit;
	
	// 좋아요
	private long memberIdx;	
	private int replyCount;
	private int boardLikeCount;
	
	private List<Double> las;
	private List<Double> mas;
	private double la;
	private double ma;
	private int distance;
	
	private String ReportUrl;

	
	public String getReportUrl() {
		return ReportUrl;
	}
	public void setReportUrl(String reportUrl) {
		ReportUrl = reportUrl;
	}
	public int getDistance() {
		return distance;
	}
	public void setDistance(int distance) {
		this.distance = distance;
	}
	public List<Double> getLas() {
		return las;
	}
	public void setLas(List<Double> las) {
		this.las = las;
	}
	public List<Double> getMas() {
		return mas;
	}
	public void setMas(List<Double> mas) {
		this.mas = mas;
	}
	public double getLa() {
		return la;
	}
	public void setLa(double la) {
		this.la = la;
	}
	public double getMa() {
		return ma;
	}
	public void setMa(double ma) {
		this.ma = ma;
	}
	public long getCategoryNum() {
		return categoryNum;
	}
	public void setCategoryNum(long categoryNum) {
		this.categoryNum = categoryNum;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public int getUse() {
		return use;
	}
	public void setUse(int use) {
		this.use = use;
	}
	public int getShowNo() {
		return showNo;
	}
	public void setShowNo(int showNo) {
		this.showNo = showNo;
	}
	public long getParentNum() {
		return parentNum;
	}
	public void setParentNum(long parentNum) {
		this.parentNum = parentNum;
	}
	public long getCommunityNum() {
		return communityNum;
	}
	public void setCommunityNum(long communityNum) {
		this.communityNum = communityNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPark() {
		return park;
	}
	public void setPark(String park) {
		this.park = park;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public int getHitCount() {
		return hitCount;
	}
	public void setHitCount(int hitCount) {
		this.hitCount = hitCount;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getParkname() {
		return parkname;
	}
	public void setParkname(String parkname) {
		this.parkname = parkname;
	}
	public int getFriendCount() {
		return friendCount;
	}
	public void setFriendCount(int friendCount) {
		this.friendCount = friendCount;
	}
	public String getIconImage() {
		return iconImage;
	}
	public void setIconImage(String iconImage) {
		this.iconImage = iconImage;
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
	public List<MultipartFile> getSelectFile() {
		return selectFile;
	}
	public void setSelectFile(List<MultipartFile> selectFile) {
		this.selectFile = selectFile;
	}
	public String[] getListFilename() {
		return listFilename;
	}
	public void setListFilename(String[] listFilename) {
		this.listFilename = listFilename;
	}
	public boolean isDeletePermit() {
		return deletePermit;
	}
	public void setDeletePermit(boolean deletePermit) {
		this.deletePermit = deletePermit;
	}
	public long getMemberIdx() {
		return memberIdx;
	}
	public void setMemberIdx(long memberIdx) {
		this.memberIdx = memberIdx;
	}
	public int getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}
	public int getBoardLikeCount() {
		return boardLikeCount;
	}
	public void setBoardLikeCount(int boardLikeCount) {
		this.boardLikeCount = boardLikeCount;
	}

}
