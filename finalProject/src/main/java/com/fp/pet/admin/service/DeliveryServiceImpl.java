package com.fp.pet.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.pet.admin.domain.OrderDetailManage;
import com.fp.pet.admin.domain.OrderManage;
import com.fp.pet.admin.mapper.DeliveryMapper;
import com.fp.pet.state.OrderState;

@Service
public class DeliveryServiceImpl implements DeliveryService{

	@Autowired
	private DeliveryMapper mapper;
	
	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = mapper.dataCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<OrderManage> listOrder(Map<String, Object> map) {
		List<OrderManage> list = null;
		
		try {
			list = mapper.listOrder(map);
			for(OrderManage dto : list) {
				dto.setOrderStateInfo(OrderState.ORDERSTATEINFO[dto.getOrderState()]);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public OrderManage findById(String orderNum) {
		OrderManage dto = null;
		
		try {
			dto = mapper.findById(orderNum);
			dto.setOrderStateInfo(OrderState.ORDERSTATEINFO[dto.getOrderState()]);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public List<OrderDetailManage> orderDetails(String orderNum) {
		List<OrderDetailManage> list = null;
		
		try {
			list = mapper.findByOrderDetails(orderNum);
			for(OrderDetailManage dto : list) {
				dto.setDetailStateInfo(OrderState.DETAILSTATEMANAGER[dto.getDetailState()]);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void updateOrder(String mode, Map<String, Object> map) throws Exception {
		try {
			System.out.println("service");
			mapper.updateOrderState(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}


}
