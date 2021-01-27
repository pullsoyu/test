package first.admin.review.service;

import java.util.List;
import java.util.Map;

public interface AdminReviewService {

	List<Map<String, Object>> selectReviewList(Map<String, Object> map) throws Exception;

	void adminReviewDelete(Map<String, Object> map) throws Exception;

}
