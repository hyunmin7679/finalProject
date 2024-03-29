package com.fp.pet.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fp.pet.domain.Exchange;
import com.fp.pet.domain.Order;
import com.fp.pet.domain.Payment;
import com.fp.pet.domain.Product;

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
	public Payment findIcon (Map<String, Object>map);
	
	// 주문건수, 주문리스트
	public int countPayment (Map<String, Object> map);
	public List<Payment> listPayment (Map<String, Object> map);
	public List<Payment> listCancel (Map<String, Object> map);
	public int cancelCount (Map<String, Object> map);
	
	//public int userPoint (Map<String, Object> map);
	
	// 주문상세
	public Payment findByDetail (Map<String, Object> map);
	public Payment findByDelivery (Map<String, Object> map);
	

	// 주문 상세 상태 등록
	public void insertDetailStateInfo(Map<String, Object> map);
	
	// 주문 상세상태 수정, 주문완료 후 수정될 사항
	public void updateOrderDetailState(Map<String, Object> map) throws SQLException;  // 구매확정
	public void insertPoint(Map<String, Object> map) throws SQLException;
	
	public void updateOrderDetailState2(Map<String, Object> map) throws SQLException;
	public void updateOrderHistory(long orderDetailNum) throws SQLException;
	
	// 주문취소 요청	
	public void updateorderChange (Map<String, Object> map) throws SQLException;
	
	public void insertorderChange (Map<String, Object> map) throws SQLException;
	public void insertStateInfo2 (Map<String, Object> map) throws SQLException;
	
	// ---------------------------------------------
	public void insertorderChange2 (Payment dto) throws SQLException;
	public void insertStateInfo4 (Payment dto) throws SQLException;
	public void updatedetailStateInfo2 (Payment dto) throws SQLException;
	
	public void insertReturnImg (Payment dto) throws SQLException;
	// ---------------------------------------------
	
	public void updateproductOrder (Map<String, Object> map) throws SQLException;
	public void updatedetailStateInfo (Map<String, Object> map) throws SQLException;
	
	public void addwishlist(Map<String, Object>map);
	public void deletewishlist(Map<String, Object>map);
	public int sumPoint(Map<String, Object> map);
	public int sumPoint2(Map<String, Object> map);
	
	
	
	public Product findById(long productNum);
	public List<Product> listProductOption(long productNum);
	public List<Product> listOptionDetail(long optionNum);
	public List<Product> listOptionDetailStock(Map<String, Object> map);
	public void insertOrderChange(Exchange dto)throws SQLException;
	public void updateOrderState(Exchange dto)throws SQLException;
	public void insertExchangeImg(Exchange dto)throws SQLException;

}


