package com.fp.pet.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fp.pet.domain.Review;
import com.fp.pet.domain.Summary;

@Mapper
public interface ReviewMapper {
	
	// 리뷰, 파일 등록
	public void insertReview (Review dto) throws SQLException;
	public void insertReviewFile (Review dto) throws SQLException;
	
	// 별점
	public Summary findByReviewSummary (Map<String, Object>map);
	// 리스트
	public List<Review>listReview(Map<String, Object>map);

	// 내 활동에 리뷰 리스트
	public int dataCount2(Map<String, Object>map);
	public List<Review>listReview2(Map<String, Object>map);
	
	// 리뷰수정
	public void updateReview(Review dto) throws SQLException;
	
	// 리뷰 파일리스트 , 삭제
	public List<Review>listReviewFile(long num);
	public void deleteReview(long num) throws SQLException;
	
}
