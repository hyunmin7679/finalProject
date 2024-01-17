package com.fp.pet.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.pet.domain.Coupon;
import com.fp.pet.mapper.CouponReceiveMapper;

@Service
public class CouponReceiveServiceImpl implements CouponReceiveService{
	
	@Autowired
	private CouponReceiveMapper mapper;

	@Override
	public List<Coupon> list(Map<String, Object> map) {
		List<Coupon> list = null;
		try {
			list = mapper.list(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

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
	public void ReceiveCoupon(Map<String, Object> map) throws Exception {

		try {
			mapper.ReceiveCoupon(map) ;
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	

}
