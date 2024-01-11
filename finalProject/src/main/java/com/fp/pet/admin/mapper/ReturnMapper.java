package com.fp.pet.admin.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fp.pet.admin.domain.OrderDetailManage;

@Mapper
public interface ReturnMapper {
	public int orderCount(Map<String,Object>map) throws SQLException;
	public List<OrderDetailManage> listOrder(Map<String,Object>map);

	public List<Map<String, Object>> listFile(long changeNum);
	
	public int totalOrderCount(String orderNum);
	
	public void updateChange(Map<String,Object>map) throws SQLException;
	public void updateOrderDetailState(Map<String,Object>map) throws SQLException;
	public void updateOrderState(Map<String,Object>map) throws SQLException;
	public void updateOrder(Map<String,Object>map) throws SQLException;
	
	public int findByMoney(String orderNum);
	
	public void updatePoint(Map<String,Object>map) throws SQLException;

	public Map<Integer,Object> findByStock(Map<String, Object> map)throws SQLException;
	public void updateStock(Map<String,Object>map) throws SQLException;
	public void updateUsedSaved(Map<String,Object>map) throws SQLException;

	
	public void updateCoupon(Map<String,Object>map)throws SQLException;
}
