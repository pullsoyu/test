package first.photo.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import first.board.dao.BoardDAO;
import first.photo.dao.PhotoDAO;

@Service("photoService")
public class PhotoServiceImpl implements PhotoService{

	@Resource(name="photoDAO")
	private PhotoDAO photoDAO;
	
	@Resource(name="boardDAO")
	private BoardDAO boardDAO;
	
	@Override
	public List<Map<String, Object>> selectPhotoList(Map<String, Object> map) throws Exception {
		return photoDAO.selectPhotoList(map);
	}

	@Override
	public void insertPhoto(Map<String, Object> map, HttpServletRequest request) throws Exception {
		photoDAO.insertPhoto(map);
		photoDAO.insertPhotoImage(map);
		
		
	}

	@Override
	public Map<String, Object> selectPhotoDetail(Map<String, Object> map) throws Exception {
		boardDAO.updateHitCnt(map);
		
		map = photoDAO.selectPhotoDetail(map);
		
		return map;
	}

	@Override
	public void modifyPhoto(Map<String, Object> map) throws Exception {
		photoDAO.updatePhoto(map);
		photoDAO.updatePhotoImage(map);
		
	}

	@Override
	public void photoDelete(Map<String, Object> map) throws Exception {
		photoDAO.deletePhoto(map);
		
	}

	@Override
	public void commentWrite(Map<String, Object> map) throws Exception {
		photoDAO.commentWrite(map);
		
	}

	@Override
	public List<Map<String, Object>> photoCommentList(Map<String, Object> map) throws Exception {
		return photoDAO.commentList(map);
	}

	@Override
	public void photoCommentDelete(Map<String, Object> map) throws Exception {
		photoDAO.photoCommentDelete(map);
		
	}
	
	@Override
	public void photoCommentModify(Map<String, Object> map) throws Exception {
		photoDAO.photoCommentModify(map);
	}

	@Override
	public List<Map<String, Object>> selectPhotoCommentList(Map<String, Object> map) throws Exception {
		return photoDAO.selectPhotoCommentList(map);
	}
	
}
