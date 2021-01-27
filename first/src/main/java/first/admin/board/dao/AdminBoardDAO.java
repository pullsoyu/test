package first.admin.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import first.common.dao.AbstractDAO;

@Repository("adminBoardDAO")
public class AdminBoardDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectPagingList("adminBoard.selectBoardList", map);
	}
	
	/* 공지사항 리스트 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectNoticeBoardList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectPagingList("adminBoard.selectNoticeBoardList", map);
	}
	
	/* 이벤트게시판 리스트 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectEventBoardList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectPagingList("adminBoard.selectEventBoardList", map);
	}
	
	
	public void insertBoard(Map<String, Object> map) throws Exception {
		insert("adminBoard.insertBoard", map);
	}		
	
	public void updateHitCnt(Map<String, Object> map) throws Exception {
		update("adminBoard.updateHitCnt", map);
	}
	
	public void updateNVHitCnt(Map<String, Object> map) throws Exception {
		update("adminBoard.updateNVHitCnt", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("adminBoard.selectBoardDetail", map);
	}		
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectNVBoardDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("adminBoard.selectNVBoardDetail", map);
	}		
	
	public void updateBoard(Map<String, Object> map) throws Exception {
		update("adminBoard.updateBoard", map);
	}
	
	public void deleteBoard(Map<String, Object> map) throws Exception {
		update("adminBoard.deleteBoard", map);
	}		
		
	public void insertFile(Map<String, Object> map) throws Exception{
		insert("adminBoard.insertFile", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFileList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("adminBoard.selectFileList", map);
	}
	
	public void deleteFileList(Map<String, Object> map) throws Exception {
		update("adminBoard.deleteFileList", map);
	}

	public void updateFile(Map<String, Object> map) throws Exception {
		update("adminBoard.updateFile", map);
	}		
	
	/* 댓글DAO */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCommentBoardList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("adminBoard.selectCommentBoardList", map);
	}
	
	public void insertCommentBoard(Map<String, Object> map) throws Exception {
		insert("adminBoard.insertCommentBoard", map);
	}		
		
	public void updateCommentBoard(Map<String, Object> map) throws Exception {
		update("adminBoard.updateCommentBoard", map);
	}
	
	public void deleteCommentBoard(Map<String, Object> map) throws Exception {
		delete("adminBoard.deleteCommentBoard", map);
	}		
		
}
