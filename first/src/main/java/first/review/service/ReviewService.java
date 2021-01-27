package first.review.service;

import java.util.List;
import java.util.Map;

public interface ReviewService {

	List<Map<String, Object>> selectReviewList(Map<String, Object> map) throws Exception;

	void reviewDelete(Map<String, Object> map) throws Exception;

}
