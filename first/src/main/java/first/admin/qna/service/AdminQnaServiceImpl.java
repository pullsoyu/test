package first.admin.qna.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import first.admin.qna.dao.AdminQnaDAO;

@Service("adminQnaService")
public class AdminQnaServiceImpl implements AdminQnaService {

	@Resource(name="adminQnaDAO")
	private AdminQnaDAO adminQnaDAO;
	/*
	@Override
	public List<Map<String, Object>> adminQnaList(Map<String, Object> map) throws Exception {
		return adminQnaDAO.adminQnaList(map);
	}
	*/
	@Override
	public Map<String, Object> adminQnaDetail(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = adminQnaDAO.adminQnaDetail(map);
		return resultMap;
	}

	@Override
	public void adminQnaModify(Map<String, Object> map) throws Exception {
		adminQnaDAO.adminQnaModify(map);
		
	}

	@Override
	public void adminQnaDelete(Map<String, Object> map) throws Exception {
		adminQnaDAO.adminQnaDelete(map);
		
	}

	@Override
	public List<Map<String, Object>> selectQnaList(Map<String, Object> map) throws Exception {
		return adminQnaDAO.selectQnaList(map);
	}
	
}
