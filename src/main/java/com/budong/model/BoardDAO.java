package com.budong.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.budong.common.dao.AbstractDAO;

@Repository("boardDAO")
public class BoardDAO extends AbstractDAO{
	 @SuppressWarnings("unchecked")
	    public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception{
	        return (List<Map<String, Object>>)selectList("board.selectBoardList", map);
	    }
}
