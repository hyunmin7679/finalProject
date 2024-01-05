package com.fp.pet.admin.service;

import java.util.List;
import java.util.Map;

import com.fp.pet.admin.domain.OrderDetailManage;
import com.fp.pet.admin.domain.OrderManage;

public interface DeliveryService {
	public int orderCount(Map<String,Object>map) throws Exception;
	public List<OrderManage> listOrder(Map<String,Object>map);
	
	public OrderManage findById(String orderNum);
	public List<OrderDetailManage> orderDetails(String orderNum);
	
	public void updateOrder(String mode, Map<String, Object> map) throws Exception;
}
