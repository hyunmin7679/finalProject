package com.fp.pet.service;

import java.util.List;
import java.util.Map;

import com.fp.pet.domain.Icon;

public interface UserIconService {
	// 회원정보
	public List<Icon> listIcon(long memberIdx);
	public void updateIcon1(long memberIdx);
	public void updateIcon2(Icon icon);
	public void insertIcon(long memberIdx);
	public Icon findByIcon(long memberIdx);
	
	// 아이콘 상점
	public int dataCount(Map<String, Object> map);
	public List<Icon> listIcon2(Map<String,Object>map);
	public void insertIconList(Icon vo);
	public int userPoint(long memberIdx);
	public void updateUserPoint(Icon vo);
}
