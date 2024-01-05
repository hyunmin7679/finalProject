package com.fp.pet.admin.service;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.pet.admin.domain.OrderDetailManage;
import com.fp.pet.admin.mapper.ReturnMapper;
import com.fp.pet.state.OrderState;

@Service
public class ReturnServiceImpl implements ReturnService{
	@Autowired
	private ReturnMapper mapper;

	@Override
	public List<OrderDetailManage> listOrder(Map<String, Object> map) {
		List<OrderDetailManage> list = null;
		try {
			list = mapper.listOrder(map);
			for (OrderDetailManage dto : list) {
				dto.setDetailStateInfo(OrderState.DETAILSTATEMANAGER[dto.getDetailState()]);
			}
			for (OrderDetailManage dto : list) {
				dto.setChangeSortInfo(OrderState.GHANGESORTINFO[dto.getChangeSort()]);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Map<String, Object>> listFile(Map<String, Object> map) {
		List<Map<String,Object>> list = null;
		try {
			long changeNum = Integer.parseInt((String) map.get("changeNum"));
			list = mapper.listFile(changeNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	@SuppressWarnings("unlikely-arg-type")
	public void updateReturnState(Map<String, Object> map) throws Exception {
			try {
				
				String orderNum = (String)map.get("orderNum");
				int cancelCost = Integer.parseInt((String) map.get("cancelCost"));
				int changeNum = Integer.parseInt((String) map.get("changeNum"));
				int orderDetailNum = Integer.parseInt((String) map.get("orderDetailNum"));
				int changeState = Integer.parseInt((String) map.get("changeState"));
				int PchangeState = Integer.parseInt((String) map.get("PchangeState"));
				int deliveryCharge = Integer.parseInt((String) map.get("deliveryCharge"));
				
				
				int productNum = Integer.parseInt((String) map.get("productNum"));
				int detailNum = Integer.parseInt((String) map.get("detailNum"));
				int detailNum2 = Integer.parseInt((String) map.get("detailNum2"));
				int memberIdx = Integer.parseInt((String) map.get("memberIdx"));
				
				int savedMoney1 = Integer.parseInt((String) map.get("savedMoney"));
				int usedSaved = Integer.parseInt((String) map.get("usedSaved"));

				int qty = Integer.parseInt((String) map.get("qty"));
				
				System.out.println(usedSaved+"usedSavedusedSavedusedSavedusedSaved");
				System.out.println(cancelCost+"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
				System.out.println(orderNum+"orderNumorderNumorderNumorderNumorderNum");
				System.out.println(changeNum+"changeNumchangeNumchangeNumchangeNum");
				System.out.println(orderDetailNum+"orderDetailNumorderDetailNumorderDetailNumorderDetailNumorderDetailNum");
				System.out.println(changeState+"changeStatechangeStatechangeStatechangeState");
				System.out.println(PchangeState+"PchangeStatePchangeStatePchangeStatePchangeState");
				System.out.println(deliveryCharge+"deliveryChargedeliveryChargedeliveryChargedeliveryChargedeliveryCharge");
				
				
				System.out.println(productNum+"productNumproductNumproductNumproductNumproductNum");
				System.out.println(detailNum+"detailNumdetailNumdetailNumdetailNumdetailNum");
				System.out.println(detailNum2+"detailNum2detailNum2detailNum2detailNum2detailNum2");
				System.out.println(memberIdx+"memberIdxmemberIdxmemberIdxmemberIdxmemberIdx");
				System.out.println(savedMoney1+"savedMoney1savedMoney1savedMoney1savedMoney1savedMoney1savedMoney1");
				System.out.println(qty+"qtyqtyqtyqtyqtyqtyqtyqty");
				
				map.put("orderNum", orderNum);
				map.put("changeNum", changeNum);
				map.put("changeState", changeState);
				map.put("orderDetailNum", orderDetailNum);
				map.put("cancelCost", cancelCost);
				map.put("deliveryCharge", deliveryCharge);
				
				// changeState : select 값으로 바꿔줘야할 값
				// PchangeState : 기존에 상태 값
				
				
				int totalCount = mapper.totalOrderCount(orderNum);

				// 주문에 대해 orderState가 판매취소, 주문취소완료, 반품완료를 제외한 개수가 1이하이면 ProductOrder에 상태를 6으로바꿔줘야한다.
				// 반품완료나 주문취소 판매취소가 한주문에 여러 상품이 이뤄지면 productOrder가 주문취소인거다 ?
				if (totalCount <= 1) {
					mapper.updateOrderState(map);
				}
				
				// orderChange 처리상태 변경 changeStae = 11 , 배송비 첨부하기 
				mapper.updateChange(map);
				
				// orderdetail 상태변경  
				mapper.updateOrderDetailState(map);
				
				
				if(PchangeState == 11 && changeState == 12) {
					// 주문정보에 취소 금액 올려주기
					int cancelAmount = mapper.findByMoney(orderNum);
					
					System.out.println(cancelAmount + "#########");
					
					System.out.println(cancelCost + "#########");
					
					cancelCost = cancelCost + cancelAmount;
					System.out.println(cancelCost + "###@@@@@##@##");
					map.put("cancelCost", cancelCost);
					mapper.updateOrder(map);
					

					// 포인트 회수하기
					int savedMoney = -savedMoney1;
					System.out.println(savedMoney+"savedMoneysavedMoneysavedMoneysavedMoney");
					map.put("savedMoney", savedMoney);
					map.put("memberIdx", memberIdx);
					
					mapper.updatePoint(map);
				
					
					// 만약에 마지막 전체 주문에서 마지막 주문 취소일경우 memberIdx가 사용한 적립금 만큼 memberIdx에게 돌려줘야한다
					if (totalCount <= 1) {
						mapper.updateUsedSaved(map); 
					}
					
					// 재고 빼주기
					Map<Integer,Object> list = mapper.findByStock(map); 
					
					
					BigDecimal stockNumBigDecimal = (BigDecimal) list.get("STOCKNUM");
				 	int stockNum = stockNumBigDecimal.intValue();

					BigDecimal fuck = (BigDecimal) list.get("TOTALSTOCK");
				 	int totalStock = fuck.intValue();
					
				 	totalStock = totalStock + qty;
				 	map.put("stockNum",stockNum);
					map.put("totalStock",totalStock);
					
					mapper.updateStock(map); 
				}
				
				
				
				// 쿠폰 상태변경해주고 
				
			} catch (Exception e) {
				e.printStackTrace();
				throw e;
			}
		
	}

}
