package com.fp.pet.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.pet.admin.domain.Icon;
import com.fp.pet.admin.mapper.IconMapper;
import com.fp.pet.common.FileManager;

@Service
public class IconServiceImpl implements IconService{
	
	@Autowired
	private IconMapper mapper;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public void insertIcon(Icon dto, String pathname) throws Exception {
		try {
			String saveFilename = fileManager.doFileUpload(dto.getSelectFile(), pathname);
			if (saveFilename != null) {
				dto.setIconImage(saveFilename);
				
				mapper.insertIcon(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public int dataCount(Map<String,Object> map) throws Exception {
		int result = 0;
		try {
			result = mapper.dataCount(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return result;
	}

	@Override
	public List<Icon> listIcon(Map<String, Object> map) {
		List<Icon> list = null;
		try {
			list = mapper.listIcon(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return list;
	}

	@Override
	public void deleteIcon(long iconNum, String pathname) throws Exception {
		try {
			if(pathname!= null) {
				fileManager.doFileDelete(pathname);
			}
			
			
			mapper.deleteIcon(iconNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void updateIcon(Icon dto, String pathname) throws Exception {
		String saveFilename = fileManager.doFileUpload(dto.getSelectFile(), pathname);
		if (saveFilename != null) {
			if (dto.getIconImage() != null && dto.getIconImage().length() != 0) {
				fileManager.doFileDelete(dto.getIconImage(), pathname);
			}
			dto.setIconImage(saveFilename);
		}
		System.out.println(dto.getIconName());
		System.out.println(dto.getIconNum());
		System.out.println(dto.getIconImage());
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		mapper.updateIcon(dto);
	}

}
