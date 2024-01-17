package com.fp.pet.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.fp.pet.admin.domain.OrderDetailManage;
import com.fp.pet.admin.mapper.CouponMapper;
import com.fp.pet.admin.mapper.OrderManageMapper;

@Service
public class TaskServiceImpl  implements TaskService{
	@Autowired
	private CouponMapper mapper;
	@Autowired
	private OrderManageMapper orderMapper;
	
	
	@Scheduled(cron="0 0 0 * * *")  // 매일 밤 00시
	@Override
	public void automaticRepeatOperation() {
		try {
			mapper.updateCouponState();
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
	}
	
	
	//@Scheduled(cron = "*/1 * * * * *") // 매 초
	@Scheduled(cron="0 0 0 * * *")  // 매일 밤 00시
	@Override
	public void automaticOrderState() {
		try {
			
			List<OrderDetailManage> list = orderMapper.findOrder();
			
			for(OrderDetailManage dto : list) {
				orderMapper.automaticOrder(dto.getOrderDetailNum());
				orderMapper.automaticOrderDetail(dto.getOrderDetailNum());
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	
	
	
}
