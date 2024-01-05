package com.fp.pet.admin.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fp.pet.admin.domain.CsBoard;

@Mapper
public interface CsManageMapper {
	public int dataCountfaq(Map<String, Object> map);
	
	public List<CsBoard> listfaq(Map<String, Object>map);
	public List<CsBoard> listnotice(Map<String, Object>map);
	public List<CsBoard> listqna(Map<String, Object>map);
	
	public void insertNotice(CsBoard dto) throws SQLException;
	public void insertNoticeFile(CsBoard dto) throws SQLException;
	public void insertFaq(CsBoard dto) throws SQLException;
	
	public void updateQna(CsBoard dto) throws SQLException;
	
}
