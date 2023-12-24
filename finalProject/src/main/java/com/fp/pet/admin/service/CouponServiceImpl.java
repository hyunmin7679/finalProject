package com.fp.pet.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.pet.admin.domain.Coupon;
import com.fp.pet.admin.mapper.CouponMapper;

@Service
public class CouponServiceImpl implements CouponService{

	@Autowired
	private CouponMapper mapper;
	
	@Override
	public int dataCount(Map<String, Object> map) throws Exception {
		int result = 0;
		try {
			result = mapper.dataCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Coupon> listCoupon(Map<String, Object> map) {
		List<Coupon> list = null;
		try {
			list = mapper.listCoupon(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return list;
	}

	@Override
	public void insertCoupon(Coupon dto) throws Exception {
		try {
			mapper.insertCoupon(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Coupon> couponDetail(long sort) {
		List<Coupon> list = null;
		try {
			list = mapper.couponDetail(sort);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void deleteCoupon(long couponNum) throws Exception {
		try {
			mapper.deleteCoupon(couponNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
