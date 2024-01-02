package com.fp.pet.service;

import java.util.List;
import java.util.Map;

import com.fp.pet.domain.Community;
import com.fp.pet.domain.Region;
import com.fp.pet.domain.Reply;

public interface CommunityService {
	
	public void insertCommunity (Community dto, String pathname) throws Exception;
	public void insertCommunityFile(Community dto) throws Exception;
	
	public List<Community> listCategory(Map<String, Object> map);
	
	// 리스트
	public int dataCount(Map<String, Object> map);
	public List<Community>listCommunity(Map<String, Object> map);
	public List<Community> listCommunityFile(long communityNum);
	//public Community listCommunityFile(long communityNuma); 
	
	public Community findByFileId(long fileNum);
	//public void deleteCommunity(long communityNuma) throws SQLException;
	
	// 글보기
	public void updateHitCount(long communityNum) throws Exception;
	public Community findById(long communityNum);
	public Community findByPrev(Map<String, Object> map);
	public Community findByNext(Map<String, Object> map);
	
	// 글 수정 및 삭제
	public void updateCommunity(Community dto, String pathname ) throws Exception;
	public void deleteCommunity(long communityNum, String pathname) throws Exception;
	public void deleteCommunityFile(Map<String, Object> map) throws Exception;

	// 게시글 좋아요 관련
	public void insertBoardLike(Map<String, Object> map) throws Exception;
	public void deleteBoardLike(Map<String, Object> map) throws Exception;
	public int boardLikeCount(long communityNum);
	public boolean userBoardLiked(Map<String, Object> map);
	
	// 댓글등록, 댓글 리스트, 댓글개수, 댓글삭제
	public void insertReply(Reply dto) throws Exception;
	public List<Reply> listReply(Map<String, Object> map);
	public int replyCount(Map<String, Object> map);
	public void deleteReply(Map<String, Object> map) throws Exception;
	
	// 댓글의답글 리스트, 답글개수, 댓글보이기 여부
	public List<Reply> listReplyAnswer(Map<String, Object> map);
	public int replyAnswerCount(Map<String, Object> map);
	
	public void updateReplyShowHide(Map<String, Object> map) throws Exception;	

	// 카카오맵 API
	public List<Region> listRegion();
	public List<Region> listRegion(String keyword);}
