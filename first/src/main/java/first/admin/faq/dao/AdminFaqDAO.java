package first.admin.faq.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import first.common.dao.AbstractDAO;

@Repository("adminFaqDAO")
public class AdminFaqDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")	
	public List<Map<String, Object>> adminFaqList(Map<String, Object> map) throws Exception{
		
		return (List<Map<String,Object>>)selectList("admin.faqList",map);
	}

	public void faqWrite(Map<String, Object> map) throws Exception{
		insert("admin.faqWrite", map);
		
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> adminFaqDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("admin.faqDetail", map);
	}

	public void adminFaqModify(Map<String, Object> map) throws Exception {
		update("admin.faqModify", map);
		
	}

	public void adminFaqDelete(Map<String, Object> map) throws Exception {
		delete("admin.faqDelete", map);
		
	}

	

}
