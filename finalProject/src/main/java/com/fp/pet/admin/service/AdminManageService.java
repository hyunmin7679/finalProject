package com.fp.pet.admin.service;

import java.util.List;
import java.util.Map;

import com.fp.pet.admin.domain.Admin;

public interface AdminManageService {
	
	public int dataCount(Map<String, Object> map);
	
	public List<Admin> listAdmin(Map<String, Object>map);
	public List<Admin> adminInfo(Map<String, Object>map);
}
