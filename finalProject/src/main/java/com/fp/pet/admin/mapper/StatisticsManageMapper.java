package com.fp.pet.admin.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fp.pet.admin.domain.Chart;
import com.fp.pet.admin.domain.Icon;
import com.fp.pet.admin.domain.MainManageStatic;

@Mapper
public interface StatisticsManageMapper {
	public int todayregcount() throws SQLException;
	public int returnProduct() throws SQLException;	
	public int giftProduct() throws SQLException;	
	public int allCommunity() throws SQLException;	
	public int yestCommunity() throws SQLException;	
	
	public int currentY() throws SQLException;	
	public int beforeY() throws SQLException;	
	
	public List<Icon> iconList() throws SQLException;

	public List<Chart> paylist(String selectedYear) throws SQLException;
	public List<Chart> paylist2(String beforeYear) throws SQLException;
	
	public List<Chart> dayChart(Map<String,Object> map)  throws SQLException;

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
