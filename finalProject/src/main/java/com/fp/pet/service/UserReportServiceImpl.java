package com.fp.pet.service;

import java.sql.SQLException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.pet.mapper.UserReportMapper;

@Service
public class UserReportServiceImpl implements UserReportService{
	
	@Autowired
	private UserReportMapper mapper;

	// 신고하기
	@Override
	public void insertReport(Map<String, Object> map) throws SQLException {
		try {
			mapper.insertReport(map);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

}
