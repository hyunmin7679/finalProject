package com.fp.pet.admin.service;

import java.util.List;
import java.util.Map;

import com.fp.pet.admin.domain.Chart;
import com.fp.pet.admin.domain.CommunityManage;


public interface CommunityManageService {


	public List<CommunityManage> communityList();
	
	public int dataCount(Map<String,Object>map) throws Exception;
	public List<CommunityManage> communityList2(Map<String,Object>map);
	
	public List<Chart> bestChart();
	
	public void updateShow(Map<String,Object>map);
	
}
