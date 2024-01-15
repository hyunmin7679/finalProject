package com.fp.pet.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fp.pet.domain.Wishlist;

@Mapper
public interface WishlistMapper {
	public int dataCount(Map<String, Object>map);
	public List<Wishlist> listwishlist(Map<String, Object>map);
	public List<Wishlist> findwishlist(Map<String, Object>map);
	public void addorremove(Map<String, Object>map);
	
}
