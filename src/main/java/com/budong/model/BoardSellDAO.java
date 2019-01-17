package com.budong.model;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.budong.common.dao.AbstractDAO;
import com.budong.controller.BoardSellController;

@Repository("boardDAO")
public class BoardSellDAO extends AbstractDAO {
	private static final Logger log = LoggerFactory.getLogger(BoardSellController.class);


	public void insertBoard(Map<String, Object> map) throws Exception {
		insert("board.insertBoard", map);
	}

	public void updateHitCnt(Map<String, Object> map) throws Exception {
		update("board.updateHitCnt", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("board.selectBoardDetail", map);
	}

	public void updateBoard(Map<String, Object> map) throws Exception{
	    update("board.updateBoard", map);
	}

	public void deleteBoard(Map<String, Object> map) throws Exception{
	    delete("delete.deleteBoard", map);
	}

	public void insertFile(Map<String, Object> map) throws Exception{
	    insert("board.insertFile", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFileList(Map<String, Object> map) throws Exception{
		//log.info("DAO IDX : " + map.get("IDX") + "");
		
	    return (List<Map<String, Object>>)selectList("board.selectFileList", map);
	}

	public void deleteFileList(Map<String, Object> map) throws Exception{
	    update("board.deleteFileList", map);
	}
	 
	public void updateFile(Map<String, Object> map) throws Exception{
	    update("board.updateFile", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception{
	    return (List<Map<String, Object>>)selectPagingList("board.selectBoardList", map);
	}




}
