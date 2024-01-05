package com.fp.pet.admin.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fp.pet.admin.domain.Admin;

@Mapper
public interface AdminManageMapper {
	
	public int dataCount(Map<String, Object> map) throws SQLException;
	
	public List<Admin> listAdmin(Map<String, Object> map);
	public List<Admin> adminInfo(Map<String, Object> map);
	
}
