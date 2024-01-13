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
	
	// 장바구니 추가 20일 이후 삭제
	public void deleteExpiration() throws Exception;
	
	// 주문건수, 주문리스트, 주문취소 리스트
	public int countPayment(Map<String, Object> map);
	public List<Payment> listPayment(Map<String, Object> map);
	public List<Payment> listCancel(Map<String, Object> map);
	public int cancelCount (Map<String, Object> map);
	
	// 주문상세 
	public Payment findByDetail(Map<String, Object> map);
	
	
	// 주문상세상태 수정, 주문 회원탈퇴여부 수정
	public void updateOrderDetailState(Map<String, Object> map) throws Exception;
	public void updateOrderDetailState2(Map<String, Object> map) throws Exception;
	public void updateOrderHistory(long orderDetailNum) throws Exception;
	
	
	// 주문취소 요청
	public void updateorderChange (Map<String, Object> map) throws Exception;  // 요청처리
	public void insertStateInfo2 (Map<String, Object> map) throws Exception;
	
	public void insertorderChange (Map<String, Object> map) throws Exception;	// 상태변경 테이블 
	public void updateproductOrder (Map<String, Object> map) throws Exception;	// 
	public void updatedetailStateInfo (Map<String, Object> map) throws Exception;

}

