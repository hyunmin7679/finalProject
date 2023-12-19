package com.fp.pet.service;

import java.util.List;
import java.util.Map;

import com.fp.pet.domain.Product;

public interface ProductService {
	public int dataCount(Map<String, Object> map);
	public List<Product> listProduct(Map<String, Object> map);
	
	public Product findByCategoryName(long categoryNum);

}
