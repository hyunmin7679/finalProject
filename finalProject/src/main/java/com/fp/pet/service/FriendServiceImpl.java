package com.fp.pet.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.pet.domain.Friend;
import com.fp.pet.mapper.FriendMapper;

@Service
public class FriendServiceImpl implements FriendService {
	@Autowired
	private FriendMapper mapper;

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.dataCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Friend> listFriend(Map<String, Object> map) {
		List<Friend> list = null;
		
		try {
			list = mapper.listFriend(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Friend> searchMember(Map<String, Object> map) {
		List<Friend> list = null;
		
		try {
			list = mapper.searchMember(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void addFriend(Friend dto) throws Exception {
		
		try {
			mapper.addFriend(dto);
			mapper.addFriend2(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<Friend> receivedlist(Map<String, Object> map) {
		List<Friend> list = null;
		
		try {
			list = mapper.receivedlist(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void acceptFriend(Friend dto) throws SQLException {
		
		try {
			mapper.acceptFriend(dto);
			mapper.acceptFriend2(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void deleteFriend(Friend dto) throws SQLException {
		
		try {
			mapper.deleteFriend(dto);
			mapper.deleteFriend2(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
