package com.fp.pet.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.fp.pet.admin.mapper.CouponMapper;

@Service
public class TaskServiceImpl  implements TaskService{
	@Autowired
	private CouponMapper mapper;

	@Scheduled(cron="0 0 0 * * *")  // 매일 밤 00시
	@Override
	public void automaticRepeatOperation() {
		try {
			mapper.updateCouponState();
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
	}
	
	
	
}
