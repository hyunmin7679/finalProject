package com.fp.pet.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.pet.admin.domain.Review;
import com.fp.pet.admin.mapper.ReviewManageMapper;

@Service
public class ReviewManageServiceImpl implements ReviewManageService{
	
	@Autowired
	public ReviewManageMapper mapper;
	
	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;

		try {
			result = mapper.dataCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Review> listReview(Map<String, Object> map) {
		List<Review> list= null;
		
		try {
			list= mapper.listReview(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
				
		return list;
	}

	@Override
	public List<Review> reviewavg(Map<String, Object> map) {
		List<Review> list= null;
		try {
			list= mapper.reviewavg(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
				
		return list;
	}

	@Override
	public int avgscore(Map<String, Object> map) {
		int avgscore = 0;

		try {
			avgscore = mapper.avgscore(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return avgscore;
	}

	@Override
	public int reviewweek(Map<String, Object> map) {
		int reviewweek=0;
		
		try {
			reviewweek=mapper.reviewweek(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return reviewweek;
	}

	@Override
	public List<Review> reviewupdown(Map<String, Object> map) {
		List<Review> list = null;
		
		try {
			list=mapper.reviewupdown(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void hidereview(int reviewnumber) throws Exception {
		
		try {
			mapper.hidereview(reviewnumber);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void reviewanswer(Map<String, Object> map) {
		try {
			mapper.reviewanswer(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void showreview(int reviewnumber) throws Exception {
		try {
			mapper.showreview(reviewnumber);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	

}
