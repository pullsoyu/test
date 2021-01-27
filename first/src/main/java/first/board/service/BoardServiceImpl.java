package first.board.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import first.board.dao.BoardDAO;
import first.common.util.FileUtils;

@Service("boardService")
public class BoardServiceImpl implements BoardService{
	
Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Resource(name="boardDAO")
	private BoardDAO boardDAO;
	
	@Override
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception {
		return boardDAO.selectBoardList(map);
	}
	
	
	/* 공지사항 리스트 */
	@Override
	public List<Map<String, Object>> selectNoticeBoardList(Map<String, Object> map) throws Exception {
		return boardDAO.selectNoticeBoardList(map);
	}
	
	/* 이벤트게시판 리스트 */
	@Override
	public List<Map<String, Object>> selectEventBoardList(Map<String, Object> map) throws Exception {
		return boardDAO.selectEventBoardList(map);
	}
	
	
	@Override
	public void insertBoard(Map<String, Object> map, HttpServletRequest request) throws Exception {
		boardDAO.insertBoard(map);
		
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(map, request);
		for(int i=0, size=list.size(); i<size; i++){
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
		resultMap.put("list", list);
		
		List<Map<String, Object>> commentList = boardDAO.selectCommentBoardList(map);
		resultMap.put("commentList", commentList);
		
		return resultMap;
	}
	
	@Override
	public Map<String, Object> selectNohitBoardDetail(Map<String, Object> map) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		Map<String, Object> tempMap = boardDAO.selectBoardDetail(map);
		resultMap.put("map", tempMap);
		
		List<Map<String,Object>> list = boardDAO.selectFileList(map); 
		resultMap.put("list", list);
		
		List<Map<String, Object>> commentList = boardDAO.selectCommentBoardList(map);
		resultMap.put("commentList", commentList);
		
		return resultMap;
	}

	@Override
	public void updateBoard(Map<String, Object> map, HttpServletRequest request) throws Exception{
		boardDAO.updateBoard(map);
	
		boardDAO.deleteFileList(map);
		List<Map<String, Object>> list = fileUtils.parseUpdateFileInfo(map, request);
		Map<String, Object> tempMap = null;
		
		for (int i = 0, size = list.size(); i < size; i++) {
			tempMap = list.get(i);
			if (tempMap.get("IS_NEW").equals("Y")) {
				boardDAO.insertFile(tempMap);
			} else {
				boardDAO.updateFile(tempMap);
			}
		}
	}

	@Override
	public void deleteBoard(Map<String, Object> map) throws Exception {
		boardDAO.deleteBoard(map);
	}

	/* 댓글서비스 */
	@Override
	public List<Map<String, Object>> selectCommentBoardList(Map<String, Object> map) throws Exception {
		return boardDAO.selectCommentBoardList(map);		
	}
	
	@Override
	public void insertCommentBoard(Map<String, Object> map) throws Exception {
		boardDAO.insertCommentBoard(map);
	}

	@Override
	public void updateCommentBoard(Map<String, Object> map) throws Exception{
		boardDAO.updateCommentBoard(map);
	}

	@Override
	public void deleteCommentBoard(Map<String, Object> map) throws Exception {
		boardDAO.deleteCommentBoard(map);
	}
	
	
}