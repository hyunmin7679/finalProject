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
			
			String state = (String) map.get("state");
			if(state.equals("community")) {
				list = mapper.listReport(map);
				
				for (Report  report : list) {
					List<Report> Reports = mapper.listCommunity(report.getCommunityNum());
					list2.addAll(Reports);
					System.out.println("Community Number: " + report.getCommunityNum());
			    }
			}else {
				list = mapper.listReport2(map);
				for (Report  report : list) {
					List<Report> Reports = mapper.listCommunity2(report.getNum());
					list2.addAll(Reports);
					System.out.println("Community Number: " + report.getCommunityNum());
			    }
			}
			
			
			
			
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
			
			String state = (String) map.get("state");
			if(state.equals("community")) {	
				list = mapper.findReporyList(map);
			}else {
				list = mapper.findReporyList2(map);
			}
			
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
