package com.fp.pet.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.pet.admin.domain.Chart;
import com.fp.pet.admin.domain.Icon;
import com.fp.pet.admin.domain.MainManageStatic;
import com.fp.pet.admin.mapper.StatisticsManageMapper;

@Service
public class StatisticsManageServiceImpl implements StatisticsManageService{

	@Autowired
	private StatisticsManageMapper mapper;
	
	@Override
	public int todayregcount() {
		int result = 0;
		try {
			result=mapper.todayregcount();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}


	@Override
	public int returnProduct() {
		int result = 0;
		try {
			result=mapper.returnProduct();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int giftProduct() {
		int result = 0;
		try {
			result=mapper.giftProduct();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int allCommunity() {
		int result = 0;
		try {
			result=mapper.allCommunity();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int yestCommunity() {
		int result = 0;
		try {
			result=mapper.yestCommunity();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}


	@Override
	public List<Icon> iconList() throws Exception {
		List<Icon> list = null;
		try {
			list = mapper.iconList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}


	@Override
	public List<Chart> paylist(String selectedYear) throws Exception {
		List<Chart> list = null;
		try {
			list = mapper.paylist(selectedYear);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public List<Chart> paylist2(String beforeYear) throws Exception {
		List<Chart> list = null;
		try {
			list = mapper.paylist2(beforeYear);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}


	@Override
	public int currentY() {
		int result = 0;
		try {
			result = mapper.currentY();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}


	@Override
	public int beforeY() {
		int result = 0;
		try {
			result = mapper.beforeY();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}


	@Override
	public List<Chart> dayChart(Map<String,Object> map)  throws Exception {
		 List<Chart> list = null;
		 try {
			list = mapper.dayChart(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	@Override
	public int dataCount() {
		int total = 0;
		try {
			total = mapper.dataCount();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return total;
	}

	@Override
	public List<MainManageStatic> catafeed(Map<String, Object> map) {
		List<MainManageStatic> list = null;

		try {
			list = mapper.catafeed(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<MainManageStatic> catasnack(Map<String, Object> map) {
		List<MainManageStatic> list = null;
		try {
			list = mapper.catasnack(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<MainManageStatic> catastuff(Map<String, Object> map) {
		List<MainManageStatic> list = null;
		try {
			list = mapper.catastuff(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int currsales() {
		int currsales = 0;

		try {
			currsales = mapper.currsales();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return currsales;
	}

	@Override
	public int lastsales() {
		int lastsales = 0;

		try {
			lastsales = mapper.lastsales();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lastsales;
	}

	@Override
	public int currpoints() {
		int currpoints=0;
		
		try {
			currpoints=mapper.currpoints();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return currpoints;
	}

	@Override
	public int lastpoints() {
		int lastpoints=0;
		
		try {
			lastpoints=mapper.lastpoints();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lastpoints;
	}

	@Override
	public int currexpense() {
		int currexpense =0;
		try {
			currexpense=mapper.currexpense();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return currexpense;
	}

	@Override
	public int lastexpense() {
		int lastexpense=0;
		try {
			lastexpense=mapper.lastexpense();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lastexpense;
	}

	@Override
	public int currorders() {
		int currorders=0;
		try {
			currorders=mapper.currorders();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return currorders;
	}

	@Override
	public int lastorders() {
		int lastorders =0;
		try {
			lastorders = mapper.lastorders();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lastorders;
	}
}
