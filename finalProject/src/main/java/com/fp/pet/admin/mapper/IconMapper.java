package com.fp.pet.admin.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fp.pet.admin.domain.Icon;

@Mapper
public interface IconMapper {
   public void insertIcon(Icon dto) throws SQLException;
   public int dataCount(Map<String,Object> map) throws Exception;
   public List<Icon> listIcon(Map<String,Object>map);
   public void deleteIcon(long iconNum) throws SQLException; 

}