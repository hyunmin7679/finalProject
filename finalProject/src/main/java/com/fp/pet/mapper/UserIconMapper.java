package com.fp.pet.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.fp.pet.domain.Icon;

public interface UserIconMapper {
	// 회원정보용
	public List<Icon> listIcon(long memberIdx);
	public void updateIcon1(long memberIdx);
	public void updateIcon2(Icon icon);
	public void insertIcon(long memberIdx);
	public Icon findByIcon(long memberIdx);
	
	// 아이콘상점용
	public void insertIconList(Icon vo) throws SQLException;
	public int dataCount(Map<String,Object> map) throws Exception;
	public List<Icon> listIcon2(Map<String,Object>map);
	public int userPoint(long memberIdx);
	public void updateUserPoint(Icon vo);
	
}
