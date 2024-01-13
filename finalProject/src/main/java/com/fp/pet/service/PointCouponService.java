package com.fp.pet.service;

import java.util.List;
import java.util.Map;

import com.fp.pet.domain.PointCoupon;

public interface PointCouponService {
	
	// 쿠폰
	public int dataCount(Map<String, Object>map);
	public List<PointCoupon>listCoupon(Map<String, Object>map);
	
	// 포인트
	public int dataCount2(Map<String, Object>map);
	public List<PointCoupon>listPoint(Map<String, Object>map);
	
	public int userPoint(Map<String, Object>map);

}
