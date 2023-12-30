package com.fp.pet.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.pet.domain.Qna;
import com.fp.pet.mapper.QnaMapper;

@Service
public class QnaServiceImpl implements QnaService {
	@Autowired
	private QnaMapper mapper;

	@Override
	public void insertQna(Qna dto) throws Exception {
		try {
			if(dto.getProductNum() == null || dto.getProductNum() == 0) {
				dto.setProductNum(null);
			}
			mapper.insertQna(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.dataCount(map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public List<Qna> listQna(Map<String, Object> map) {
		List<Qna> list = null;

		try {
			list = mapper.listQna(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public Qna findById(long num) {
		Qna dto = null;

		try {
			dto = mapper.findById(num);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}
	
	@Override
	public void deleteQna(long num) throws Exception {
		try {
			mapper.deleteQna(num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int dataCount2(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.dataCount2(map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;	
	}

	@Override
	public List<Qna> listProduct(Map<String, Object> map) {
		List<Qna> list = null;

		try {
			list = mapper.listProduct(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public Qna findByPrev(Map<String, Object> map) {
		Qna dto = null;

		try {
			dto = mapper.findByPrev(map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public Qna findByNext(Map<String, Object> map) {
		Qna dto = null;

		try {
			dto = mapper.findByNext(map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public void updateQna(Qna dto) throws Exception {
		try {
			mapper.updateQna(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}	

}
