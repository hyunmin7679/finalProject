package com.fp.pet.admin.service;

import java.util.List;
import java.util.Map;

import com.fp.pet.admin.domain.OrderDetailManage;

public interface ExchangeService {
	public int dataCount(Map<String,Object>map) throws Exception;
	public List<OrderDetailManage> listOrder(Map<String,Object>map);
	public List<Map<String,Object>> listFile(Map<String,Object>map);

	public void updateReturnState(Map<String,Object>map) throws Exception;

}
