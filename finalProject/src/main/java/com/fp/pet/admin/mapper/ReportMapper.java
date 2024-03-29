package com.fp.pet.admin.mapper;


import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fp.pet.admin.domain.Report;

@Mapper
public interface ReportMapper {
	public List<Report> listReport(Map<String,Object>map);
	public List<Report> listReport2(Map<String,Object>map);
	
	public List<Report> findReporyList(Map<String,Object>map);
	public List<Report> findReporyList2(Map<String,Object>map);
	public int dataCount(Map<String,Object> map) throws Exception;
	
	public List<Report> listCommunity(long communityNum);
	public List<Report> listCommunity2(long communityNum);
	
	
	public void changeShow(Map<String,Object> map) throws SQLException;
	public void changeShow2(Map<String,Object> map) throws SQLException;

}
