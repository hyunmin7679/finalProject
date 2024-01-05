package com.fp.pet.admin.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fp.pet.admin.domain.Review;

@Mapper
public interface ReviewManageMapper {
	public int dataCount(Map<String, Object> map);
	public int avgscore(Map<String, Object> map);
	public int reviewweek(Map<String, Object> map);
	
	public List<Review> listReview(Map<String, Object> map);
	public List<Review> reviewupdown(Map<String, Object> map);
	public List<Review> reviewavg(Map<String, Object> map);
	
	public void hidereview(int reviewnumber) throws SQLException;
	public void showreview(int reviewnumber) throws SQLException;
	public void reviewanswer(Map<String, Object>map);

	
}
