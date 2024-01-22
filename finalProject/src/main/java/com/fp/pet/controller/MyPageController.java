package com.fp.pet.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fp.pet.common.MyUtil;
import com.fp.pet.domain.Exchange;
import com.fp.pet.domain.Icon;
import com.fp.pet.domain.Order;
import com.fp.pet.domain.Payment;
import com.fp.pet.domain.Product;
import com.fp.pet.domain.SessionInfo;
import com.fp.pet.service.MyPageService;
import com.fp.pet.service.ProductService;
import com.fp.pet.service.UserIconService;
import com.fp.pet.state.OrderState;

@Controller
@RequestMapping("/myPage/*")
public class MyPageController {

	@Autowired
	private MyPageService service;

	@Autowired
	private ProductService productservice;
	
	@Autowired
	private UserIconService iconService;
	
	@Autowired
	private MyUtil myUtil;

	// 장바구니 리스트
	@GetMapping("cart")
	public String listCart(HttpSession seesion, Model model) throws Exception {

		SessionInfo info = (SessionInfo) seesion.getAttribute("member");

		List<Order> list = service.listCart(info.getUserId());

		model.addAttribute("list", list);

		return ".myPage.cart";
	}

	// 장바구니 저장
	@PostMapping("saveCart")
	public String saveCart(Order dto, HttpSession session) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		try {
			dto.setUserId(info.getUserId());

			service.insertCart(dto);

		} catch (Exception e) {
		}

		return "redirect:/myPage/cart";
	}

	// 하나 상품 장바구니 삭제
	@GetMapping("deleteCart")
	public String deleteCart(@RequestParam long detailNum2, HttpSession session) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("gubun", "item");
			map.put("userId", info.getUserId());
			map.put("detailNum2", detailNum2);

			service.deleteCart(map);

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

		return "redirect:/myPage/cart";
	}

	// 선택한 상품(들) 장바구니 삭제
	@PostMapping("deleteListCart")
	public String deleteListCart(@RequestParam List<Long> nums, HttpSession session) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("gubun", "list");
			map.put("userId", info.getUserId());
			map.put("list", nums);

			service.deleteCart(map);

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

		return "redirect:/myPage/cart";
	}

	// 장바구니 전체 삭제
	@GetMapping("deleteCartAll")
	public String deleteCartAll(HttpSession session) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("gubun", "all");
			map.put("userId", info.getUserId());

			service.deleteCart(map);

		} catch (Exception e) {
		}

		return "redirect:/myPage/cart";
	}

	// ---------------------------------------------------------------------

	// 주문내역 리스트
	@RequestMapping("paymentList")
	public String paymentList(@RequestParam(value = "page", defaultValue = "1") int current_page,
			HttpServletRequest req, HttpSession session, Model model) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String cp = req.getContextPath();

		int size = 10;
		int total_page, dataCount;

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberIdx", info.getMemberIdx());

		dataCount = service.countPayment(map);
		total_page = myUtil.pageCount(dataCount, size);
		if (current_page > total_page) {
			current_page = total_page;
		}

		int offset = (current_page - 1) * size;
		if (offset < 0)
			offset = 0;

		map.put("offset", offset);
		map.put("size", size);

		List<Payment> list = service.listPayment(map);
		List<Payment> cancelList = service.listCancel(map);
		int userPoint = service.userPoint(map);
		Icon vo = iconService.findByIcon(info.getMemberIdx());

		String listUrl = cp + "/myPage/paymentList";
		String paging = myUtil.pagingUrl(current_page, total_page, listUrl);

		String orderState[] = OrderState.ORDERSTATEINFO; // 주문상태
		String detailState[] = OrderState.DETAILSTATEINFO; // 주문상태
		String changeSate[] = OrderState.GHANGESORTINFO; // 주문상태

		model.addAttribute("list", list);
		model.addAttribute("cancelList", cancelList);

		model.addAttribute("page", current_page);
		model.addAttribute("total_page", total_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("paging", paging);

		model.addAttribute("orderState", orderState); // OrderState
		model.addAttribute("detailState", detailState); // OrderState
		model.addAttribute("changeSate", changeSate); // OrderState
		model.addAttribute("userPoint", userPoint);
		model.addAttribute("mode", "order");
		
		model.addAttribute("vo", vo);

		return ".myPage.paymentList";
	}

	// 주문취소내역 리스트
	@RequestMapping("paymencanceltList")
	public String paymencanceltList(@RequestParam(value = "page", defaultValue = "1") int current_page,
			HttpServletRequest req, HttpSession session, Model model) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String cp = req.getContextPath();

		int size = 10;
		int total_page, dataCount;

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberIdx", info.getMemberIdx());

		dataCount = service.cancelCount(map);
		total_page = myUtil.pageCount(dataCount, size);
		if (current_page > total_page) {
			current_page = total_page;
		}

		int offset = (current_page - 1) * size;
		if (offset < 0)
			offset = 0;

		map.put("offset", offset);
		map.put("size", size);

		List<Payment> list = service.listCancel(map);
		int userPoint = service.userPoint(map);

		Icon vo = iconService.findByIcon(info.getMemberIdx());
		
		String listUrl = cp + "/myPage/paymentList";
		String paging = myUtil.pagingUrl(current_page, total_page, listUrl);

		String orderState[] = OrderState.ORDERSTATEINFO; // 주문상태
		String detailState[] = OrderState.DETAILSTATEINFO; // 주문상태
		String changeSate[] = OrderState.GHANGESORTINFO; // 주문상태

		model.addAttribute("list", list);

		model.addAttribute("page", current_page);
		model.addAttribute("total_page", total_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("paging", paging);

		model.addAttribute("orderState", orderState); // OrderState
		model.addAttribute("detailState", detailState); // OrderState
		model.addAttribute("changeSate", changeSate); // OrderState

		model.addAttribute("userPoint", userPoint);
		model.addAttribute("mode", "cancel");
		
		model.addAttribute("vo", vo);
		
		
		
		return ".myPage.paymentList";
	}

	@GetMapping("qna2")
	public String qna2(@RequestParam long productNum, Model model) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("productNum", productNum);

		Product dto = productservice.findByProduct(productNum);

		model.addAttribute("qna", dto);

		return "myPage/productModal";
	}

// **********************************************************************************	
	@GetMapping("orderDetail")
	public String orderDetail(@RequestParam long orderDetailNum, Model model) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("orderDetailNum", orderDetailNum);

		Payment dto = service.findByDetail(map);

		model.addAttribute("vo", dto);

		return "myPage/orderDetail";
	}

// **********************************************************************************	

	// 구매확정
	@RequestMapping("confirmation")
	public String confirmation(@RequestParam Map<String, Object> paramMap, @RequestParam String page,
			HttpSession session) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		try {
			paramMap.put("detailState", 1); // 구매확정
			paramMap.put("stateMemo", "구매확정완료");
			paramMap.put("memberIdx", info.getMemberIdx());

			service.updateOrderDetailState(paramMap);

		} catch (Exception e) {
		}

		return "redirect:/myPage/paymentList?page=" + page;
	}

	// 주문취소요청
	@PostMapping("orderDetailUpdate")
	public String orderDetailUpdate(@RequestParam Map<String, Object> map, @RequestParam String page,
			HttpSession session, Model model) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		try {
			map.put("memberIdx", info.getMemberIdx());
			

			service.updateorderChange(map);

		} catch (Exception e) {
		}
		return "redirect:/myPage/paymentList?page=" + page;
	}
	
	
	// 반품요청
	@RequestMapping(value = "orderReturnUpdate")
	@ResponseBody
	public Map<String, Object> orderReturnUpdate(Payment dto, HttpSession session) throws Exception {
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads" + File.separator + "img";

			service.updateorderReturn(dto, pathname); 
			
			model.put("state", "true");
			
		} catch (Exception e) {
			model.put("state", "false");
		}
		
		return model;
	}

	// 회원탈퇴여부
	@GetMapping("updateOrderHistory")
	public String updateOrderHistory(@RequestParam long orderDetailNum, @RequestParam String page, HttpSession session)
			throws Exception {

		try {
			service.updateOrderHistory(orderDetailNum);
		} catch (Exception e) {
		}

		return "redirect:/myPage/paymentList?page=" + page;
	}

	// -----------------------------------------------------------------------
	// 리뷰
	@GetMapping("review")
	public String review(@RequestParam(defaultValue = "review") String mode, Model model) throws Exception {

		model.addAttribute("mode", mode);
		return ".myPage.review";
	}

	// 쿠폰 + 포인트
	@GetMapping("couponPoint")
	public String coupon(@RequestParam(defaultValue = "coupon") String mode, Model model) throws Exception {

		model.addAttribute("mode", mode);
		return ".myPage.pointCoupon";
	}

	@ResponseBody
	@RequestMapping(value = "wishlist")
	public String wishlist(@RequestParam int pnum, @RequestParam int open, HttpSession session) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pnum", pnum);
		map.put("userId", info.getUserId());
		map.put("open", open);

		try {
			service.addwishlist(map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/product/buy/" + pnum;
	}

	@ResponseBody
	@RequestMapping(value = "deletewish")
	public String deletewish(@RequestParam int pnum, HttpSession session) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pnum", pnum);
		map.put("userId", info.getUserId());

		try {
			service.deletewishlist(map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/product/buy/" + pnum;
	}

	@ResponseBody
	@RequestMapping(value = "findByProduct")
	public Map<String, Object> findByProduct(@RequestParam long orderDetailNum) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		Payment dto = null;
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("orderDetailNum", orderDetailNum);
			dto = service.findByDetail(map);
			
			Product dto1 = service.findById(dto.getProductNum());
			List<Product> listOption = service.listProductOption(dto.getProductNum());
			List<Product> listOptionDetail = null;
			if(listOption.size() > 0) {
				listOptionDetail = service.listOptionDetail(listOption.get(0).getOptionNum());
			}
			
			model.put("dto1", dto1);
			model.put("listOption",listOption);
			model.put("listOptionDetail",listOptionDetail);
			model.put("dto",dto);
			model.put("state", "true");
		} catch (Exception e) {
			model.put("state", "false");
		}

		return model;
	}
	
	// listOptionDetailStock
	@GetMapping("listOptionDetailStock")
	@ResponseBody
	public List<Product> listOptionDetailStock(@RequestParam long optionNum,
			@RequestParam long optionNum2, @RequestParam long detailNum) {
		// 상세 옵션 및 재고량 -----
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("optionNum2", optionNum2);
		map.put("detailNum", detailNum);
		List<Product> list = service.listOptionDetailStock(map);
		return list;
	}	
	
	// exchangeProduct
	@ResponseBody
	@RequestMapping(value = "exchangeProduct")
	public Map<String, Object> exchangeProduct(Exchange dto , HttpSession session) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		
		try {
			String root = session.getServletContext().getRealPath("/");
			String path = root + "uploads" + File.separator + "img";
			
			service.updateExchange(dto);
			service.insertExchangeImg(dto,path);
			
			model.put("state", "true");
		} catch (Exception e) {
			model.put("state", "false");
		}

		return model;
	}
}
