package com.fp.pet.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fp.pet.domain.Qna;


@Mapper
public interface QnaMapper {
	public void insertQna(Qna dto) throws SQLException;
	public void deleteQna(long num) throws SQLException;
	
	public int dataCount(Map<String, Object> map);
	public List<Qna> listQna(Map<String, Object> map);
	
	public Qna findById(long num);
	
	// 문의 시 상품검색
	public List<Qna> listProduct(Map<String, Object> map);
	public int dataCount2(Map<String, Object> map);
}
