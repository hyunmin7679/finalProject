package com.fp.pet.admin.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fp.pet.admin.domain.Report;

@Mapper
public interface ReportMapper {
	public List<Report> listReport(Map<String,Object>map);
	public int dataCount(Map<String,Object> map) throws Exception;

}
