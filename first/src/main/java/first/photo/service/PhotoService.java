package first.photo.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface PhotoService {

	List<Map<String, Object>> selectPhotoList(Map<String, Object> map) throws Exception;

	void insertPhoto(Map<String, Object> map, HttpServletRequest request) throws Exception;

	Map<String, Object> selectPhotoDetail(Map<String, Object> map) throws Exception;

	void modifyPhoto(Map<String, Object> map) throws Exception;

	void photoDelete(Map<String, Object> map) throws Exception;

	void commentWrite(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> photoCommentList(Map<String, Object> map) throws Exception;

	void photoCommentDelete(Map<String, Object> map) throws Exception;

	void photoCommentModify(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> selectPhotoCommentList(Map<String, Object> map) throws Exception;
	
}
