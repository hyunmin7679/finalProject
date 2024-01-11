package com.fp.pet.admin.domain;

public class Review {
	
	private String thumbnail;
	private String productName;
	private String content;
	private String userName;
	private String userId;
	private int score;
	private String review;
	private String answer;
	private String review_date;
	private String answer_date;
	private int showreview;
	private int count_per_score;
	private int average_score;
	private int total_reviews;
	private int score_group_percentage_sum;
	private String score_group;
	private long num;
	private long memberIdx;
	
	public long getMemberIdx() {
		return memberIdx;
	}
	public void setMemberIdx(long memberIdx) {
		this.memberIdx = memberIdx;
	}
	public long getNum() {
		return num;
	}
	public void setNum(long num) {
		this.num = num;
	}
	public String getScore_group() {
		return score_group;
	}
	public void setScore_group(String score_group) {
		this.score_group = score_group;
	}
	public int getScore_group_percentage_sum() {
		return score_group_percentage_sum;
	}
	public void setScore_group_percentage_sum(int score_group_percentage_sum) {
		this.score_group_percentage_sum = score_group_percentage_sum;
	}
	public int getTotal_reviews() {
		return total_reviews;
	}
	public void setTotal_reviews(int total_reviews) {
		this.total_reviews = total_reviews;
	}
	public int getAverage_score() {
		return average_score;
	}
	public void setAverage_score(int average_score) {
		this.average_score = average_score;
	}
	public int getCount_per_score() {
		return count_per_score;
	}
	public void setCount_per_score(int count_per_score) {
		this.count_per_score = count_per_score;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getReview_date() {
		return review_date;
	}
	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}
	public String getAnswer_date() {
		return answer_date;
	}
	public void setAnswer_date(String answer_date) {
		this.answer_date = answer_date;
	}
	public int getShowreview() {
		return showreview;
	}
	public void setShowreview(int showreview) {
		this.showreview = showreview;
	}
}
