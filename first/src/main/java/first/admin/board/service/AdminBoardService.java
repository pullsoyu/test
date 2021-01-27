package first.admin.board.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface AdminBoardService {

	List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception;

	/* 공지사항 리스트 */
	List<Map<String, Object>> selectNoticeBoardList(Map<String, Object> map) throws Exception;
	
	/* 이벤트게시판 리스트 */
	List<Map<String, Object>> selectEventBoardList(Map<String, Object> map) throws Exception;
	
	
	void insertBoard(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception;
		
	void updateBoard(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	void deleteBoard(Map<String, Object> map) throws Exception;

	/* 댓글서비스 */
	List<Map<String, Object>> selectCommentBoardList(Map<String, Object> map) throws Exception;

	Map<String, Object> selectNohitBoardDetail(Map<String, Object> map) throws Exception;
	
	void insertCommentBoard(Map<String, Object> map) throws Exception;
			
	void updateCommentBoard(Map<String, Object> map) throws Exception;
	
	void deleteCommentBoard(Map<String, Object> map) throws Exception;
	

}
