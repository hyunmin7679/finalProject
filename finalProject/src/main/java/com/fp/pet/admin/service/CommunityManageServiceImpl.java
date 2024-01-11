package com.fp.pet.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.pet.admin.domain.Chart;
import com.fp.pet.admin.domain.CommunityManage;
import com.fp.pet.admin.mapper.CommunityManageMapper;

@Service
public class CommunityManageServiceImpl  implements CommunityManageService{
	
	@Autowired
	private CommunityManageMapper mapper;

	@Override
	public List<CommunityManage> communityList() {
		List<CommunityManage>  list = null;
		try {
			list = mapper.communityList11();			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List<CommunityManage> communityList2(Map<String,Object> map) {
		List<CommunityManage>  list = null;
		try {
			list = mapper.communityList2(map);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Chart> bestChart() {
		 List<Chart> list = null;
		 try {
			list = mapper.bestChart();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) throws Exception {
		int result = 0 ;
		try {
			result = mapper.dataCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
}
