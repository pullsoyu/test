package first.review.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import first.common.dao.AbstractDAO;

@Repository("reviewDAO")
public class ReviewDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectReviewList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("admin.selectReviewList", map);
	}

	public void reviewDelete(Map<String, Object> map) throws Exception{
		delete("board.reviewDelete", map);
		
	}

}
