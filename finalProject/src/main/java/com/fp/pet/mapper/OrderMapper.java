package com.fp.pet.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.fp.pet.domain.Order;


public interface OrderMapper {
	public String findByMaxOrderNumber();
	
	public void insertOrder(Order dto) throws SQLException;
	public void insertPayDetail(Order dto) throws SQLException;
	public void insertOrderDetail(Order dto) throws SQLException;
	public void insertOrderDetail2(Order dto) throws SQLException;
	public void insertOrderDelivery(Order dto) throws SQLException;
	public void stockReduction(Order dto) throws SQLException;
	
	public void earnPoints(Order dto) throws SQLException;
	public void usePoints(Order dto) throws SQLException;
	public Order memberPoint(long memberIdx);
	
	public List<Order> listProduct(List<Map<String, Long>> list);
	public Order findById(long productNum);
	public List<Order> listOptionDetail(List<Long> detailNums);
	public Order findByDetailId(long detailNum);
	
	public List<Order> findByCoupon(Order dto);
	public void useCoupon(Order dto) throws SQLException;
	
	public void insertPresent(Order dto) throws SQLException;
	public Order findByOrderNum(String orderNum);
	public void updateOrderDetail(Order dto) throws SQLException;
	
	public void usePresent(Order dto) throws SQLException;
	
}
