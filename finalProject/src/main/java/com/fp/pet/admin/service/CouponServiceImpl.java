package com.fp.pet.admin.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.pet.admin.domain.Coupon;
import com.fp.pet.admin.mapper.CouponMapper;

@Service
public class CouponServiceImpl implements CouponService {

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
			Date currentDate = new Date();

			// SimpleDateFormat을 사용하여 String을 Date로 변환
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date startCouponDate = dateFormat.parse(dto.getStartCouponDate());
			Date endCouponDate = dateFormat.parse(dto.getEndCouponDate());
			
			// 쿠폰의 시작일 > 현재날짜
			// 3 
			
			// 쿠폰 종료일 < 현재날짜 
			// 2
			
			// 쿠폰 시작일<현재날짜<종료일
			// 0 	
			
			System.out.println(startCouponDate);
			System.out.println(endCouponDate);
			
			// 쿠폰의 시작일과 현재 날짜를 비교
			if (startCouponDate.compareTo(currentDate) > 0) {
				System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
				dto.setCouponState(3);
			}else if(endCouponDate.compareTo(currentDate) < 0){
				System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
				dto.setCouponState(2);
			}else {
				System.out.println("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
				dto.setCouponState(0);
			}
			
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

	@Override
	public void updateCoupon(Map<String, Object> map) throws Exception {
		try {
			mapper.updataCoupon(map);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public Coupon findByCoupon(Map<String, Object> map) {
		Coupon dto = null;
		try {
			dto = mapper.findByCoupon(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

}
