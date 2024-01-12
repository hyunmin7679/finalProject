package com.fp.pet.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.pet.domain.PointCoupon;
import com.fp.pet.mapper.PointCouponMapper;

@Service
public class PointCouponServiceImpl implements PointCouponService {
		
	@Autowired
	private PointCouponMapper mapper;

	// 쿠폰
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
	public List<PointCoupon> listCoupon(Map<String, Object> map) {
		List<PointCoupon> list = null;
		
		try {
			list = mapper.listCoupon(map);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
// -------------------------------------------------------------------------
	// 포인트
	@Override
	public int dataCount2(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.dataCount2(map);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<PointCoupon> listPoint(Map<String, Object> map) {
		List<PointCoupon> list = null;
		
		try {
			list = mapper.listPoint(map);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// 총 보유 포인트
	@Override
	public int userPoint(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.userPoint(map);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
}
