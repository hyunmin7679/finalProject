package com.fp.pet.admin.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fp.pet.admin.domain.OrderDetailManage;
import com.fp.pet.admin.domain.OrderManage;

@Mapper
public interface DeliveryMapper {
	//public int orderCount(Map<String,Object>map) throws Exception;
	public List<OrderManage> listOrder(Map<String,Object>map);

	public OrderManage findById(String orderNum);
	public List<OrderDetailManage> findByOrderDetails(String orderNum);
	
	public void updateOrderState(Map<String, Object> map) throws SQLException;
}
