package com.fp.pet.admin.service;

import java.util.List;
import java.util.Map;

import com.fp.pet.admin.domain.Report;

public interface ReportService {
	public List<Report> listReport(Map<String,Object>map);
	public int dataCount(Map<String,Object> map) throws Exception;
}
