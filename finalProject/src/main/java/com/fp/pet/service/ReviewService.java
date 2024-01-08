package com.fp.pet.service;

import java.util.List;
import java.util.Map;

import com.fp.pet.domain.Review;
import com.fp.pet.domain.Summary;

public interface ReviewService {
	
	// 리뷰(이미지)등록
	public void insertReview(Review dto, String pathname) throws Exception;
	
	// 별점
	public Summary findByReviewSummary(Map<String, Object>map);
	// 리스트
	public List<Review>listReview(Map<String, Object>map);
	
	// 내활동 (개수, 리스트)
	public int dataCount2(Map<String, Object>map);
	public List<Review>listReview2(Map<String, Object>map);
	
	// 리뷰 수정, 삭제
	public void updateReview(Review dto) throws Exception;
	public void deleteReview(long num, String pathname) throws Exception;

}
