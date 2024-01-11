package com.fp.pet.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.pet.admin.mapper.UserManageMapper;
import com.fp.pet.domain.Member;
import com.fp.pet.domain.Purchase;

@Service
public class UserManageServiceImpl implements UserManageService {

	@Autowired
	private UserManageMapper mapper;

	@Override
	public int userCount(Map<String, Object> map) {
		int result = 0;

		try {
			result = mapper.userCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public int todayregcount(Map<String, Object> map) {
		int result = 0;
		try {
			result = mapper.todayregcount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int yesterdayregcount(Map<String, Object> map) {
		int result = 0;
		try {
			result = mapper.yesterdayregcount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int activeuserCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = mapper.activeuserCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int activeuserCountlastweek(Map<String, Object> map) {
		int result = 0;

		try {
			result = mapper.activeuserCountlastweek(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int deactiveuserCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = mapper.deactiveuserCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;

		try {
			result = mapper.dataCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int purchaseUserCount(Map<String, Object> map) {
		int result = 0;

		try {
			result = mapper.purchaseUserCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int purchaseuserCountweekbefore(Map<String, Object> map) {
		int result = 0;

		try {
			result = mapper.purchaseUserCountweekbefore(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Member> listUser(Map<String, Object> map) {
		List<Member> list = null;

		try {
			list = mapper.listUser(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Member> listUserinfo(Map<String, Object> map) {
		List<Member> list = null;

		try {
			list = mapper.listUserinfo(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Purchase> catanaly(Map<String, Object> map) {
		List<Purchase> list = null;

		try {
			list = mapper.catanaly(map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<Purchase> purchaselist(Map<String, Object> map) {
		List<Purchase> list = null;

		try {
			list = mapper.purchaselist(map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public void sancuser(Map<String, Object> map) {

		try {
			mapper.sancUser(map);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public void unsancuser(Map<String, Object> map) {

		try {
			mapper.unsancUser(map);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public int dataCountpurchase(Map<String, Object> map) {
		int result = 0;

		try {
			result = mapper.dataCountpurchase(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int findpoint(long memberIdx) {
		int point=0;
		
		try {
			point = mapper.findpoint(memberIdx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return point;
	}

}
