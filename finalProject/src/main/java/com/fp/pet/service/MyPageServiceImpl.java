package com.fp.pet.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.pet.domain.Order;
import com.fp.pet.domain.Payment;
import com.fp.pet.mapper.MyPageMapper;
import com.fp.pet.state.OrderState;

@Service
public class MyPageServiceImpl implements MyPageService {

	@Autowired
	private MyPageMapper mapper;
	
	// 장바구니 등록
	@Override
	public void insertCart(Order dto) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", dto.getUserId());
		
		try {
			for(int i = 0; i < dto.getProductNums().size(); i++) {
				map.put("detailNum2", dto.getDetailNums2().get(i));  // 옵션's
				
				dto.setProductNum(dto.getProductNums().get(i));   // 상품번호's
				dto.setDetailNum(dto.getDetailNums().get(i));    // 상세옵션1's
				dto.setDetailNum2(dto.getDetailNums2().get(i));  // 상세옵션2's
				dto.setQty(dto.getBuyQtys().get(i));			 // 수량's
				
				if(mapper.findByCartId(map) == null) {
					mapper.insertCart(dto);
				} else {
					mapper.updateCart(dto);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	// 장바구니 리스트
	@Override
	public List<Order> listCart(String userId) {
		List<Order> list = null;
		
		try {
			list = mapper.listCart(userId);
			
			// 할인된 상품
			for(Order dto : list) {
				int  discountPrice = 0;
				if(dto.getDiscountPrice() > 0) {
					discountPrice = (int)(dto.getPrice() * (dto.getDiscountPrice()/100.0));
					dto.setDiscountPrice(discountPrice);
				}
				dto.setSalePrice(dto.getPrice() - discountPrice);
				dto.setProductMoney(dto.getSalePrice() - dto.getQty());
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// 장바구니 삭제
	@Override
	public void deleteCart(Map<String, Object> map) throws Exception {
		try {
			mapper.deleteCart(map);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
    }

// ---------------------------------------------------------------------------------	
	
	// 주문건수
	@Override
	public int countPayment(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.countPayment(map);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	// 주문내역 리스트
	@Override
	public List<Payment> listPayment(Map<String, Object> map) {
		
		List<Payment> list = null;		
		// OrderState.ORDERSTATEINFO : 주문상태 정보
		// OrderState.DETAILSTATEINFO : 주문상세상태 정보
		try {
			String productState; 
			
			list = mapper.listPayment(map);
			
			Date endDate = new Date();
			long gap;
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			
			for(Payment dto : list) {
				//dto.setOrderDate(dto.getOrderDate().replaceAll("-", ".").substring(5,10));
				dto.setOrderStateInfo(OrderState.ORDERSTATEINFO[dto.getOrderState()]);    // 주문상태 정보들
				dto.setDetailStateInfo(OrderState.DETAILSTATEINFO[dto.getDetailState()]);  // 주문상세상태 정보들
				
				productState = OrderState.ORDERSTATEINFO[dto.getOrderState()];
				if(dto.getDetailState() > 0) {   // 주문상태가 구매확정대기가 아니면
					productState = OrderState.DETAILSTATEINFO[dto.getOrderState()];
				}
				dto.setStateProduct(productState);  // 주문상세상태 정보 넣기
	
				if(dto.getOrderState() == 5 && dto.getStateDate() != null) {  // 주문취소완료면
					Date beginDate = formatter.parse(dto.getStateDate());
					gap = (endDate.getTime() - beginDate.getTime()) / (24 * 60 * 60 * 1000);
					dto.setAfterDelivery(gap);
					
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	// 주문상세상태 수정
	@Override
	public void updateOrderDetailState(Map<String, Object> map) throws Exception {
		try {
			// 주문상세 테이블 상태 변경
			mapper.updateOrderDetailState(map);
			
			// 주문상세 상태 정보 테이블에 상태 변경 내용 및 날짜 저장
			mapper.insertDetailStateInfo(map);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	// 주문내역에 회원탈퇴여부
	@Override
	public void updateOrderHistory(long orderDetailNum) throws Exception {
		try {
			mapper.updateOrderHistory(orderDetailNum);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	// 주문취소 리스트
	@Override
	public List<Payment> listCancel(Map<String, Object> map) {
		List<Payment> list = null;
		
		try {
			list = mapper.listCancel(map);
			
			for(Payment dto : list) {
				//dto.setReg_date(dto.getReg_date().replaceAll("-", ".").substring(5,10));
				//dto.setCom_date(dto.getCom_date().replaceAll("-", ".").substring(5,10));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	

}
