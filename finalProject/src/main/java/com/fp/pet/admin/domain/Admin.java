package com.fp.pet.admin.domain;

public class Admin {
	
	private String userName;
	private String email;
	private String register_date;
	private String workstate;
	private String worknow;
	private int enabled;
	private long memberIdx;
	private String adminState;
	private String addr1;
	private String addr2;
	private String zip;
	private String tel;
	private String userPwd;
	
	
	
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getAdminState() {
		return adminState;
	}
	public void setAdminState(String adminState) {
		this.adminState = adminState;
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
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public long getMemberIdx() {
		return memberIdx;
	}
	public void setMemberIdx(long memberIdx) {
		this.memberIdx = memberIdx;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRegister_date() {
		return register_date;
	}
	public void setRegister_date(String register_date) {
		this.register_date = register_date;
	}
	public String getWorkstate() {
		return workstate;
	}
	public void setWorkstate(String workstate) {
		this.workstate = workstate;
	}
	public String getWorknow() {
		return worknow;
	}
	public void setWorknow(String worknow) {
		this.worknow = worknow;
	}
	public int getEnabled() {
		return enabled;
	}
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
	

}
