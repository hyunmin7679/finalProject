package com.fp.pet.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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
			listfaq = mapper.listfaq(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listfaq;
	}

	@Override
	public List<CsBoard> listnotice(Map<String, Object> map) {
		List<CsBoard> listnotice = null;
		try {
			listnotice = mapper.listnotice(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listnotice;
	}

	@Override
	public List<CsBoard> listqna(Map<String, Object> map) {
		List<CsBoard> listqna = null;
		try {
			listqna = mapper.listqna(map);
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
	        if (!dto.getSelectFile().isEmpty()) {
	            for (MultipartFile mf : dto.getSelectFile()) {
	                String saveFilename = fileManager.doFileUpload(mf, path);
	                if (saveFilename == null) {
	                    throw new Exception("File upload failed for: " + mf.getOriginalFilename());
	                }
	                dto.setSaveFilename(saveFilename);
	                dto.setOriginalFilename(mf.getOriginalFilename());

	                
	                mapper.insertNoticeFile(dto);
	            }
	        }
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
	public void updateFaq(CsBoard dto) throws Exception {
		try {
			mapper.updateFaq(dto);
		} catch (Exception e) {
			e.printStackTrace();
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
	
	@Override
	public void updateQnaupdate(CsBoard dto) throws Exception {
		try {
			mapper.updateQnaupdate(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public CsBoard findnoticebynum(int nnum) {
		CsBoard dto = null;

		try {
			dto = mapper.findnoticebynum(nnum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return dto;
	}

	@Override
	public void deletenotice(int nnum) {
		List<CsBoard> list= null;
		
		try {
			list= mapper.findnoticefile(nnum);
			if(list != null) {
				mapper.deletenoticeFile(nnum);
			} else {
			}
			mapper.deletenotice(nnum);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
			
	}

	@Override
	public void deletefaq(int fnum) {
		
		try {
			mapper.deletefaq(fnum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public CsBoard findfaq(int fnum) {
		CsBoard dto = null;
		
		try {
			dto=mapper.findfaq(fnum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public CsBoard findqna(int qnum) {
		CsBoard dto = null;
		
		try {
			dto = mapper.findqna(qnum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	


}
