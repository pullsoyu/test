package first.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import first.common.dao.AbstractDAO;

@Repository("boardDAO")
public class BoardDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectPagingList("board.selectBoardList", map);
	}
	
	
	/* 공지사항 리스트 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectNoticeBoardList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectPagingList("board.selectNoticeBoardList", map);
	}
	
	/* 이벤트게시판 리스트 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectEventBoardList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectPagingList("board.selectEventBoardList", map);
	}
	
	
	public void insertBoard(Map<String, Object> map) throws Exception {
		insert("board.insertBoard", map);
	}		
	
	public void updateHitCnt(Map<String, Object> map) throws Exception {
		update("board.updateHitCnt", map);
	}

	public void updateNVHitCnt(Map<String, Object> map) throws Exception {
		update("Board.updateNVHitCnt", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("board.selectBoardDetail", map);
	}		
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectNVBoardDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("Board.selectNVBoardDetail", map);
	}	
	
	public void updateBoard(Map<String, Object> map) throws Exception {
		update("board.updateBoard", map);
	}
	
	public void deleteBoard(Map<String, Object> map) throws Exception {
		update("board.deleteBoard", map);
	}		
		
	public void insertFile(Map<String, Object> map) throws Exception{
		insert("board.insertFile", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFileList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("board.selectFileList", map);
	}
	
	public void deleteFileList(Map<String, Object> map) throws Exception {
		update("board.deleteFileList", map);
	}

	public void updateFile(Map<String, Object> map) throws Exception {
		update("board.updateFile", map);
	}		
	
	/* 댓글DAO */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCommentBoardList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("board.selectCommentBoardList", map);
	}
	
	public void insertCommentBoard(Map<String, Object> map) throws Exception {
		insert("board.insertCommentBoard", map);
	}		
		
	public void updateCommentBoard(Map<String, Object> map) throws Exception {
		update("board.updateCommentBoard", map);
	}
	
	public void deleteCommentBoard(Map<String, Object> map) throws Exception {
		delete("board.deleteCommentBoard", map);
	}		
		
}
