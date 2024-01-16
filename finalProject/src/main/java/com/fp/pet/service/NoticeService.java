package com.fp.pet.service;

import java.util.List;
import java.util.Map;

import com.fp.pet.domain.Notice;

public interface NoticeService {
	public int dataCount(Map<String, Object> map);
	public List<Notice> listNoticeTop();
	public List<Notice> listNotice(Map<String, Object> map);
	
	public void updateHitCount(long num) throws Exception;
	public Notice findById(long num);
	public Notice findByPrev(Map<String, Object> map);
	public Notice findByNext(Map<String, Object> map);
	
	public List<Notice> listNoticeFile(long num);
	public Notice findByFileId(long fileNum);
	
	public void updateNotice(Notice dto, String pathname) throws Exception;
	public void deleteNotice(long num, String pathname) throws Exception;
	public void deleteNoticeFile(Map<String, Object> map) throws Exception;


}
