package com.fp.pet.admin.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.pet.admin.domain.Report;
import com.fp.pet.admin.mapper.ReportMapper;

@Service
public class ReportServiceImpl implements ReportService{

	@Autowired
	private ReportMapper mapper;
	
	@Override
	public List<Report> listReport(Map<String, Object> map) {
		List<Report> list = null;
		List<Report> list2 = new ArrayList<>();
		
		try {
			
			list = mapper.listReport(map);
			
			for (Report  report : list) {
				List<Report> communityReports = mapper.listCommunity(report.getCommunityNum());
				list2.addAll(communityReports);
				System.out.println("Community Number: " + report.getCommunityNum());
		    }
			System.out.println(list2+"list2list2list2");
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list2;
	}

	@Override
	public int dataCount(Map<String, Object> map) throws Exception {
		int result = 0;
		try {
			result = mapper.dataCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Report> findReporyList(Map<String, Object> map) {
		List<Report> list = null;
		try {
			list = mapper.findReporyList(map);
			System.out.println(list+"listlistlistlist");
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		return list;
	}

	@Override
	public void changeShow(Map<String, Object> map) throws Exception {
		try {
			mapper.changeShow(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

}
