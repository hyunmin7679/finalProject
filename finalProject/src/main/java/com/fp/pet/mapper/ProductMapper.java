package com.fp.pet.mapper;

import java.util.List;
import java.util.Map;

import com.fp.pet.domain.Product;

public interface ProductMapper {
	public int dataCount(Map<String, Object> map);
	public List<Product> listProduct(Map<String, Object> map);
	
	public Product findByProduct(long num);
	public Product findByCategoryName(long num);
	
	public List<Product> listProductOption(long productNum);
	public List<Product> listOptionDetail(long optionNum);

}
