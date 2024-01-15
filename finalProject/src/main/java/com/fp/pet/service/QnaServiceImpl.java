package com.fp.pet.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fp.pet.common.FileManager;
import com.fp.pet.domain.Qna;
import com.fp.pet.mapper.QnaMapper;

@Service
public class QnaServiceImpl implements QnaService {
	@Autowired
	private QnaMapper mapper;
	
	@Autowired
	private FileManager fileManager;

	@Override
	public void insertQna(Qna dto, String pathname) throws Exception {
		try {
			if(dto.getProductNum() == null || dto.getProductNum() == 0) {
				dto.setProductNum(null);
			}
			mapper.insertQna(dto);
			
			if( ! dto.getSelectFile().isEmpty() ) {
				for(MultipartFile mf : dto.getSelectFile()) {
					String filename = fileManager.doFileUpload(mf, pathname);
					if(filename != null) {
						dto.setFilename(filename);
						
						mapper.insertQnaFile(dto);
					}
				}
			}
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
	public Qna findByFileId(long fileNum) {
		Qna dto = null;

		try {
			dto = mapper.findByFileId(fileNum);
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
	public void deleteQnaFile(Map<String, Object> map) throws Exception {
		try {
			mapper.deleteQnaFile(map);

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
	
	// 다중 이미지 리스트
	@Override
	public List<Qna> listQnaFile(long num) {
		List<Qna> listFile = null;

		try {
			listFile = mapper.listQnaFile(num);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return listFile;
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
	public void updateQna(Qna dto, String pathname) throws Exception {
		try {
			mapper.updateQna(dto);
			
			// 파일 업로드
			if (!dto.getSelectFile().isEmpty()) {
				for (MultipartFile mf : dto.getSelectFile()) {
					String saveFilename = fileManager.doFileUpload(mf, pathname);
					if (saveFilename == null) {
						continue;
					}

					dto.setFilename(saveFilename);

					insertQnaFile(dto);
					
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	// 다중 이미지 파일 인서트
	@Override
	public void insertQnaFile(Qna dto) throws Exception {
		try {
			mapper.insertQnaFile(dto);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}
