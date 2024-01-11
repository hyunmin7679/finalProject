package com.fp.pet.admin.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fp.pet.admin.domain.Chart;
import com.fp.pet.admin.domain.CommunityManage;


@Mapper
public interface CommunityManageMapper {
	
	public List<CommunityManage> communityList11();
	
	public int dataCount(Map<String,Object>map) throws Exception;
	public List<CommunityManage> communityList2(Map<String,Object>map);
	public List<Chart> bestChart();
}
