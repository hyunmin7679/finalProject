package com.fp.pet.admin.controller;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fp.pet.admin.domain.Chart;
import com.fp.pet.admin.domain.Icon;
import com.fp.pet.admin.domain.MainManageStatic;
import com.fp.pet.admin.service.StatisticsManageService;

@Controller
@RequestMapping("/admin/statistics/*")
public class StatisticsManageController {

	@Autowired
	private StatisticsManageService service;

	@RequestMapping(value = "etclist")
	public String detailList(Model model) throws Exception {

		int todayreg = service.todayregcount();
		int returnProduct = service.returnProduct();
		// int giftProduct = service.giftProduct();
		int allCommunity = service.allCommunity();
		int yestCommunity = service.yestCommunity();

		model.addAttribute("allCommunity", allCommunity); // 전체 커뮤니티 수
		model.addAttribute("yestCommunity", yestCommunity); // 오늘 커뮤니티수
		model.addAttribute("returnProduct", returnProduct); // 반품액
		// model.addAttribute("giftProduct",giftProduct); // 선물수입액
		model.addAttribute("dailyresult", todayreg); // 신규 가입자수
		return "/admin/main/etcManage";
	}

	@RequestMapping(value = "iconlist")
	public String iconList(Model model) throws Exception {

		try {
			List<Icon> list = service.iconList();

			model.addAttribute("list", list);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "/admin/main/iconList";
	}

	// revenuelist
	@RequestMapping(value = "revenuelist")
	public String revenuelist(Model model) throws Exception {

		try {
		
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "/admin/main/revenue";
	}

	@RequestMapping(value = "saleslist")
	public String saleslist(Model model,
			@RequestParam(name = "selectedYear", defaultValue = "2024") String selectedYear) throws Exception {

		try {
			model.addAttribute("selectedYear", selectedYear);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "/admin/main/salesManage";
	}

	@GetMapping("higtchart")
	@ResponseBody
	public Map<String, Object> higtchart(
			@RequestParam(name = "selectedYear", defaultValue = "2024") String selectedYear) throws Exception {
		Map<String, Object> model = new HashMap<>();

		int selectYearInt = Integer.parseInt(selectedYear);
		String beforeYearString = Integer.toString(selectYearInt - 1);

		List<Chart> list = service.paylist(selectedYear);
		List<Chart> list2 = service.paylist2(beforeYearString);

		model.put("list", list);
		model.put("list2", list2);
		return model;
	}
	
	//roundedPercentage
	@GetMapping("roundedPercentage")
	@ResponseBody
	public Map<String, Object> roundedPercentage() throws Exception {
		Map<String, Object> model = new HashMap<>();
		int currentY = service.currentY();
		int beforeY = service.beforeY();
		
		int increaseAmount = currentY - beforeY;
		
		double increasePercentage = ((double) increaseAmount / beforeY) * 100;
		int roundedPercentage = (int) increasePercentage;
		
		
		model.put("currentY",currentY);
		model.put("beforeY",beforeY);
		model.put("increasePercentage",roundedPercentage);
		return model;
	}
	
	
	//daysalelist
	@RequestMapping(value = "daysalelist")
	public String daysalelist(Model model, @RequestParam() String gogo) throws Exception {

		try {
			model.addAttribute("gogo",gogo);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "/admin/main/daysale";
	}

	
	// daychart
	@GetMapping("dayChart")
	@ResponseBody
	public Map<String, Object> daychart(@RequestParam() String gogo) throws Exception {
		Map<String, Object> model = new HashMap<>();
		
		
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
         Date date = sdf.parse(gogo);

         Calendar calendar = Calendar.getInstance();
         calendar.setTime(date);

         // 현재 월의 마지막 날 구하기
         int lastDay = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
         
         String result = sdf.format(date) + "-" + lastDay;
         
        System.out.println(result+"resultresultresultresultresultresultresultresult");
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		// (2024-01)
		System.out.println(gogo+"gogogogogogogogogogogogogogogogogogogogogogogogo");
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", result);
		map.put("gogo", gogo);
		
		
		List<Chart> list = service.dayChart(map);
		List<Chart> list2 = new ArrayList<>();
		
		for(Chart dto : list) {
			System.out.println(dto.getDaySale());
			list2.add(new Chart(dto.getDaySale_date(),dto.getDaySale()));
		}
		
		model.put("list",list2);
		
		return model;
	}
	
	
	
	////////////////////////////////
	
	
	@RequestMapping(value = "catesta")
	public String catesta(Model model) {
		int total = service.dataCount();
		Map<String, Object> map = new HashMap<String, Object>();
		List<MainManageStatic> feedlist = service.catafeed(map);
		List<MainManageStatic> snacklist = service.catasnack(map);
		List<MainManageStatic> stufflist = service.catastuff(map);
		String feedrange = null;
		int feedcount = 0;
		String snackrange = null;
		int snackcount = 0;
		String stuffrange = null;
		int stuffcount = 0;

		if (!feedlist.isEmpty()) {
			MainManageStatic first = feedlist.get(0);
			feedrange = first.getCategoryRangefeed();
			feedcount = first.getCategoryCountfeed();
		} else {
			feedrange = "사료";
			feedcount = 0;
		}

		if (!snacklist.isEmpty()) {
			MainManageStatic second = snacklist.get(0);
			snackrange = second.getCategoryRangesnack();
			snackcount = second.getCategoryCountsnack();
		} else {
			snackrange = "간식";
			snackcount = 0;
		}

		if (!stufflist.isEmpty()) {
			MainManageStatic third = stufflist.get(0);
			stuffrange = third.getCategoryRangestuff();
			stuffcount = third.getCategoryCountstuff();
		} else {
			stuffrange = "용품";
			stuffcount = 0;
		}

		model.addAttribute("total", total);
		model.addAttribute("feedrange", feedrange);
		model.addAttribute("feedcount", feedcount);
		model.addAttribute("snackrange", snackrange);
		model.addAttribute("snackcount", snackcount);
		model.addAttribute("stuffrange", stuffrange);
		model.addAttribute("stuffcount", stuffcount);

		return "/admin/main/categoryOrder";
	}

	@RequestMapping(value = "yearlysta")
	public String yearlysta(Model model) {

		Calendar cal = Calendar.getInstance();
		int curryear = cal.get(Calendar.YEAR);
		double currsales = service.currsales();
		double lastsales = service.lastsales();
		double currpoints = service.currpoints();
		double lastpoints = service.lastpoints();
		double currexpense = service.currexpense();
		double lastexpense = service.lastexpense();
		double currorders = service.currorders();
		double lastorders = service.lastorders();
		
		double currprofit = currsales-(currexpense+currpoints);
		double lastprofit = lastsales-(lastexpense+lastpoints);

		double salesdiff = ((currsales - lastsales) / lastsales) * 100;
		double expensediff = (((currexpense+currpoints) - (lastexpense+lastpoints))/(lastexpense+lastpoints))*100;
		double profitdiff = ((currprofit-lastprofit)/lastprofit)*100;
		double orderdiff = ((currorders-lastorders)/lastorders)*100;
		
		
		// 퍼센트
		DecimalFormat df = new DecimalFormat("#.##");
		// 원화 
		DecimalFormat cdf = new DecimalFormat("#,###");
		
		String dfprofitdiff = df.format(profitdiff);
		String dfsalesdiff = df.format(salesdiff);
		String dforderdiff=df.format(orderdiff);
		String dfexpensediff = df.format(expensediff);
		String currsalesdf = cdf.format(currsales);
		String currexpensedf = cdf.format(currexpense+currpoints);
		String currprofitdf = cdf.format(currprofit);
		String currordersdf = cdf.format(currorders);
		
		model.addAttribute("dforderdiff", dforderdiff);
		model.addAttribute("currordersdf", currordersdf);
		model.addAttribute("dfprofitdiff", dfprofitdiff);
		model.addAttribute("currprofitdf", currprofitdf);
		model.addAttribute("curryear", curryear);
		model.addAttribute("currexpensedf", currexpensedf);
		model.addAttribute("currsalesdf", currsalesdf);
		model.addAttribute("lastsales", lastsales);
		model.addAttribute("dfexpensediff", dfexpensediff);
		model.addAttribute("dfsalesdiff", dfsalesdiff);

		return "/admin/main/yearlyStatic";
	}

	@ResponseBody
	@RequestMapping(value = "chart")
	public Map<String, Object> chart() {

		Map<String, Object> map = new HashMap<String, Object>();
		List<MainManageStatic> feedlist = service.catafeed(map);
		List<MainManageStatic> snacklist = service.catasnack(map);
		List<MainManageStatic> stufflist = service.catastuff(map);

		String feedrange = null;
		int feedcount = 0;
		String snackrange = null;
		int snackcount = 0;
		String stuffrange = null;
		int stuffcount = 0;

		if (!feedlist.isEmpty()) {
			MainManageStatic first = feedlist.get(0);
			feedrange = first.getCategoryRangefeed();
			feedcount = first.getCategoryCountfeed();
		} else {
			feedrange = "사료";
			feedcount = 0;
		}

		if (!snacklist.isEmpty()) {
			MainManageStatic second = snacklist.get(0);
			snackrange = second.getCategoryRangesnack();
			snackcount = second.getCategoryCountsnack();
		} else {
			snackrange = "간식";
			snackcount = 0;
		}

		if (!stufflist.isEmpty()) {
			MainManageStatic third = stufflist.get(0);
			stuffrange = third.getCategoryRangestuff();
			stuffcount = third.getCategoryCountstuff();
		} else {
			stuffrange = "용품";
			stuffcount = 0;
		}

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("feedrange", feedrange);
		model.put("feedcount", feedcount);
		model.put("snackrange", snackrange);
		model.put("snackcount", snackcount);
		model.put("stuffrange", stuffrange);
		model.put("stuffcount", stuffcount);

		return model;
	}

}
