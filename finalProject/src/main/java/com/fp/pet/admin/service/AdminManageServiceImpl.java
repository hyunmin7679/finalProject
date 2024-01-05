package com.fp.pet.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.pet.admin.domain.Admin;
import com.fp.pet.admin.mapper.AdminManageMapper;

@Service
public class AdminManageServiceImpl implements AdminManageService{
	
	@Autowired
	private AdminManageMapper mapper;
	
	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result=mapper.dataCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Admin> listAdmin(Map<String, Object> map) {
		List<Admin> listAdmin = null;
		
		try {
			listAdmin=mapper.listAdmin(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listAdmin;
	}

	@Override
	public List<Admin> adminInfo(Map<String, Object> map) {
		List<Admin> adminInfo = null;
		try {
			adminInfo=mapper.adminInfo(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return adminInfo;
	}
	
	

}
