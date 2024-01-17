package com.fp.pet.service;

import java.util.List;
import java.util.Map;

import com.fp.pet.domain.Qna;

public interface QnaService {
	public void insertQna(Qna dto, String pathname) throws Exception;
	
	public void deleteQna(long num, String pathname) throws Exception;
	
	
	public int dataCount(Map<String, Object> map);
	public List<Qna> listQna(Map<String, Object> map);
	public List<Qna> listQnaFile(long num) throws Exception;
	
	public Qna findById(long num);
	
	public Qna findByPrev(Map<String, Object> map);
	public Qna findByNext(Map<String, Object> map);
	
	public void updateQna(Qna dto, String pathname) throws Exception;
	
	// 문의 시 상품검색
	public int dataCount2(Map<String, Object> map);
	public List<Qna> listProduct(Map<String, Object> map);
	public Qna findByFileId(long fileNum);
	public void deleteQnaFile(Map<String, Object> map) throws Exception;
	void insertQnaFile(Qna dto) throws Exception;
	
	// 내 활동
	public List<Qna> listQna2(Map<String, Object> map);
	public int dataCount3(Map<String, Object> map);
}
