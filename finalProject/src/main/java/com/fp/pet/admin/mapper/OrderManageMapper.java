package com.fp.pet.admin.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fp.pet.admin.domain.OrderDetailManage;
import com.fp.pet.admin.domain.OrderManage;

@Mapper
public interface OrderManageMapper {
	public int dataCount(Map<String,Object>map) throws SQLException;
	public List<OrderManage> listOrder(Map<String,Object>map);

	public OrderManage findById(String orderNum);
	public List<OrderDetailManage> findByOrderDetails(String orderNum);
	
	public void updateOrderInvoiceNumber(Map<String, Object> map) throws SQLException;
	public void cancleAllProduct(Map<String, Object> map) throws Exception;
	public void cancledetailProduct(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> listDetailStateInfo(long orderDetailNum);
	public void updateOrderDetailState(Map<String, Object> map) throws SQLException;

	// insertDetailStateInfo, updateCancelAmount, totalOrderCount, updateOrderState
	public void insertDetailStateInfo(Map<String, Object> map) throws SQLException;
	public void updateCancelAmount(Map<String, Object> map) throws SQLException;
	public void updateProductCancleAmount(Map<String, Object> map) throws SQLException;
	public int totalOrderCount(String orderNum);
	public void updateOrderState(Map<String, Object> map) throws SQLException;

	
	public void updatePoint(Map<String,Object>map) throws SQLException;
	public Map<Integer,Object> findByStock(Map<String, Object> map)throws SQLException;
	public void updateUsedSaved(Map<String,Object>map) throws SQLException;
	public void updateStock(Map<String,Object>map) throws SQLException;
	public void updateCoupon(Map<String,Object>map)throws SQLException;
	// public void automaticOrder();
	public List<OrderDetailManage> findOrder();
	public void automaticOrder(long orderDetailNum);
	public void automaticOrderDetail(long orderDetailNum);
	public void automaticInsertPoint(Map<String, Object> map);
	public void insertPoint(Map<String, Object> map);

}
