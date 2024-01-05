package com.fp.pet.admin.service;

import java.util.List;
import java.util.Map;

import com.fp.pet.domain.Member;
import com.fp.pet.domain.Purchase;


public interface UserManageService {
	
	public int dataCount(Map<String, Object> map);
	public int userCount(Map<String, Object> map);
	public int todayregcount(Map<String, Object> map);
	public int yesterdayregcount(Map<String, Object> map);
	public int activeuserCount(Map<String, Object> map) ;
	public int activeuserCountlastweek(Map<String, Object> map) ;
	public int deactiveuserCount(Map<String, Object> map) ;
	public int purchaseUserCount(Map<String, Object> map) ;
	public int purchaseuserCountweekbefore(Map<String, Object> map) ;
	
	public List<Member> listUser(Map<String, Object> map);
	public List<Member> listUserinfo(Map<String, Object> map);
	public List<Purchase> catanaly(Map<String, Object> map);
	public List<Purchase> purchaselist(Map<String, Object> map);
	
	public void sancuser(Map<String, Object> map);
	public void unsancuser(Map<String, Object> map);
	
}
