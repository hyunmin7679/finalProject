package com.fp.pet.admin.service;

import java.util.List;
import java.util.Map;

import com.fp.pet.admin.domain.Icon;

public interface IconService {

	public void insertIcon(Icon dto, String pathname) throws Exception;
	public int dataCount(Map<String,Object> map) throws Exception;
	public List<Icon> listIcon(Map<String,Object>map);
	public void deleteIcon(long iconNum, String pathname) throws Exception;
	public void updateIcon(Icon dto, String path) throws Exception; 
}
