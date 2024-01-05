package com.fp.pet.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.fp.pet.domain.Friend;

public interface FriendService {

	public int dataCount(Map<String, Object> map);
	public List<Friend>listFriend(Map<String, Object> map);
	public List<Friend> receivedlist(Map<String, Object>map);
	
	public List<Friend>searchMember(Map<String, Object> map);
	
	public void addFriend(Friend dto) throws Exception;
	public void acceptFriend(Friend dto) throws SQLException;
	public void deleteFriend(Friend dto) throws SQLException;
}
