package com.fp.pet.admin.service;

import java.util.List;
import java.util.Map;

import com.fp.pet.admin.domain.CsBoard;

public interface CsManageService {

	
	public int dataCountfaq(Map<String, Object> map);
	
	public List<CsBoard> listfaq(Map<String, Object>map);
	public List<CsBoard> listnotice(Map<String, Object>map);
	public List<CsBoard> listqna(Map<String, Object>map);
	
	public void insertNotice(CsBoard dto) throws Exception;
	public void insertNoticeFile(CsBoard dto, String path) throws Exception;
	public void insertFaq(CsBoard dto) throws Exception;
	public void updateFaq(CsBoard dto) throws Exception;
	public void updateQna(CsBoard dto) throws Exception;
	public void updateQnaupdate(CsBoard dto) throws Exception;
	
	public void deletenotice(int nnum);
	public void deletefaq(int fnum);
	public CsBoard findfaq(int fnum);
	public CsBoard findqna(int qnum);
	
	public CsBoard findnoticebynum(int nnum);
	
}
