package com.fp.pet.service;

import java.util.List;
import java.util.Map;

import com.fp.pet.domain.Qna;

public interface QnaService {
	public void insertQna(Qna dto) throws Exception;
	public void deleteQna(long num) throws Exception;
	
	public int dataCount(Map<String, Object> map);
	public List<Qna> listQna(Map<String, Object> map);
	
	public Qna findById(long num);
	
	// 문의 시 상품검색
	public int dataCount2(Map<String, Object> map);
	public List<Qna> listProduct(Map<String, Object> map);
}
