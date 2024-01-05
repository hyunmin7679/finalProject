package com.fp.pet.service;

import java.util.List;

import com.fp.pet.domain.Icon;

public interface UserIconService {
	public List<Icon> listIcon(long memberIdx);
}
