package com.fp.pet.service;

import java.util.Calendar;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicLong;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.pet.domain.Order;
import com.fp.pet.mapper.MyPageMapper;
import com.fp.pet.mapper.OrderMapper;

@Service
public class OrderServiceImpl implements OrderService{
	@Autowired
	private OrderMapper mapper;
	
	@Autowired 
	private MyPageMapper myPageMapper;
	
	private static AtomicLong count = new AtomicLong(0);
	
	@Override
	public String productOrderNumber() {
		String result = "";
		
		try {
			Calendar cal = Calendar.getInstance();
			String y =String.format("%04d", cal.get(Calendar.YEAR));
			String m = String.format("%02d", (cal.get(Calendar.MONTH) + 1));
			String d = String.format("%03d", cal.get(Calendar.DATE) * 7);
			
			String preNumber = y + m + d;
			String savedPreNumber = "0";
			long savedLastNumber = 0;
			String maxOrderNumber = mapper.findByMaxOrderNumber();
			if(maxOrderNumber != null && maxOrderNumber.length() > 9) {
				savedPreNumber = maxOrderNumber.substring(0, 9);
				savedLastNumber = Long.parseLong(maxOrderNumber.substring(9));
			}
			
			long lastNumber = 1;
			if(! preNumber.equals(savedPreNumber)) {
				count.set(0);
				lastNumber = count.incrementAndGet();
			} else {
				lastNumber = count.incrementAndGet();
				
				if( savedLastNumber >= lastNumber )  {
					count.set(savedLastNumber);
					lastNumber = count.incrementAndGet();
				}
			}
			
			result = preNumber + String.format("%09d", lastNumber);
			
		} catch (Exception e) {
		}
		
		return result;
	}

	@Override
	public void insertOrder(Order dto) throws Exception {
		try {
			dto.setUsePoint(-dto.getUsePoint());
			mapper.insertOrder(dto);
			
			mapper.insertPayDetail(dto);
			
			for(int i = 0; i<dto.getProductNums().size(); i++) {
				dto.setProductNum(dto.getProductNums().get(i));
				dto.setQty(dto.getBuyQtys().get(i));
				dto.setDetailNum(dto.getDetailNums().get(i));
				dto.setDetailNum2(dto.getDetailNums2().get(i));
				dto.setProductMoney(dto.getProductMoneys().get(i));
				dto.setPrice(dto.getPrices().get(i));
				dto.setSalePrice(dto.getSalePrices().get(i));
				dto.setSavedMoney(dto.getSavedMoneys().get(i));
				
				mapper.insertOrderDetail(dto);
				for(int k = 0; k<dto.getBuyQtys().get(i); k++) {
					mapper.stockReduction(dto);
				}
				
			}
			
			mapper.earnPoints(dto);
			if(dto.getUsePoint()!=0) {
				mapper.usePoints(dto);
			}
			mapper.insertOrderDelivery(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public Order findById(long productNum) {
		Order dto = null;
		
		try {
			dto = mapper.findById(productNum); 
			
			if(dto != null) {
				int discountPrice = 0;
				if(dto.getDiscountRate() > 0) {
					discountPrice = (int)(dto.getPrice() * (dto.getDiscountRate()/100.0));
					dto.setDiscountPrice(discountPrice);
				}
				
				dto.setSalePrice(dto.getPrice() - discountPrice);
			}			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public List<Order> listProduct(List<Map<String, Long>> list) {
		List<Order> listProduct = null;
		
		try {
			listProduct = mapper.listProduct(list);
			for(Order dto : listProduct) {
				int discountPrice = 0;
				if(dto.getDiscountRate() > 0) {
					discountPrice = (int)(dto.getPrice() * (dto.getDiscountRate()/100.0));
					dto.setDiscountPrice(discountPrice);
				}
				
				dto.setSalePrice(dto.getPrice() - discountPrice);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return listProduct;
	}

	@Override
	public Order findByDetailId(long detailNum) {
		Order dto = null;
		
		try {
			dto = mapper.findByDetailId(detailNum); 
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public List<Order> listOptionDetail(List<Long> detailNums) {
		List<Order> listOptionDetail = null;
		
		try {
			listOptionDetail = mapper.listOptionDetail(detailNums);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return listOptionDetail;
	}

	@Override
	public void deleteCart(Map<String, Object> map) throws Exception {
		try {
			myPageMapper.deleteCart(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public Order findPoint(long memberIdx) {
		Order dto = null;
		try {
			dto = mapper.memberPoint(memberIdx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

}
