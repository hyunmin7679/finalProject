package com.fp.pet.service;

import java.sql.SQLException;
import java.util.Map;

public interface UserReportService {
	
	// 신고하기
	public void insertReport(Map<String, Object> map) throws SQLException; 

}
