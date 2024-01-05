package com.fp.pet.admin.service;

import java.util.List;
import java.util.Map;

import com.fp.pet.admin.domain.Product;

public interface ProductManageService {
	
	public int dataCount(Map<String, Object> map);
	public List<Product> listProduct(Map<String, Object> map);
	public List<Product> sublistProduct(Map<String, Object> map);	
	public List<Product> stocklistProduct(Map<String, Object> map);	
	public List<Product> productDetail(long sort);
	
	public void updateProduct(Product dto, String pathname) throws Exception;
	public void insertProduct(Product dto, String pathname);
	
	public void insertStock(long productNum, long detailNumber1,long detailNumber2,long sancMemo);
	public void updateStock(long detailNumber1,long detailNumber2,long productNum,long sancMemo);
	
	public void deleteProduct(Product dto, long productNum) throws Exception;
	public void deleteProductFile(long fileNum, String pathname) throws Exception;
	public void deleteOptionDetail(long detailNum) throws Exception;
	public Product findById(long productNum);
	public String findThumb(long productNum);
	public Integer findyByProNum( Map<String, Object> map);
	public List<Product> listCategory();
	public List<Product> listSubCategory(long parent);
	
	public List<Product> listProductFile(long productNum);
	public List<Product> listProductOption(long productNum);
	public List<Product> listOptionDetail(long optionNum);
	
	public void deleteOptionDetailFinal(long optionNum);	
	public void deleteProductOptionFinal(long productNum);
}
