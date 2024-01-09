package com.fp.pet.service;

import java.util.List;
import java.util.Map;

import com.fp.pet.domain.Product;

public interface ProductService {
	public int dataCount(Map<String, Object> map);
	public List<Product> listProduct(Map<String, Object> map);
	
	public Product findByProduct(long ProductNum);
	public List<Product> listProductFile(long productNum);
	
	public Product findByCategoryName(long categoryNum);
	
	public List<Product> listProductOption(long productNum);
	public List<Product> listOptionDetail(long optionNum);
	
	public List<Product> listOptionDetailStock(Map<String, Object> map);

}
