package com.fp.pet.service;

import java.util.List;
import java.util.Map;

import com.fp.pet.domain.Wishlist;

public interface WishlistService {
	
	public int dataCount(Map<String, Object>map);
	public List<Wishlist> listwishlist(Map<String, Object>map);
	
	public void addorremove(Map<String, Object>map);

}
