package com.fp.pet.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.pet.domain.Icon;
import com.fp.pet.mapper.UserIconMapper;

@Service
public class UserIconServiceImpl implements UserIconService{
	@Autowired
	private UserIconMapper mapper;

	@Override
	public List<Icon> listIcon(long memberIdx) {
		List<Icon> list = null;
		try {
			list = mapper.listIcon(memberIdx);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return list;
	}
	
	@Override
	public void updateIcon1(long memberIdx) {
		try {
			mapper.updateIcon1(memberIdx);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
	
	@Override
	public void updateIcon2(Icon icon) {
		try {
			mapper.updateIcon2(icon);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void insertIcon(long memberIdx) {
		try {
			mapper.insertIcon(memberIdx);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public Icon findByIcon(long memberIdx) {
		Icon vo = null;
		try {
			vo = mapper.findByIcon(memberIdx);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return vo;
	}

	
	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.dataCount(map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public List<Icon> listIcon2(Map<String,Object> map) {
		List<Icon> list = null;
		try {
			list = mapper.listIcon2(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return list;
	}

	@Override
	public void insertIconList(Icon vo) {
		try {
			mapper.insertIconList(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public int userPoint(long memberIdx) {
		int point = 0;
		
		try {
			point = mapper.userPoint(memberIdx);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return point;
	}

	@Override
	public void updateUserPoint(Icon vo) {
		try {
			mapper.updateUserPoint(vo);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	
	

	
	

}
