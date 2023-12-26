package com.fp.pet.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fp.pet.domain.Community;
import com.fp.pet.domain.Reply;

@Mapper
public interface CommunityMapper {
	// 커뮤니티 등록, 수정, 삭제
	public void insertCommunity(Community dto) throws SQLException;
	public void insertCommunityFile(Community dto) throws SQLException;
	public void updateCommunity(Community dto) throws SQLException;
	public void updateCommunityFile(Community dto) throws SQLException;
	public void deleteCommunity(long communityNum) throws SQLException;
	public void deleteCommunityFile(Map<String, Object> map) throws SQLException;
	
	// 리스트
	public List<Community> listCategory(Map<String, Object>map);
	public int dataCount(Map<String, Object>map);
	public List<Community> listCommunity (Map<String, Object>map);
	public void insertReviewFile(Community dto) throws SQLException;
	public Community findByFileId(long communityNum);
	public List<Community> listCommunityFile(long communityNum);
	
	// 글보기, 조회수 수정, 이전글, 다음글
	public Community findById (long communityNum);
	public void updateHitCount(long communityNum) throws SQLException;
	public Community findByPrev(Map<String, Object> map);
	public Community findByNext(Map<String, Object> map);
	
	// 좋아요 등록&삭제, 좋아요수, 게시글 좋아요 여부 
	public void insertCommunityLike(Map<String, Object> map) throws SQLException;
	public void deleteCommunityLike(Map<String, Object> map) throws SQLException;
	public int communityLikeCount(long num);
	public Community userCommunityLiked(Map<String, Object> map);
	
	// 댓글등록, 댓글 수, 댓글리스트, 댓글삭제
	public void insertReply(Reply dto) throws SQLException;
	public int replyCount(Map<String, Object> map);
	public List<Reply> listReply(Map<String, Object> map);
	public void deleteReply(Map<String, Object> map) throws SQLException;
	
	// 대댓글리스트, 대댓글수
	public List<Reply> listReplyAnswer(Map<String, Object> map);
	public int replyAnswerCount(Map<String, Object> map);
	
	// 댓글 보이기/숨기기
	public void updateReplyShowHide(Map<String, Object> map) throws SQLException;	

}
