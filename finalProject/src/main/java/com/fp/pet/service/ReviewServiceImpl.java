package com.fp.pet.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fp.pet.common.FileManager;
import com.fp.pet.domain.Review;
import com.fp.pet.domain.Summary;
import com.fp.pet.mapper.ReviewMapper;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewMapper mapper;
	
	@Autowired
	private FileManager fileManager;
	
	// 리뷰등록
	@Override
	public void insertReview(Review dto, String pathname) throws Exception {
		try {
			mapper.insertReview(dto);
			
			// 이미지 첨부
			if( ! dto.getSelectFile().isEmpty() ) {
				for(MultipartFile mf : dto.getSelectFile()) {
					String filename = fileManager.doFileUpload(mf, pathname);
					if(filename != null) {
						dto.setFilename(filename);
						
						mapper.insertReviewFile(dto);
					}
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}


	// 리뷰리스트
	@Override
	public List<Review> listReview(Map<String, Object> map) {
		List<Review> list = null;
		
		try {
			list = mapper.listReview(map);
			
			String name;
			for(Review dto : list) {
				if(dto.getFilename() != null) {  // 이미지 있다면
					dto.setListFilename(dto.getFilename().split(","));
				}
				
				// 이름 '*' 처리
				name = dto.getUserName().substring(0,1); 
				if(dto.getUserName().length() <= 2) {
					name += "*";
				} else {
					name += dto.getUserName().substring(2, dto.getUserName().length()).replaceAll(".", "*");
				}
				
				name += dto.getUserName().substring(dto.getUserName().length()-1);
				dto.setUserName(name);
				
				dto.setReview(dto.getReview().replaceAll("\n", "<br>"));
				
				if(dto.getAnswer() != null) {
					dto.setAnswer(dto.getAnswer().replaceAll("\n", "<br>"));
				}
			}			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	// 리뷰수정
	@Override
	public void updateReview(Review dto) throws Exception {
		try {
			mapper.updateReview(dto);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	// 리뷰삭제
	@Override
	public void deleteReview(long num, String pathname) throws Exception {
		try {
			List<Review> listFile = mapper.listReviewFile(num);
			if (listFile != null) {
				for (Review dto : listFile) {
					fileManager.doFileDelete(dto.getFilename(), pathname);
				}
			}
			
			mapper.deleteReview(num);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
	
	// 별점
	@Override
	public Summary findByReviewSummary(Map<String, Object> map) {
		Summary dto = null;
		
		try {
			dto = mapper.findByReviewSummary(map);

			dto.setScoreRate1((int)((double)dto.getScore1()/dto.getCount() * 100 + 0.5));
			dto.setScoreRate2((int)((double)dto.getScore2()/dto.getCount() * 100 + 0.5));
			dto.setScoreRate3((int)((double)dto.getScore3()/dto.getCount() * 100 + 0.5));
			dto.setScoreRate4((int)((double)dto.getScore4()/dto.getCount() * 100 + 0.5));
			dto.setScoreRate5((int)((double)dto.getScore5()/dto.getCount() * 100 + 0.5));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

// ----------------------------------------------------------------------	
	// 마이페이지 - 리뷰 내역
	
	// 리뷰개수 
	@Override
	public int dataCount2(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.dataCount2(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	// 리뷰 리스트
	@Override
	public List<Review> listReview2(Map<String, Object> map) {
		List<Review> list = null;
		
		try {
			list = mapper.listReview2(map);
			
			for (Review dto : list) {
				if(dto.getFilename() != null) {
					dto.setListFilename(dto.getFilename().split(",")); 
				}
				
				dto.setReview(dto.getReview().replaceAll("\n", "<br>"));
				
				if(dto.getAnswer() != null) {
					dto.setAnswer(dto.getAnswer().replaceAll("\n", "<br>"));
				}
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

}
