package com.fp.pet.service;

import java.util.List;
import java.util.Map;

import com.fp.pet.domain.Order;
import com.fp.pet.domain.Payment;

public interface MyPageService {
	
	// 장바구니 등록, 리스트, 삭제
	public void insertCart(Order dto) throws Exception;
	public List<Order> listCart(String userId);
	public void deleteCart(Map<String, Object> map) throws Exception;
	
	// 주문건수, 주문리스트, 주문취소 리스트
	public int countPayment(Map<String, Object> map);
	public List<Payment> listPayment(Map<String, Object> map);
	public List<Payment> listCancel(Map<String, Object> map);
	
	
	// 주문상세상태 수정, 주문 회원탈퇴여부 수정
	public void updateOrderDetailState(Map<String, Object> map) throws Exception;
	public void updateOrderHistory(long orderDetailNum) throws Exception;
	
	
}
