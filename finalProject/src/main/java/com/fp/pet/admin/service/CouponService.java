package com.fp.pet.admin.service;

import java.util.List;
import java.util.Map;

import com.fp.pet.admin.domain.Coupon;

public interface CouponService {
	public int dataCount(Map<String,Object>map) throws Exception;
	public List<Coupon> listCoupon(Map<String,Object>map);
	public void insertCoupon(Coupon dto) throws Exception;
	
	public List<Coupon> couponDetail(long sort);
	
	public void deleteCoupon(long couponNum) throws Exception;
	
	public void updateCoupon(Map<String,Object>map) throws Exception;
	public Coupon findByCoupon(Map<String,Object>map) ;
}
