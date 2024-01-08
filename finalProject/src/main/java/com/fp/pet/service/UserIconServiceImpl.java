package com.fp.pet.service;

import java.util.List;

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

	

}
