package com.fp.pet.admin.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class CsBoard {
	
	private int fcategorynum;
	private int fnum;
	private String fsubject;
	private String fcontent;
	private String freg_date;
	
	private int nnum;
	private String nsubject;
	private String ncontent;
	private String nreg_date;
	private int notice;
	
	private String saveFilename;
	private String originalFilename;
	private long memberIdx;
	private String reg_date;
	private int showNotice;	
	private String userId;
	
	private int qnum;
	private int productnum;
	private long qmemberIdx;
	private int secret;
	private String question;
	private String answer;
	private String answerId;
	private String question_date;
	private String answer_date;
	private int showquestion;
	private String identifyday;
	private String q_subject;
	private String productname;
	private List<MultipartFile> selectFile;
	

	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public int getQnum() {
		return qnum;
	}
	public void setQnum(int qnum) {
		this.qnum = qnum;
	}
	public int getProductnum() {
		return productnum;
	}
	public void setProductnum(int productnum) {
		this.productnum = productnum;
	}
	public long getQmemberIdx() {
		return qmemberIdx;
	}
	public void setQmemberIdx(long qmemberIdx) {
		this.qmemberIdx = qmemberIdx;
	}
	public int getSecret() {
		return secret;
	}
	public void setSecret(int secret) {
		this.secret = secret;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getAnswerId() {
		return answerId;
	}
	public void setAnswerId(String answerId) {
		this.answerId = answerId;
	}
	public String getQuestion_date() {
		return question_date;
	}
	public void setQuestion_date(String question_date) {
		this.question_date = question_date;
	}
	public String getAnswer_date() {
		return answer_date;
	}
	public void setAnswer_date(String answer_date) {
		this.answer_date = answer_date;
	}
	public int getShowquestion() {
		return showquestion;
	}
	public void setShowquestion(int showquestion) {
		this.showquestion = showquestion;
	}
	public String getIdentifyday() {
		return identifyday;
	}
	public void setIdentifyday(String identifyday) {
		this.identifyday = identifyday;
	}
	public String getQ_subject() {
		return q_subject;
	}
	public void setQ_subject(String q_subject) {
		this.q_subject = q_subject;
	}
	public int getShowNotice() {
		return showNotice;
	}
	public void setShowNotice(int showNotice) {
		this.showNotice = showNotice;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getShownotice() {
		return showNotice;
	}
	public void setShownotice(int shownotice) {
		this.showNotice = shownotice;
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
	public String getSaveFilename() {
		return saveFilename;
	}
	public void setSaveFilename(String saveFilename) {
		this.saveFilename = saveFilename;
	}
	public String getOriginalFilename() {
		return originalFilename;
	}
	public void setOriginalFilename(String originalFilename) {
		this.originalFilename = originalFilename;
	}
	public List<MultipartFile> getSelectFile() {
		return selectFile;
	}
	public void setSelectFile(List<MultipartFile> selectFile) {
		this.selectFile = selectFile;
	}
	public int getNotice() {
		return notice;
	}
	public void setNotice(int notice) {
		this.notice = notice;
	}
	public int getNnum() {
		return nnum;
	}
	public void setNnum(int nnum) {
		this.nnum = nnum;
	}
	public String getNsubject() {
		return nsubject;
	}
	public void setNsubject(String nsubject) {
		this.nsubject = nsubject;
	}
	public String getNcontent() {
		return ncontent;
	}
	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}
	public String getNreg_date() {
		return nreg_date;
	}
	public void setNreg_date(String nreg_date) {
		this.nreg_date = nreg_date;
	}
	public int getFcategorynum() {
		return fcategorynum;
	}
	public void setFcategorynum(int fcategorynum) {
		this.fcategorynum = fcategorynum;
	}
	public int getFnum() {
		return fnum;
	}
	public void setFnum(int fnum) {
		this.fnum = fnum;
	}
	public String getFsubject() {
		return fsubject;
	}
	public void setFsubject(String fsubject) {
		this.fsubject = fsubject;
	}
	public String getFcontent() {
		return fcontent;
	}
	public void setFcontent(String fcontent) {
		this.fcontent = fcontent;
	}
	public String getFreg_date() {
		return freg_date;
	}
	public void setFreg_date(String freg_date) {
		this.freg_date = freg_date;
	}
	
	
}
