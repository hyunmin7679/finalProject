package com.fp.pet.service;

import java.util.List;
import java.util.Map;

import com.fp.pet.domain.Coupon;

public interface CouponReceiveService {

	public List<Coupon> list(Map<String, Object> map);

	public int dataCount(Map<String, Object> map);

	public void ReceiveCoupon(Map<String, Object> map) throws Exception;
}
