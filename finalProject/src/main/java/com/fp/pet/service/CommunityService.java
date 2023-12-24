package com.fp.pet.service;

import java.util.List;
import java.util.Map;

import com.fp.pet.domain.Community;

public interface CommunityService {
	
	public void insertCommunity (Community dto, String pathname) throws Exception;
	
//	public List<Community> listCategory(Map<String, Object> map);
	
	// 리스트
	public int dataCount(Map<String, Object> map);
	public List<Community>listCommunity(Map<String, Object> map);
	public List<Community> listCommunityFile(long num); 
	
	// 글보기
	public void updateHitCount(long communityNum) throws Exception;
	public Community findById(long communityNum);
	public Community findByPrev(Map<String, Object> map);
	public Community findByNext(Map<String, Object> map);
	
	// 글 수정 및 삭제
	public void updateCommunity(Community dto, String pathname) throws Exception;
	public void deleteCommunity(long num, String pathname) throws Exception;
	public void deleteCommunityFile(long num) throws Exception;

	// 게시글 좋아요 관련
	public void insertCommunityLike(Map<String, Object> map) throws Exception;
	public void deleteCommunityLike(Map<String, Object> map) throws Exception;
	public int communityLikeCount(long num);
	public boolean userCommunityLiked(Map<String, Object> map);
}
