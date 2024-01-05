package com.fp.pet.admin.service;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.pet.admin.domain.OrderDetailManage;
import com.fp.pet.admin.domain.OrderManage;
import com.fp.pet.admin.mapper.CancleMapper;
import com.fp.pet.state.OrderState;

@Service
public class CancleServiceImpl implements CancleService{
	
	@Autowired
	private CancleMapper mapper;
	
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
	public OrderManage findById(String orderNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<OrderDetailManage> orderDetails(String orderNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateOrder(String mode, Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void cancleAllProduct(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Map<String, Object>> listDetailStateInfo(long orderDetailNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateOrderDetailState(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateCancleComplete(Map<String, Object> map) throws Exception {
		try {
			String orderNum = (String) map.get("orderNum");
			int changeNum = Integer.parseInt((String) map.get("changeNum"));
			int cancelCost = Integer.parseInt((String) map.get("cancelCost"));
			int orderDetailNum = Integer.parseInt((String) map.get("orderDetailNum"));
			int usedSaved = Integer.parseInt((String) map.get("usedSaved"));
			int savedMoney1 = Integer.parseInt((String) map.get("savedMoney"));
			int memberIdx = Integer.parseInt((String) map.get("memberIdx"));
			
			int productNum = Integer.parseInt((String) map.get("productNum"));
			int detailNum = Integer.parseInt((String) map.get("detailNum"));
			int detailNum2 = Integer.parseInt((String) map.get("detailNum2"));
			int qty = Integer.parseInt((String) map.get("qty"));
			
			System.out.println(orderNum + "orderNum");
			System.out.println(changeNum + "changeNum");
			System.out.println(orderDetailNum + "orderDetailNum ");
			System.out.println(cancelCost + "cancelCost ");
			
			System.out.println(usedSaved + "usedSaved ");
			System.out.println(savedMoney1 + "savedMoney ");
			System.out.println(memberIdx + "memberIdx memberIdx ");

			System.out.println(productNum + "productNumproductNum ");
			System.out.println(detailNum + "detailNumdetailNumdetailNum ");
			System.out.println(detailNum2 + "detailNum222222222222222222222222222222 ");
			System.out.println(qty + "qty ");
			
			int totalCount = mapper.totalOrderCount(orderNum);
			
			// 주문정보에 대한 모든 주문 내역이 주문 취소이면 주문정보의 상태는 판매 취소로 변경
			// 만약에 주문의 마지막 상품이면 productOrder에 orderState = 6으로 변경
			if (totalCount <= 1) {
				mapper.updateOrderState(map);
			}
			
			// orderChange 처리상태 변경 changeStae = 5, com_date =sysdate, adminMemo = ? , 
			mapper.updateChange(map);
			
			// orderdetail 상태변경 detailState = 5 , 취소 올려주기 
			mapper.updateOrderDetailState(map);
			
			
			// 주문정보에 취소 금액 올려주기
			int cancleAmount = mapper.findByMoney(orderNum);
			
			cancelCost += cancleAmount;
			
			map.put("cancelCost", cancelCost);
			mapper.updateOrder(map);
			
			
			
			// 상품에 대해 주문취소일 경우 취소완료가 되는순간 포인트도 memberIdx에서 - 해줘야한다.
			 int savedMoney = -savedMoney1;
			 System.out.println(savedMoney+"savedMoneysavedMoneysavedMoney");
			 
			 map.put("orderDetailNum", orderDetailNum);
			 map.put("memberIdx",memberIdx);
			 map.put("savedMoney",savedMoney);
			 
				/*
				 * map.put("productNum",productNum); map.put("detailNum",detailNum);
				 * map.put("detailNum2",detailNum2);
				 */
			 map.put("qty",qty);
			 
			 
			mapper.updatePoint(map); 
			// insert into point(pointNum,orderDetailNum,memberIdx,reg_date,memo,p_qty,p_sort)
			// 	values(point_seq.NEXTVAL,#{orderDetailNum},#{memberIdx},sysdate,'주문 취소로 인한 포인트 회수',#{savedMoney},NULL)							
			
			// 만약에 마지막 전체 주문에서 마지막 주문 취소일경우 memberIdx가 사용한 적립금 만큼 memberIdx에게 돌려줘야한다
			if (totalCount <= 1) {
				mapper.updateUsedSaved(map); 
			}
			// insert into point(pointNum,orderDetailNum,memberIdx,reg_date,memo,p_qty,p_sort)
			// values(point_seq.NEXTVAL,#{orderDetailNum},#{memberIdx},sysdate,'주문 취소로 인한 포인트 복구',#{usedSaved},NULL)
			
			
			
			// 재고 더해주기
			
			 	Map<Integer,Object> list = mapper.findByStock(map); 
			 	// {TOTALSTOCK=11, STOCKNUM=23} 값이 이렇게 넘오온다 swag
			 	
			 	
			 	// select stockNum,totalStock from productStock 
			 	// where productNum = #{productNum} and detailNum = #{detailNUm} and detailNum2 = #{detailNum2}
			
				// int stockNum = Integer.parseInt((String) list.get("STOCKNUM"));
				// int totalStock = Integer.parseInt((String) list.get("TOTALSTOCK"));
			 	
			 	BigDecimal stockNumBigDecimal = (BigDecimal) list.get("STOCKNUM");
			 	int stockNum = stockNumBigDecimal.intValue();

				BigDecimal fuck = (BigDecimal) list.get("TOTALSTOCK");
			 	int totalStock = fuck.intValue();
			 	
			 	System.out.println(stockNum+"stockNumstockNumstockNumstockNumstockNum");
				System.out.println(totalStock+"totalStocktotalStocktotalStocktotalStocktotalStock");
				
				totalStock = totalStock + qty;
				
				System.out.println(totalStock+"###########################################");
				map.put("stockNum",stockNum);
				map.put("totalStock",totalStock);
				
				mapper.updateStock(map); 
			 	// update productStock set totalStock = #{totalStock} where stockNum = #{stockNum} 
			 
				// 쿠폰 상태변경해주고
				// mapper.updateCouponState(map); - map에는 counponNum 
				// update memberCoupon set use = 0 where couponNum = #{couponNum}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

}
