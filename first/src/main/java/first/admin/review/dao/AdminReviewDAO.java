package first.admin.review.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import first.common.dao.AbstractDAO;

@Repository("adminReviewDAO")
public class AdminReviewDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectReviewList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("admin.selectReviewList", map);
	}

	public void adminReviewDelete(Map<String, Object> map) throws Exception{
		delete("admin.reviewDelete", map);
		
	}

}
