package com.fp.pet.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.pet.domain.Wishlist;
import com.fp.pet.mapper.WishlistMapper;

@Service
public class WishlistServiceimpl implements WishlistService{
	
	@Autowired
	private WishlistMapper mapper;

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		try {
			mapper.dataCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Wishlist> listwishlist(Map<String, Object> map) {
		List<Wishlist> list = null;
		
		try {
			list= mapper.listwishlist(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void addorremove(Map<String, Object> map) {
		
		List<Wishlist>list = null;
		list=mapper.findwishlist(map);
		
		if(list != null && !list.isEmpty()) {
			Wishlist dto =list.get(0);
			int secret  = dto.getSecret();
			
			if(secret==0) {
				map.put("secret", 1);
				mapper.addorremove(map);
			} else {
				map.put("secret", 0);
				mapper.addorremove(map);
			}
		}
			
	}
	

}
