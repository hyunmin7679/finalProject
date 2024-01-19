package com.fp.pet.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fp.pet.common.FileManager;
import com.fp.pet.domain.Exchange;
import com.fp.pet.domain.Order;
import com.fp.pet.domain.Payment;
import com.fp.pet.domain.Product;
import com.fp.pet.mapper.MyPageMapper;
import com.fp.pet.state.OrderState;

@Service
public class MyPageServiceImpl implements MyPageService {

	@Autowired
	private MyPageMapper mapper;
	
	@Autowired
	private FileManager fileManager;

	// 장바구니 등록
	@Override
	public void insertCart(Order dto) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", dto.getUserId());

		try {
			for (int i = 0; i < dto.getProductNums().size(); i++) {
				map.put("detailNum2", dto.getDetailNums2().get(i)); // 옵션's

				dto.setProductNum(dto.getProductNums().get(i)); // 상품번호's
				dto.setDetailNum(dto.getDetailNums().get(i)); // 상세옵션1's
				dto.setDetailNum2(dto.getDetailNums2().get(i)); // 상세옵션2's
				dto.setQty(dto.getBuyQtys().get(i)); // 수량's

				if (mapper.findByCartId(map) == null) {
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
			for (Order dto : list) {
				int discountPrice = 0;
				if (dto.getDiscountPrice() > 0) {
					discountPrice = (int) (dto.getPrice() * (dto.getDiscountPrice() / 100.0));
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

	// 장바구니 20일이후 삭제
	@Scheduled(cron = "0 0 1 20 * ?") // 매달 20일 오전 1시
	@Override
	public void deleteExpiration() throws Exception {
		try {
			mapper.deleteCartExpiration();

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

	}

// ---------------------------------------------------------------------------------	

	@Override
	public Payment findIcon(Map<String, Object> map) {
		Payment dto = null;
		
		try {
			dto = mapper.findIcon(map);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	
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

	@Override
	public int userPoint(Map<String, Object> map) {
		int result = 0;

		try {
			int sum1 = mapper.sumPoint(map);
			int sum2 = mapper.sumPoint2(map);

			result = sum1 + sum2;

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

			for (Payment dto : list) {
			    dto.setOrderDate(dto.getOrderDate().replaceAll("-", ".").substring(5,10));
				dto.setOrderStateInfo(OrderState.ORDERSTATEINFO[dto.getOrderState()]); // 주문상태 정보들
				dto.setDetailStateInfo(OrderState.DETAILSTATEINFO[dto.getDetailState()]); // 주문상세상태 정보들

				productState = OrderState.ORDERSTATEINFO[dto.getOrderState()];
				if (dto.getDetailState() > 0) { // 주문상태가 구매확정대기가 아니면
					productState = OrderState.DETAILSTATEINFO[dto.getOrderState()];
				}
				dto.setStateProduct(productState); // 주문상세상태 정보 넣기

				if (dto.getOrderState() == 5 && dto.getStateDate() != null) { // 주문취소완료면
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

	// 주문상세
	@Override
	public Payment findByDetail(Map<String, Object> map) {
		Payment dto = null;

		try {
			dto = mapper.findByDetail(map);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	// 주문상세상태 수정 (구매확정)
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
	
	@Override
	public void insertPoint(Map<String, Object> map) throws Exception {
		try {
			mapper.insertPoint(map);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}


	// 자동구매확정
	@Override
	public void updateOrderDetailState2(Map<String, Object> map) throws Exception {
		try {
			// 주문상세 테이블 상태 변경
			mapper.updateOrderDetailState2(map);

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

	// 주문취소 개수
	@Override
	public int cancelCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = mapper.cancelCount(map);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 주문취소 리스트
	@Override
	public List<Payment> listCancel(Map<String, Object> map) {
		List<Payment> list = null;

		try {
			list = mapper.listCancel(map);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	// -------------------------------------------------------------------
	// 주문상태변경 테이블 인서트
	@Override
	public void insertorderChange(Map<String, Object> map) throws Exception {

		try {
			mapper.insertorderChange(map);

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

	}

	// 주문상세 상태 테이블 인서트
	@Override
	public void insertStateInfo2(Map<String, Object> map) throws Exception {
		try {
			mapper.insertStateInfo2(map);

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

	}

	// 주문테이블 상태 변경
	@Override
	public void updateproductOrder(Map<String, Object> map) throws Exception {
		try {
			mapper.updateproductOrder(map);

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

	}

	// 주문상세테이블 상태 변경
	@Override
	public void updatedetailStateInfo(Map<String, Object> map) throws Exception {
		try {
			mapper.updatedetailStateInfo(map);

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

	}

	// 주문취소 요청 처리
	@Override
	public void updateorderChange(Map<String, Object> map) throws Exception {
		try {
			// changeSort

			int changeSort = Integer.parseInt((String) map.get("changeSort"));
			int changeState = 0;

			if (changeSort == 0 || changeSort == 1) {
				changeState = 6;
			} else if (changeSort == 2 || changeSort == 3) {
				changeState = 10;
			} else {
				changeState = 4;
			}

			map.put("changeState", changeState);

			insertorderChange(map);
			insertStateInfo2(map);

			updatedetailStateInfo(map);

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

	}
	
	// 반품 요청 처리
	@Override
	public void updateorderReturn(Payment dto, String pathname) throws Exception {
		try {
			
			mapper.insertorderChange2(dto); 
			mapper.insertStateInfo4(dto);
			mapper.updatedetailStateInfo2(dto);
			
			// 파일 업로드
			if (!dto.getSelectFile().isEmpty()) {
				for (MultipartFile mf : dto.getSelectFile()) {
					String saveFilename = fileManager.doFileUpload(mf, pathname);
					if (saveFilename == null) {
						continue;
					}

					dto.setFilename(saveFilename);
					mapper.insertReturnImg(dto);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

	}
	

	@Override
	public void addwishlist(Map<String, Object> map) throws Exception {

		try {

			mapper.addwishlist(map);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public void deletewishlist(Map<String, Object> map) throws Exception {
		try {

			mapper.deletewishlist(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public Product findById(long productNum) {
		Product dto = null;
		try {
			dto = mapper.findById(productNum);

			if (dto != null) {
				int discountPrice = 0;
				if (dto.getDiscountRate() > 0) {
					discountPrice = (int) (dto.getPrice() * (dto.getDiscountRate() / 100.0));
				}

				dto.setSalePrice(dto.getPrice() - discountPrice);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public List<Product> listProductOption(long productNum) {
		List<Product> list = null;

		try {
			list = mapper.listProductOption(productNum);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<Product> listOptionDetail(long optionNum) {
	List<Product> list = null;
		
		try {
			list = mapper.listOptionDetail(optionNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public List<Product> listOptionDetailStock(Map<String, Object> map) {
		List<Product> list = null;
		
		try {
			// 옵션별 상품 재고 -----
			list = mapper.listOptionDetailStock(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void updateExchange(Exchange dto) throws Exception {
		
		try {

			mapper.insertOrderChange(dto);
			mapper.updateOrderState(dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void insertExchangeImg(Exchange dto, String path) throws Exception {
		try {
			
			// 파일 업로드
			if (!dto.getSelectFile().isEmpty()) {
				for (MultipartFile mf : dto.getSelectFile()) {
					String saveFilename = fileManager.doFileUpload(mf, path);
					if (saveFilename == null) {
						continue;
					}

					dto.setImageFilename(saveFilename);
					mapper.insertExchangeImg(dto);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}


	
}
