package com.fp.pet.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fp.pet.domain.Friend;

@Mapper
public interface FriendMapper {
	public List<Friend> listFriend(Map<String, Object>map);
	public List<Friend> receivedlist(Map<String, Object>map);
	public int dataCount(Map<String, Object>map);
	
	public void addFriend(Friend dto) throws SQLException;
	public void addFriend2(Friend dto) throws SQLException;
	public void acceptFriend(Friend dto) throws SQLException;
	public void acceptFriend2(Friend dto) throws SQLException;
	public void deleteFriend(Friend dto) throws SQLException;
	public void deleteFriend2(Friend dto) throws SQLException;
	
	public List<Friend>searchMember(Map<String, Object> map);
	
	public List<Friend> listPresent(Map<String, Object>map);
}
