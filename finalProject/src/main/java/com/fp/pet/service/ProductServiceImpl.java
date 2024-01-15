package com.fp.pet.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.pet.domain.Product;
import com.fp.pet.domain.Wishlist;
import com.fp.pet.mapper.ProductMapper;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	private ProductMapper mapper;
	
	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.dataCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	

	@Override
	public List<Product> listProduct(Map<String, Object> map) {
		List<Product> list = null;
		
		try {
			list = mapper.listProduct(map);
			
			int discountPrice;
			for(Product dto : list) {
				discountPrice = 0;
				if(dto.getDiscountRate() > 0) {
					discountPrice = (int)(dto.getPrice() * (dto.getDiscountRate()/100.0));
				}
				
				dto.setSalePrice(dto.getPrice() - discountPrice);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public Product findByProduct(long ProductNum) {
		Product dto = null;
		
		try {
			dto = mapper.findByProduct(ProductNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return dto;
	}

	@Override
	public Product findByCategoryName(long categoryNum) {
		Product dto = null;
		
		try {
			dto = mapper.findByCategoryName(categoryNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}


	@Override
	public List<Product> listProductOption(long productNum) {
		List<Product> list = null;
		
		try {
			list = mapper.listProductOption(productNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}


	@Override
	public List<Product> listOptionDetail(long optionNum) {
		List<Product> list = null;
		
		try {
			list = mapper.listOptionDetail(optionNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}


	@Override
	public List<Product> listProductFile(long productNum) {
		List<Product> list = null;
		
		try {
			list = mapper.listProductFile(productNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}


	@Override
	public List<Product> listOptionDetailStock(Map<String, Object> map) {
		List<Product> list = null;
		
		try {
			list = mapper.listOptionDetailStock(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}


	@Override
	public List<Wishlist> findwishlist(Map<String, Object> map) {
		List<Wishlist> wishlist = null;
		
		try {
			wishlist= mapper.findwishlist(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return wishlist;
	}
}
