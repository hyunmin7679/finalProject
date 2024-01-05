package com.fp.pet.admin.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fp.pet.admin.domain.Coupon;

@Mapper
public interface CouponMapper {
	public int dataCount(Map<String,Object>map) throws SQLException;
	public List<Coupon> listCoupon(Map<String,Object>map);
	public void insertCoupon(Coupon dto) throws SQLException;
	
	public List<Coupon> couponDetail(long sort);
	public void deleteCoupon(long couponNum) throws SQLException;

	public void updataCoupon(Map<String,Object>map) throws SQLException;
	public void updateCouponState() throws SQLException;
	
	public Coupon findByCoupon(Map<String,Object>map);
}
