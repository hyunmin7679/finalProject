package com.fp.pet.admin.service;

import java.util.List;
import java.util.Map;

import com.fp.pet.admin.domain.Review;

public interface ReviewManageService {
	public int dataCount(Map<String, Object> map);
	public int avgscore(Map<String, Object> map);
	public int reviewweek(Map<String, Object> map);
	
	public List<Review> listReview(Map<String, Object> map);
	public List<Review> reviewupdown(Map<String, Object> map);
	public List<Review> reviewavg(Map<String, Object> map);
	
	public void hidereview(int reviewnumber) throws Exception;
	public void showreview(int reviewnumber) throws Exception;
	public void reviewanswer(Map<String, Object>map);
}
