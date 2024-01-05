package com.fp.pet.mapper;

import java.util.List;

import com.fp.pet.domain.Icon;

public interface UserIconMapper {
	public List<Icon> listIcon(long memberIdx);
}
