package first.faq.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import first.common.dao.AbstractDAO;

@Repository("faqDAO")
public class FaqDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")	
	public List<Map<String, Object>> faqList(Map<String, Object> map) throws Exception{
		
		return (List<Map<String,Object>>)selectList("admin.faqList",map);
	}

	public void faqWrite(Map<String, Object> map) throws Exception{
		insert("admin.faqWrite", map);
		
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> faqDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("admin.faqDetail", map);
	}

	public void faqModify(Map<String, Object> map) throws Exception {
		update("admin.faqModify", map);
		
	}

	public void faqDelete(Map<String, Object> map) throws Exception {
		delete("admin.faqDelete", map);
		
	}

	

}
