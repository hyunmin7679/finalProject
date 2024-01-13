package com.fp.pet.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fp.pet.domain.PointCoupon;

@Mapper
public interface PointCouponMapper {
	
	// 쿠폰 데이터개수 
	public int dataCount(Map<String, Object>map);
	// 내 쿠폰리스트
	public List<PointCoupon>listCoupon(Map<String, Object>map);
	
// -----------------------------------------------------------------	
	
	// 포인트 내역 데이터개수
	public int dataCount2(Map<String, Object>map);
	// 포인트 내역 리스트
	public List<PointCoupon>listPoint(Map<String, Object>map);
	
	// 총 보유 포인트
	public int userPoint(Map<String, Object>map);

}
