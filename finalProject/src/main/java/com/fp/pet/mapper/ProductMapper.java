package com.fp.pet.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fp.pet.domain.Product;
import com.fp.pet.domain.Wishlist;

@Mapper
public interface ProductMapper {
	public int dataCount(Map<String, Object> map);
	public List<Product> listProduct(Map<String, Object> map);
	public List<Product> listProduct2(Map<String, Object> map);
	
	public Product findByProduct(long num);
	public Product findByCategoryName(long num);
	
	public List<Product> listProductFile(long productNum);
	
	public List<Product> listProductOption(long productNum);
	public List<Product> listOptionDetail(long optionNum);
	
	public List<Product> listOptionDetailStock(Map<String, Object> map);
	
	public List<Wishlist> findwishlist(Map<String, Object> map);

}
