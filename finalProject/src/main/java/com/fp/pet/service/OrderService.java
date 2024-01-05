package com.fp.pet.service;

import java.util.List;
import java.util.Map;

import com.fp.pet.domain.Order;

public interface OrderService {
	public String productOrderNumber();
	public void insertOrder(Order dto) throws Exception;
	
	public Order findById(long productNum);
	public Order findPoint(long memberIdx);
	public List<Order> listProduct(List<Map<String, Long>> list);
	public Order findByDetailId(long detailNum);
	public List<Order> listOptionDetail(List<Long> detailNums);

	public void deleteCart(Map<String, Object> map) throws Exception;
}
