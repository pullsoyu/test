package first.photo.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import first.common.dao.AbstractDAO;

@Repository("photoDAO")
public class PhotoDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectPhotoList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectPagingList("board.selectPhotoList", map);
	}

	public void insertPhoto(Map<String, Object> map) throws Exception {
		insert("board.insertPhoto", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectPhotoDetail(Map<String, Object> map) throws Exception {
		
		return (Map<String, Object>) selectOne("board.selectBoardDetail", map);
	}

	public void insertPhotoImage(Map<String, Object> map) throws Exception {
		insert("board.insertPhotoImage", map);
		
	}

	public void updatePhoto(Map<String, Object> map) throws Exception {
		update("board.updatePhoto", map);
		
	}
	
	public void updatePhotoImage(Map<String, Object> map) throws Exception {
		insert("board.updatePhotoImage", map);
		
	}

	public void deletePhoto(Map<String, Object> map) throws Exception {
		delete("board.deletePhoto", map);
		
	}

	public void commentWrite(Map<String, Object> map) throws Exception {
		insert("board.commentWrite", map);
		
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> commentList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectList("board.photoCommentList", map);
	}

	public void photoCommentDelete(Map<String, Object> map) throws Exception {
		delete("board.photoCommentDelete",map);
	}

	public void photoCommentModify(Map<String, Object> map) throws Exception {
		update("board.photoCommentModify",map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectPhotoCommentList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectPagingList("board.selectPhotoCommentList", map);
	}

	
}
