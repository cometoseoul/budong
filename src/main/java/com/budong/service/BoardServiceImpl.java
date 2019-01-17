package com.budong.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.budong.common.util.FileUtils;
import com.budong.model.BoardSellDAO;
import com.budong.service.interfaces.BoardService;

@Service("boardService")
public class BoardServiceImpl implements BoardService{
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Resource(name="fileUtils")
    private FileUtils fileUtils;
	
	@Resource(name="boardDAO")
	private BoardSellDAO boardDAO;
	
	@Override
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception {
		return boardDAO.selectBoardList(map);
	}

	@Override
	public void insertBoard(Map<String, Object> map, HttpServletRequest request) throws Exception {
	    boardDAO.insertBoard(map);
	     
	    List<Map<String,Object>> list = fileUtils.parseUpdateFileInfo(map, request);
        for(int i=0, size=list.size(); i<size; i++){
        	log.info( i + "¹øÂ° ÀÎµ¦½º : " + list.get(i).get("BOARD_IDX"));
            boardDAO.insertFile(list.get(i));
        }
	}

	@Override
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception {
	    boardDAO.updateHitCnt(map);
	    
	    Map<String, Object> resultMap = new HashMap<String,Object>();
	    Map<String, Object> tempMap = boardDAO.selectBoardDetail(map);
	    resultMap.put("map", tempMap);
	     
	   
	    List<Map<String,Object>> list = boardDAO.selectFileList(map);
	    
	    
	    // log.info("Service List : " + list.size());
	    resultMap.put("list", list);
	     
	    return resultMap;
	}

	@Override
	public void updateBoard(Map<String, Object> map, HttpServletRequest request) throws Exception {
		boardDAO.updateBoard(map);
		
	    boardDAO.deleteFileList(map);
	    List<Map<String,Object>> list = fileUtils.parseUpdateFileInfo(map, request);
	    Map<String,Object> tempMap = null;
	    for(int i=0, size=list.size(); i<size; i++){
	        tempMap = list.get(i);
	        if(tempMap.get("IS_NEW").equals("Y")){
	            boardDAO.insertFile(tempMap);
	        }
	        else{
	            boardDAO.updateFile(tempMap);
	        }
	    }
	}

	@Override
	public void deleteBoard(Map<String, Object> map) throws Exception {
		boardDAO.deleteBoard(map);
		
	}

}
