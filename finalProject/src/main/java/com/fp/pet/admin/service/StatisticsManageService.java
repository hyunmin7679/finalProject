package com.fp.pet.admin.service;

import java.util.List;
import java.util.Map;

import com.fp.pet.admin.domain.Chart;
import com.fp.pet.admin.domain.Icon;
import com.fp.pet.admin.domain.MainManageStatic;

public interface StatisticsManageService {


	public int todayregcount();
	public int returnProduct() ;
	public int giftProduct() ;
	public int allCommunity() ;	
	public int yestCommunity();
	
	public List<Icon> iconList() throws Exception;
	public List<Chart> paylist(String selectedYear) throws Exception;
	public List<Chart> paylist2(String beforeYear) throws Exception;
	public int currentY();
	public int beforeY();
	
	public List<Chart> dayChart(Map<String,Object> map) throws Exception;
	
	
	
	public List<MainManageStatic> catafeed(Map<String, Object>map);
	public List<MainManageStatic> catasnack(Map<String, Object>map);
	public List<MainManageStatic> catastuff(Map<String, Object>map);
	public int dataCount(); 
	public int currsales(); 
	public int lastsales(); 
	public int currpoints(); 
	public int lastpoints(); 
	public int currexpense(); 
	public int lastexpense(); 
	public int currorders(); 
	public int lastorders(); 

}
