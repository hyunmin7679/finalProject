package com.fp.pet.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fp.pet.domain.Notice;

@Mapper
public interface NoticeMapper {
	public void updateNotice(Notice dto) throws SQLException;
	public void deleteNotice(long num) throws SQLException;
	public int dataCount(Map<String, Object> map);
	public List<Notice> listNoticeTop();
	public List<Notice> listNotice(Map<String, Object> map);
	
	public Notice findById(long num);
	public void updateHitCount(long num) throws SQLException;
	public Notice findByPrev(Map<String, Object> map);
	public Notice findByNext(Map<String, Object> map);

	public void insertNoticeFile(Notice dto) throws SQLException;
	public List<Notice> listNoticeFile(long num);
	public Notice findByFileId(long fileNum);
	public void deleteNoticeFile(Map<String, Object> map) throws SQLException;

}
