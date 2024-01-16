package com.fp.pet.mapper;

import java.sql.SQLException;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserReportMapper {
	
	// 신고하기
	public void insertReport(Map<String, Object> map) throws SQLException; 
	public long findByproduct(long num);
	
}
