package com.fp.pet.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fp.pet.common.FileManager;
import com.fp.pet.domain.Community;
import com.fp.pet.domain.Friend;
import com.fp.pet.domain.Reply;
import com.fp.pet.mapper.CommunityMapper;


@Service
public class CommunityServiceImpl implements CommunityService {
	@Autowired
	private CommunityMapper mapper;
	
	@Autowired
	private FileManager fileManager;
	

	// 커뮤니티 등록	
	@Override
	public void insertCommunity(Community dto, String pathname) throws Exception {
		try {
			
			long seq = mapper.communitySeq();
			dto.setCommunityNum(seq);
			
			mapper.insertCommunity(dto);

			// 파일 업로드
			if (!dto.getSelectFile().isEmpty()) {
				for (MultipartFile mf : dto.getSelectFile()) {
					String saveFilename = fileManager.doFileUpload(mf, pathname);
					if (saveFilename == null) {
						continue;
					}

					dto.setFilename(saveFilename);

					insertCommunityFile(dto);
					
				}
			}
			 double la = dto.getLa();
			 double ma = dto.getMa();
			 
			 if (dto.getLas() != null && !dto.getLas().isEmpty()) {
				   for (int i = 0; i < dto.getLas().size(); i++) {
					  
					    la = dto.getLas().get(i);
		                // mas 리스트의 각 값을 ma에 저장
		                ma = dto.getMas().get(i);
		                // la, ma 값을 출력
		                Map<String, Object> map = new HashMap<>();
		                map.put("la",la);
		                map.put("ma", ma);
		                map.put("communityNum", dto.getCommunityNum());
		                map.put("distance",dto.getDistance());
		                mapper.insertMap(map);
				   }
			 }
			
				 
			

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	// 커뮤니티 리스트
	@Override
	public List<Community> listCommunity(Map<String, Object> map) {
		List<Community> list = null;

		try {
			list = mapper.listCommunity(map);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	// 커뮤니티 전체수
	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;

		try {
			result = mapper.dataCount(map);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	// 조회수 증가
	@Override
	public void updateHitCount(long communityNum) throws Exception {
		try {
			mapper.updateHitCount(communityNum);

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}	

	}

	// 커뮤니티 가져오기
	@Override
	public Community findById(long communityNum) {
		Community dto = null;

		try {
			dto = mapper.findById(communityNum);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	// 이전글
	@Override
	public Community findByPrev(Map<String, Object> map) {
		Community dto = null;

		try {
			dto = mapper.findByPrev(map);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	// 다음글
	@Override
	public Community findByNext(Map<String, Object> map) {
		Community dto = null;

		try {
			dto = mapper.findByNext(map);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	// 커뮤니티 글 수정
	@Override
	public void updateCommunity(Community dto, String pathname) throws Exception {

		try {
				mapper.updateCommunity(dto);

			// 파일 업로드
			if (!dto.getSelectFile().isEmpty()) {
				for (MultipartFile mf : dto.getSelectFile()) {
					String saveFilename = fileManager.doFileUpload(mf, pathname);
					if (saveFilename == null) {
						continue;
					}

					dto.setFilename(saveFilename);

					insertCommunityFile(dto);
					
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	// 커뮤니티 파일리스트
	@Override
	public Community findByFileId(long fileNum) {
		Community dto = null;

		try {
			dto = mapper.findByFileId(fileNum);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	// 커뮤니티 삭제
	@Override
	public void deleteCommunity(long communityNum, String pathname, String userId) throws Exception {
		try {

				Community vo = findById(communityNum);
				if(vo == null) {
					return;
				}
				
				List<Community> listFile = listCommunityFile(communityNum);
				if (listFile != null) {
					for (Community dto : listFile) {
						fileManager.doFileDelete(dto.getFilename(), pathname);
					}
				}
				
				// 파일 테이블 내용 지우기
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("field", "communityNum");
				map.put("communityNum", communityNum);
				deleteCommunityFile(map);

				deletecommunitymap(map);
				mapper.deleteCommunity(communityNum);
				
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}	

	}

	// 커뮤니티 파일 삭제
	@Override
	public void deleteCommunityFile(Map<String, Object> map) throws Exception {
		try {
			mapper.deleteCommunityFile(map);

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	// 카카오맵 삭제
	@Override
	public void deletecommunitymap(Map<String, Object> map) throws Exception {
		try {
			mapper.deletecommunitymap(map);

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	// 게시글 좋아요 추가
	@Override
	public void insertBoardLike(Map<String, Object> map) throws Exception {
		try {
			mapper.insertBoardLike(map);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
	
	// 게시글 좋아요 삭제
	@Override
	public void deleteBoardLike(Map<String, Object> map) throws Exception {
		try {
			mapper.deleteBoardLike(map);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
	
	// 게시글 좋아요 개수
	@Override
	public int boardLikeCount(long communityNum) {
		int result = 0;
		
		try {
			result = mapper.boardLikeCount(communityNum);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	// 좋아요 여부
	@Override
	public boolean userBoardLiked(Map<String, Object> map) {
		boolean result = false;
		
		try {
			Community dto = mapper.userBoardLiked(map);
			
			if(dto != null) {
				
				result = true; 
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	// 댓글등록
	@Override
	public void insertReply(Reply dto) throws Exception {
		try {
			mapper.insertReply(dto);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	// 댓글개수
	@Override
	public int replyCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.replyCount(map);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	// 댓글 삭제
	@Override
	public void deleteReply(Map<String, Object> map) throws Exception {
		try {
			mapper.deleteReply(map);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	// 댓글리스트
	@Override
	public List<Reply> listReply(Map<String, Object> map) {
		List<Reply> list = null;
		
		try {
			list = mapper.listReply(map);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	// 답글리스트
	@Override
	public List<Reply> listReplyAnswer(Map<String, Object> map) {
		List<Reply> list = null;
		
		try {
			list = mapper.listReplyAnswer(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	// 답글개수
	@Override
	public int replyAnswerCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.replyAnswerCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	// 댓글 보이기/숨기기
	@Override
	public void updateReplyShowHide(Map<String, Object> map) throws Exception {
		try {
			mapper.updateReplyShowHide(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}		
	}

	// 카테고리 리스트
	@Override
	public List<Community> listCategory(Map<String, Object> map) {
		List<Community> listCategory = null;
		
		try {
			listCategory = mapper.listCategory(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return listCategory;
	}

	// 다중 이미지 파일 인서트
	@Override
	public void insertCommunityFile(Community dto) throws Exception {
		try {
			mapper.insertCommunityFile(dto);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	// 다중 이미지 리스트
	@Override
	public List<Community> listCommunityFile(long communityNum) {
		List<Community> listFile = null;

		try {
			listFile = mapper.listCommunityFile(communityNum);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return listFile;
	}


	// 친구여부
	@Override
	public Friend friendWhether (Map<String, Object>map) {
		Friend dto = null;
		
		try {
			dto = mapper.friendWhether(map);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	// 친구정보
	@Override
	public Community findName(Map<String, Object>map) {
		Community dto = null;
		
		try {
			dto = mapper.findName(map);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	// 친구추가
	@Override
	public void addFriend(Map<String, Object> map) throws Exception {
		try {
			mapper.addFriend(map);
			mapper.addFriend2(map);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
	
 // ------------------------------------------------------------------
	// 내활동 
	
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

	@Override
	public List<Community> listCommunity2(Map<String, Object> map) {
		List<Community> list = null;
		
		try {
			list = mapper.listCommunity2(map);
			
			for (Community dto : list) {
				if(dto.getFilename() != null) {
					dto.setListFilename(dto.getFilename().split(",")); 
				}
				
				dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	// 좋아요 개수
	@Override
	public int likeCount2(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.likeCount2(map);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	// 좋아요 리스트
	@Override
	public List<Community> listLike2(Map<String, Object> map) {
		List<Community> list = null;
		
		try {
			list = mapper.listLike2(map);
			
			for (Community dto : list) {
				if(dto.getFilename() != null) {
					dto.setListFilename(dto.getFilename().split(",")); 
				}
				
				dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Community> finByMap(long communityNum) {
		List<Community> list = null;
		try {
			list = mapper.findByMap(communityNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}


}
