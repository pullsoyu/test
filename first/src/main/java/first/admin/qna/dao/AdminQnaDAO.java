package first.admin.qna.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import first.common.dao.AbstractDAO;

@Repository("adminQnaDAO")
public class AdminQnaDAO extends AbstractDAO{
	
	/*
	@SuppressWarnings("unchecked")	
	public List<Map<String, Object>> adminQnaList(Map<String, Object> map) throws Exception {
		
		return (List<Map<String,Object>>)selectList("admin.qnaList",map);
	}
	*/
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> adminQnaDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("admin.qnaDetail", map);
	}

	public void adminQnaModify(Map<String, Object> map) throws Exception {
		update("admin.qnaModify", map);
		
	}

	public void adminQnaDelete(Map<String, Object> map) throws Exception {
		delete("admin.qnaDelete", map);
		
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectQnaList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectPagingList("admin.selectQnaList", map);
	}

	
	
}
