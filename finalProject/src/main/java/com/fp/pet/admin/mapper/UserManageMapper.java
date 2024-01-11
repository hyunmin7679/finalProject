package com.fp.pet.admin.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fp.pet.domain.Member;
import com.fp.pet.domain.Purchase;

@Mapper
public interface UserManageMapper {
	
	public int dataCount(Map<String, Object> map) throws SQLException;
	public int dataCountpurchase(Map<String, Object> map) throws SQLException;
	public int userCount(Map<String, Object> map) throws SQLException;
	public int todayregcount(Map<String, Object> map) throws SQLException;
	public int yesterdayregcount(Map<String, Object> map) throws SQLException;	
	public int activeuserCount(Map<String, Object> map) throws SQLException;
	public int activeuserCountlastweek(Map<String, Object> map) throws SQLException;
	public int deactiveuserCount(Map<String, Object> map) throws SQLException;
	public int purchaseUserCount(Map<String, Object> map) throws SQLException;
	public int purchaseUserCountweekbefore(Map<String, Object> map) throws SQLException;
	public int findpoint(long memberIdx);
	public List<Member> listUser(Map<String, Object> map);
	public List<Member> listUserinfo(Map<String, Object> map);
	public List<Purchase> catanaly(Map<String, Object> map);
	public List<Purchase> purchaselist(Map<String, Object> map);
	
	public void sancUser(Map<String, Object> map)throws SQLException;
	public void unsancUser(Map<String, Object> map)throws SQLException;


}
