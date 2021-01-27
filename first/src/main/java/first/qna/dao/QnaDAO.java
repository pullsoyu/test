package first.qna.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import first.common.dao.AbstractDAO;

@Repository("qnaDAO")
public class QnaDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")	
	public List<Map<String, Object>> qnaList(Map<String, Object> map) throws Exception {
		
		return (List<Map<String,Object>>)selectList("board.qnaList",map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> qnaDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("admin.qnaDetail", map);
	}

	public void qnaModify(Map<String, Object> map) throws Exception {
		update("board.qnaModify", map);
		
	}

	public void qnaDelete(Map<String, Object> map) throws Exception {
		delete("admin.qnaDelete", map);
		
	}

	public void qnaWrite(Map<String, Object> map) {
		insert("board.qnaWrite",map);
		
	}

	
	
}
