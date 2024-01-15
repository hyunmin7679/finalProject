package com.fp.pet.admin.controller;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.View;

import com.fp.pet.admin.domain.OrderDetailManage;
import com.fp.pet.admin.service.ExchangeService;
import com.fp.pet.common.MyExcelView;
import com.fp.pet.common.MyUtil;
@Controller
@RequestMapping("/admin/ExchangeManage/*")
public class ExchangeController {
	
	@Autowired
	private MyExcelView excelView;
	
	@Autowired
	private ExchangeService service;
	@Autowired
	private MyUtil myUtil;
	
	 //exchangeProduct
    @RequestMapping(value = "exchangeProduct")
    public String exchangeProduct(Model model) throws Exception {
    	  model.addAttribute("left","creProductManage");
          model.addAttribute("sub","exchangeProduct");
        return ".admin.ExchangeManage.exchangeProduct";
    }
    
    @RequestMapping(value = "orderlist")
  	public String orderList(
  			Model model, @RequestParam(value = "state") String state,
  			@RequestParam(value = "page", defaultValue = "1") int current_page,
  			@RequestParam(defaultValue = "couponCode") String schType,
  			@RequestParam(defaultValue = "") String kwd,
			@RequestParam(defaultValue = "") String startDate,
			@RequestParam(defaultValue = "") String endDate,
			@RequestParam(defaultValue = "") String productName,
  			HttpServletRequest req, HttpSession session) throws Exception {

  		int size = 10;
  		int total_page = 0;
  		int dataCount = 0;
  		
  		if (req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
  			state = URLDecoder.decode(state, "utf-8");
  		}
  		if (req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			kwd = URLDecoder.decode(kwd, "utf-8");
		}
  		if (req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
  			productName = URLDecoder.decode(productName, "utf-8");
		}
  		
  		Map<String, Object> map = new HashMap<String, Object>();
  		
  		map.put("state", state);
  		map.put("schType", schType);
  		map.put("searchNum", kwd);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("productName", productName);
  		
  		dataCount = service.dataCount(map);
  		
  		if (dataCount != 0) {
			total_page = myUtil.pageCount(dataCount, size);
		}
  		total_page = myUtil.pageCount(dataCount, size);
  		if(current_page > total_page) {
  			current_page = total_page;
  		}
  		
  		int offset = (current_page - 1) * size;
  		if(offset < 0) offset = 0;
  		
  		map.put("offset", offset);
  		map.put("size", size);
  		
  		List<OrderDetailManage> list = service.listOrder(map);
  		
  		String paging = myUtil.pagingMethod(current_page, total_page, "listPage");
  		
  		model.addAttribute("state",state);
  		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("schType",schType);
		model.addAttribute("kwd",kwd);
  		
  		
  		return "/admin/ExchangeManage/orderList";
  	}
    
    @RequestMapping("returnFile")
    @ResponseBody
    public Map<String,Object> selectFile(@RequestParam Map<String, Object> paramMap){
    	List<Map<String,Object>> list = null;
    	Map<String, Object> model = new HashMap<String, Object>();
    	try {
    		
			list = service.listFile(paramMap);
			
			Map<String, Object> firstFileMap = list.get(0);
			String firstFileName;
			
			if (firstFileMap.containsKey("FILENAME")) {
	            firstFileName = (String) firstFileMap.get("FILENAME");
	            System.out.println(firstFileName);
	            model.put("firstFileName", firstFileName);
	        }
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
    	
    	
		
    	model.put("list",list);
		return model;
    }
    
    @PostMapping("returnState")
   	@ResponseBody
   	public Map<String, Object> updateDetailState(
   			@RequestParam Map<String, Object> paramMap) {
   		// 상세주문별 상태 변경
    	
   		Map<String, Object> model = new HashMap<String, Object>();
   		
   		String state = "true";
   		
   		try {
   			System.out.println("일로 들어왔나 ?");
   			service.updateReturnState(paramMap);
   			
   			
   		} catch (Exception e) {
   			state = "false";
   		}
   		
   		model.put("state", state);
   		return model;
   	}
    
    

	@RequestMapping("excelDown")
	public View excel(Map<String, Object> model,
			HttpServletRequest req,
			@RequestParam(value = "state") String state,
			@RequestParam(defaultValue = "") String kwd,
			@RequestParam(defaultValue = "") String startDate,
			@RequestParam(defaultValue = "") String endDate,
			@RequestParam(defaultValue = "") String productName) throws Exception {
		
		
		if (req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			state = URLDecoder.decode(state, "utf-8");
		}
  		if (req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			kwd = URLDecoder.decode(kwd, "utf-8");
		}
  		if (req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
  			productName = URLDecoder.decode(productName, "utf-8");
		}
  		
  		int size = 10;
  		int total_page = 0;
  		int dataCount = 0;
  		
  		Map<String, Object> map = new HashMap<String, Object>();
  		
  		map.put("state", state);
  		map.put("searchNum", kwd);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("productName", productName);
		
		dataCount = service.dataCount(map);
		
  		int current_page = 1;
  		
  		if (dataCount != 0) {
			total_page = myUtil.pageCount(dataCount, size);
		}
  		total_page = myUtil.pageCount(dataCount, size);
  		if(current_page > total_page) {
  			current_page = total_page;
  		}
  		
  		int offset = (current_page - 1) * size;
  		if(offset < 0) offset = 0;
  		
  		map.put("offset", offset);
  		map.put("size", size);
		
		List<OrderDetailManage> list = service.listOrder(map);
		
		String sheetName="교환처리중";
		List<String> columnLabels = new ArrayList<String>();
		List<Object[]> columnValues=new ArrayList<Object[]>();
		
		columnLabels.add("교환신청일");
		columnLabels.add("주문번호");
		columnLabels.add("주문자");
		columnLabels.add("상품명");
		columnLabels.add("기존옵션");
		columnLabels.add("기존옵션");
		columnLabels.add("변경옵션");
		columnLabels.add("변경옵션");
		columnLabels.add("수량");
		columnLabels.add("상태");
		columnLabels.add("회원메모");
		
		for(OrderDetailManage dto : list) {
			columnValues.add(new Object[]{dto.getReg_date(), dto.getOrderNum(), dto.getUserName(), dto.getProductName(), 
					dto.getOptionValue(),dto.getOptionValue2(), dto.getOptionValue3() ,dto.getOptionValue4() ,dto.getQty(),
					dto.getDetailStateInfo(),dto.getChangeSortInfo()});
		}
		
		// model.put("filename", "score.xls"); // xlsx 파일을 인식하지 못하면 xls로 다운
		model.put("filename", "exchange.xlsx"); // 저장할 파일 이름
		model.put("sheetName", sheetName); // 시트이름
		model.put("columnLabels", columnLabels); // 타이틀
		model.put("columnValues", columnValues); // 값
		
		return excelView;  // 엑셀 파일 다운 로드
		// return new MyExcelView();
	}
    
    
}
