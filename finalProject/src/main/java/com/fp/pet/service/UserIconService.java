package com.fp.pet.service;

import java.util.List;

import com.fp.pet.domain.Icon;

public interface UserIconService {
	public List<Icon> listIcon(long memberIdx);
	public void updateIcon1(long memberIdx);
	public void updateIcon2(Icon icon);
	public void insertIcon(long memberIdx);
	public Icon findByIcon(long memberIdx);
}
