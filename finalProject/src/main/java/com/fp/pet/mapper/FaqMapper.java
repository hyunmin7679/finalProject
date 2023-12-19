package com.fp.pet.mapper;

import java.util.List;
import java.util.Map;

import com.fp.pet.domain.Faq;

public interface FaqMapper {
	public int dataCount(Map<String, Object> map);
	public List<Faq> listFaq(Map<String, Object> map);
	public List<Faq> listCategory(Map<String, Object> map);
}
