package com.fp.pet.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.pet.admin.domain.Report;
import com.fp.pet.admin.mapper.ReportMapper;

@Service
public class ReportServiceImpl implements ReportService{

	@Autowired
	private ReportMapper mappper;
	
	@Override
	public List<Report> listReport(Map<String, Object> map) {
		List<Report> list = null;
		try {
			list = mappper.listReport(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
