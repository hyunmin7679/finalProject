package com.fp.pet.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fp.pet.domain.Order;
import com.fp.pet.domain.Payment;

@Mapper
public interface MyPageMapper {
	
	// 장바구니 등록, 수정
	public void insertCart(Order dto) throws SQLException;
	public void updateCart(Order dto) throws SQLException;
	
	// 장바구니 단일 검색
	public Order findByCartId(Map<String, Object> map);
	
	// 장바구니 삭제, 장바구니 만료 삭제
	public void deleteCart(Map<String, Object> map) throws SQLException;
	public void deleteCartExpiration() throws SQLException;
	
	// 장바구니 리스트
	public List<Order> listCart (String userId);
	
	
 // -------------------------------------------------------------------------------	
	
	// 주문건수, 주문리스트
	public int countPayment (Map<String, Object> map);
	public List<Payment> listPayment (Map<String, Object> map);
	public List<Payment> listCancel (Map<String, Object> map);

	// 주문 상세 상태 등록
	public void insertDetailStateInfo(Map<String, Object> map);
	
	// 주문 상세상태 수정, 주문완료 후 수정될 사항
	public void updateOrderDetailState(Map<String, Object> map) throws SQLException;
	public void updateOrderHistory(long orderDetailNum) throws SQLException;
}

