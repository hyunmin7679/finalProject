package com.fp.pet.admin.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.fp.pet.admin.domain.Product;

@Mapper
public interface ProductManageMapper {
	
	
	public List<Product> productDetail(long sort);
	
	public long productSeq();
	public void insertProduct(Product dto) throws SQLException;
	public void insertStock(@Param("productNum")long productNum, @Param("detailNumber1") long detailNumber1, @Param("detailNumber2") long detailNumber2, @Param("sancMemo") long sancMemo);
	public void updateStock(@Param("detailNumber1") long detailNumber1, @Param("detailNumber2") long detailNumber2, @Param("productNum")long productNum,@Param("sancMemo") long sancMemo);
	public void insertProductFile(Product dto) throws SQLException;
	
	public long optionSeq();
	public void insertProductOption(Product dto) throws SQLException;

	public long detailSeq();
	public void insertOptionDetail(Product dto) throws SQLException;

	public Product findByCategory(long categoryNum);
	
	public Integer findyByProNum(Map<String, Object> map);
	
	public List<Product> listCategory();
	public List<Product> chart1();
	public List<Product> chart2();
	public List<Product> listSubCategory(long parentNum);
	
	public int dataCount(Map<String, Object> map);
	public List<Product> listProduct(Map<String, Object> map);
	public List<Product> sublistProduct(Map<String, Object> map);
	public List<Product> stocklistProduct(Map<String, Object> map);
	public Product findById(long productNum);
	public List<Product> listProductFile(long productNum);
	public List<Product> listProductOption(long productNum);
	public List<Product> listOptionDetail(long optionNum);
	public String findThumb(long productNum);
	public void updateProduct(Product dto) throws SQLException;
	public void deleteProduct(long productNum) throws SQLException;
	public void deleteProductFile(long fileNum) throws SQLException;
	public void updateProductOption(Product dto) throws SQLException;
	public void deleteProductOption(long optionNum) throws SQLException;
	public void updateOptionDetail(Product dto) throws SQLException;
	public void deleteOptionDetail(long detailNum) throws SQLException;
	public void deleteOptionDetailStock(long detailNum)throws SQLException;
	
	
	public List<Product> selectOptionFinal(long productNum);
	public void deleteOptionDetailFinal(long optionNum) throws SQLException;
	public void deleteProductOptionFinal(long productNum) throws SQLException;

}
