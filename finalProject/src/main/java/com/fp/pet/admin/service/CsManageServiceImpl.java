package com.fp.pet.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.pet.admin.domain.CsBoard;
import com.fp.pet.admin.mapper.CsManageMapper;
import com.fp.pet.common.FileManager;

@Service
public class CsManageServiceImpl implements CsManageService {
	
	@Autowired
	private FileManager fileManager;

	@Autowired
	private CsManageMapper mapper;
	
	@Override
	public int dataCountfaq(Map<String, Object> map) {

		int result = 0;

		try {
			result = mapper.dataCountfaq(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<CsBoard> listfaq(Map<String, Object> map) {
		List<CsBoard> listfaq = null;
		
		try {
			listfaq=mapper.listfaq(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listfaq;
	}

	@Override
	public List<CsBoard> listnotice(Map<String, Object> map) {
		List<CsBoard> listnotice = null;
		try {
			listnotice=mapper.listnotice(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listnotice;
	}

	@Override
	public List<CsBoard> listqna(Map<String, Object> map) {
		List<CsBoard> listqna = null;
		try {
			listqna=mapper.listqna(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listqna;
	}

	@Override
	public void insertNotice(CsBoard dto) throws Exception {
		
		try {
			mapper.insertNotice(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
	
	@Override
	public void insertNoticeFile(CsBoard dto, String path) throws Exception {
		
		try {
			String saveFilename = fileManager.doFileUpload(dto.getSelectFile(), path);
			if (saveFilename != null) {
				dto.setSaveFilename(saveFilename);
				dto.setOriginalFilename(dto.getSelectFile().getOriginalFilename());
			}
			
			mapper.insertNoticeFile(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void insertFaq(CsBoard dto) throws Exception {

		try {
			mapper.insertFaq(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void updateQna(CsBoard dto) throws Exception {

		try {
			mapper.updateQna(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

}
