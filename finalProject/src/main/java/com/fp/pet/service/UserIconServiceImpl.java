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

}
