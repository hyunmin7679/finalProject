package com.fp.pet.admin.service;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.pet.admin.domain.OrderDetailManage;
import com.fp.pet.admin.domain.OrderManage;
import com.fp.pet.admin.mapper.OrderManageMapper;
import com.fp.pet.state.OrderState;

@Service
public class OrderManageServiceImpl implements OrderManageService {

	@Autowired
	private OrderManageMapper mapper;

	@Override
	public int dataCount(Map<String, Object> map) throws Exception {
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
			for (OrderManage dto : list) {
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
			for (OrderDetailManage dto : list) {
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
			mapper.updateOrderInvoiceNumber(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

	}

	@Override
	public List<Map<String, Object>> listDetailStateInfo(long orderDetailNum) {
		List<Map<String, Object>> list = null;
		try {
			list = mapper.listDetailStateInfo(orderDetailNum);

			String detalStateInfo;
			for (Map<String, Object> map : list) {
				int detailState = ((BigDecimal) map.get("DETAILSTATE")).intValue();
				detalStateInfo = OrderState.DETAILSTATEMANAGER[detailState];
				map.put("DETALSTATEINFO", detalStateInfo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public void cancleAllProduct(Map<String, Object> map) throws Exception {

		try {
			// 주문번호
			String orderNum = (String) map.get("orderNum");
			// 기존 취소금액
			int cancelAmount = Integer.parseInt((String) map.get("cancelAmount"));
			// 총 결제금액
			int payment = Integer.parseInt((String) map.get("payment"));
			// 포인트
			int usedSaved = Integer.parseInt((String) map.get("usedSaved"));
			int deliveryCharge = Integer.parseInt((String) map.get("deliveryCharge"));
			int memberIdx = Integer.parseInt((String) map.get("memberIdx"));
			
			System.out.println(memberIdx + "memberIdxmemberIdxmemberIdxmemberIdxmemberIdx ");
			System.out.println(orderNum+"orderNumorderNumorderNumorderNum");
			System.out.println(usedSaved+"usedSavedusedSavedusedSaved");
			
			
			
			List<OrderDetailManage> list = null;
			List<Map<String, Object>> detaillist = null;

			list = mapper.findByOrderDetails(orderNum);
			
			// 판매취소, 주문취소완료, 반품완료를 제외한 orderDetail 의 갯수 

			// 이미 주문취소 상품이 있으면
			if (list != null) {
				int index = 0;
				for (OrderDetailManage dto : list) {
					
					
					detaillist = mapper.listDetailStateInfo(dto.getOrderDetailNum());

					if (detaillist == null || detaillist.isEmpty()) {
						map.put("orderDetailNum", dto.getOrderDetailNum());
						map.put("memberIdx1", 1);
						map.put("detailState", 3);
						map.put("stateMemo", "관리자에 의한 판매취소입니다");
						mapper.insertDetailStateInfo(map);

						int productMoney = dto.getProductMoney();


						
						 if (++index == list.size()) {
				                productMoney += deliveryCharge;
				                System.out.println("여기?");
								map.put("productMoney", productMoney);
								map.put("orderDetailNum", dto.getOrderDetailNum());
								mapper.updateProductCancleAmount(map);
								
								// 쿠폰 
								long couponNum = dto.getCouponNum();
								
								if(couponNum != 0) {
									map.put("couponNum",couponNum);
									mapper.updateCoupon(map);
								}
								
								int DTOsavedMoney = dto.getSavedMoney();
								int savedMoney = -DTOsavedMoney;
								
								map.put("savedMoney",savedMoney);
								mapper.updatePoint(map);
								
								mapper.updateUsedSaved(map);
								
								map.put("productNum", dto.getProductNum());
								map.put("detailNum", dto.getDetailNum());
								map.put("detailNum2", dto.getDetailNum2());
								Map<Integer,Object> list2 = mapper.findByStock(map); 
								int qty = dto.getQty();
								
								BigDecimal stockNumBigDecimal = (BigDecimal) list2.get("STOCKNUM");
							 	int stockNum = stockNumBigDecimal.intValue();

								BigDecimal fuck = (BigDecimal) list2.get("TOTALSTOCK");
							 	int totalStock = fuck.intValue();
							 	
							 	totalStock = totalStock + qty;
							 	map.put("stockNum",stockNum);
								map.put("totalStock",totalStock);
								
								mapper.updateStock(map); 
								
				           }else {
				        	   System.out.println("아니면여기?");
								map.put("productMoney", productMoney);
								map.put("orderDetailNum", dto.getOrderDetailNum());
								mapper.updateProductCancleAmount(map);
								
								// 쿠폰 
								long couponNum = dto.getCouponNum();
								
								if(couponNum != 0) {
									map.put("couponNum",couponNum);
									mapper.updateCoupon(map);
								}
								
								int DTOsavedMoney = dto.getSavedMoney();
								int savedMoney = -DTOsavedMoney;
								
								map.put("savedMoney",savedMoney);
								mapper.updatePoint(map);
								
								map.put("productNum", dto.getProductNum());
								map.put("detailNum", dto.getDetailNum());
								map.put("detailNum2", dto.getDetailNum2());
								Map<Integer,Object> list2 = mapper.findByStock(map); 
								int qty = dto.getQty();
								
								BigDecimal stockNumBigDecimal = (BigDecimal) list2.get("STOCKNUM");
							 	int stockNum = stockNumBigDecimal.intValue();

								BigDecimal fuck = (BigDecimal) list2.get("TOTALSTOCK");
							 	int totalStock = fuck.intValue();
							 	
							 	totalStock = totalStock + qty;
							 	map.put("stockNum",stockNum);
								map.put("totalStock",totalStock);
								
								mapper.updateStock(map); 
				          }

					}

				}

			}
			// productOrder 상태 변경
			mapper.cancleAllProduct(map);

			// orderDetail 테이블 상태 변경
			mapper.cancledetailProduct(map);

			// orderNum으로 orderdetails에 상품 목록을 찾는다.
			// orderDetailNum으로 주문금액을 취소금액으로 돌린다 .
			// 만약에 검색결과가 <=1 이면 배달비를 추가해서 취소금액으로 돌려준다.

			// 취소금액을 결제 금액으로 변경시키기
			map.put("cancelAmount", payment);

			mapper.updateCancelAmount(map);

			// 적립금 사용액 돌려줘야하고 (usedSaved를 insert 해주면 되는 것이야)

			// 상품에 대한 적립금 회수(update가 아니라 받은 적립ㄱ금을delete해줘야 하는건가 ?)

			// 쿠폰 돌려줘야하고 (상태변경해주면된다. )

			// 카드 결제 취소해야하고

			// detailStateInfo 테이블에 상태 변경 내용 및 날짜 저장
			// mapper.insertDetailStateInfo(map);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public void updateOrderDetailState(Map<String, Object> map) throws Exception {
		try {

			System.out.println("일로오긴함 ? ");
			String orderNum = (String) map.get("orderNum");
			int detailState = Integer.parseInt((String) map.get("detailState"));
			int productMoney = Integer.parseInt((String) map.get("productMoney"));
			int deliveryCharge = Integer.parseInt((String) map.get("deliveryCharge"));
			int savedMoney1 = Integer.parseInt((String) map.get("savedMoney"));
			int memberIdx = Integer.parseInt((String) map.get("memberIdx"));
			int memberIdx1 = Integer.parseInt((String) map.get("memberIdx"));
			int qty = Integer.parseInt((String) map.get("qty"));
			int couponNum = Integer.parseInt((String) map.get("couponNum"));
			
			System.out.println(memberIdx + "memberIdxmemberIdxmemberIdxmemberIdxmemberIdx");
			System.out.println(memberIdx1 + "memberIdx1memberIdx1memberIdx1memberIdx1memberIdx1");
			
			System.out.println("deliveryCharge" + deliveryCharge);

			// 주문에 대한 전체 취소 금액 가져오기
			int cancelAmount = 0;
			/*
			if (detailState == 3 || detailState == 5 || detailState == 12) {
				totalCancelAmount = dao.selectOne("adminOrder.readTotalCancelAmount",
				orderNum);
				cancelAmount = Integer.parseInt((String) map.get("cancelAmount"));
			}
			*/

			// productOrder 테이블 취소금액 변경
			// 환불-개별판매취소(관리자),주문취소완료(관리자),반품완료(관리자)
			if (detailState == 3 || detailState == 5 || detailState == 12) {

				int totalOrderCount1 = mapper.totalOrderCount(orderNum);
				
				// 얘가 0원임
				cancelAmount = Integer.parseInt((String) map.get("cancelAmount"));
				System.out.println(cancelAmount + "cancelAmountcancelAmountcancelAmountcancelAmountcancelAmount");

				// 얘가 마지막 판매취소이면 배송비+주문금액을 productOrder의 주문 취소 금액을 올려준다.
				if (totalOrderCount1 <= 1) {
					cancelAmount += productMoney;
					cancelAmount += deliveryCharge;
					map.put("cancelAmount", cancelAmount);
					mapper.updateCancelAmount(map);
				} else {
					cancelAmount += productMoney;
					map.put("cancelAmount", cancelAmount);

					mapper.updateCancelAmount(map);
				}

				// 얘가 마지막 판매취소이면 배송비 + 주문금액을 orderDetail에 취소금액에 넣어준다. 
				if (totalOrderCount1 <= 1) {
					productMoney += deliveryCharge;
					map.put("productMoney", productMoney);
					mapper.updateProductCancleAmount(map);
					
					map.put("orderState", 6);
					mapper.updateOrderState(map);
				} else {
					map.put("productMoney", productMoney);
					mapper.updateProductCancleAmount(map);
				}

				
				// orderDetail 테이블 상태 변경
				mapper.updateOrderDetailState(map);

				// detailStateInfo 테이블에 상태 변경 내용 및 날짜 저장
				mapper.insertDetailStateInfo(map);

				// 쿠폰 돌려주기 
				if(couponNum != 0 ) {
					mapper.updateCoupon(map);
				}
				
				//  orderNum,memberIdx(주문자),savedMoney, usedSaved ,qty ,productNum, detailNum, detailNum2
				// 필요한 값 orderNum,memberIdx(주문자),savedMoney
				// 포인트 계산
				int savedMoney = -savedMoney1;
				map.put("savedMoney", savedMoney);
				map.put("memberIdx", memberIdx); 
				mapper.updatePoint(map);
				
				// 필요한값 orderNum,memberIdx(주문자),usedSaved
				// 만약에 마지막 전체 주문에서 마지막 주문 취소일경우 memberIdx가 사용한 적립금 만큼 memberIdx에게 돌려줘야한다
				 if (totalOrderCount1 <= 1) {
					mapper.updateUsedSaved(map); 
				 }
				
				// 필요한 값#{productNum} #{detailNum} #{detailNum2}
				// 재고 빼주기
				Map<Integer,Object> list = mapper.findByStock(map); 
				
				
				 	BigDecimal stockNumBigDecimal = (BigDecimal) list.get("STOCKNUM");
				 	int stockNum = stockNumBigDecimal.intValue();

					BigDecimal fuck = (BigDecimal) list.get("TOTALSTOCK");
				 	int totalStock = fuck.intValue();
					
				 	totalStock = totalStock + qty;
				 	map.put("stockNum",stockNum);
					map.put("totalStock",totalStock);
			
				// 필요한값 stockNum,totalStock ,qty
					mapper.updateStock(map); 
				 
				
				// 쿠폰 돌려줘야하고 (상태변경해주면된다. )



			}

			// 상품에 걸려있는 포인트 회수해야함

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

	}

}
