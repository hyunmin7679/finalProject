package com.fp.pet.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;
 
public class Qna {
	private long num; // 문의번호
	private Long productNum;
	private long memberIdx;  
	private int secret;
	private String q_subject;
	private String question;
	private String answer;
	private String question_date;
	private String answer_date;
	private String answerId;
	private String showQuestion;
	private String identifyDay;
	
	private String userName;
	private String answerName;
	private String productName;
	private String thumbnail;
	
	private long fileNum;
	private String filename;
	private List<MultipartFile> selectFile;
	
	private String[] listFilename;

	
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
	
	public long getNum() {
		return num;
	}
	public void setNum(long num) {
		this.num = num;
	}
	public Long getProductNum() {
		return productNum;
	}
	public void setProductNum(Long productNum) {
		this.productNum = productNum;
	}
	public long getMemberIdx() {
		return memberIdx;
	}
	public void setMemberIdx(long memberIdx) {
		this.memberIdx = memberIdx;
	}
	public int getSecret() {
		return secret;
	}
	public void setSecret(int secret) {
		this.secret = secret;
	}
	public String getQ_subject() {
		return q_subject;
	}
	public void setQ_subject(String q_subject) {
		this.q_subject = q_subject;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getQuestion_date() {
		return question_date;
	}
	public void setQuestion_date(String question_date) {
		this.question_date = question_date;
	}
	public String getAnswerId() {
		return answerId;
	}
	public void setAnswerId(String answerId) {
		this.answerId = answerId;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getAnswer_date() {
		return answer_date;
	}
	public void setAnswer_date(String answer_date) {
		this.answer_date = answer_date;
	}
	public String getShowQuestion() {
		return showQuestion;
	}
	public void setShowQuestion(String showQuestion) {
		this.showQuestion = showQuestion;
	}
	public String getIdentifyDay() {
		return identifyDay;
	}
	public void setIdentifyDay(String identifyDay) {
		this.identifyDay = identifyDay;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getAnswerName() {
		return answerName;
	}
	public void setAnswerName(String answerName) {
		this.answerName = answerName;
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
	public String[] getListFilename() {
		return listFilename;
	}
	public void setListFilename(String[] listFilename) {
		this.listFilename = listFilename;
	}
	
	
}
