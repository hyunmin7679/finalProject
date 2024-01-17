package com.fp.pet.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fp.pet.domain.Coupon;

@Mapper
public interface CouponReceiveMapper {
	
	public List<Coupon> list(Map<String, Object> map);

	public int dataCount(Map<String, Object> map);
	public void ReceiveCoupon(Map<String, Object> map)throws SQLException;


}
