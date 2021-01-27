package first.review.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import first.review.dao.ReviewDAO;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService{

	@Resource(name="reviewDAO")
	private ReviewDAO reviewDAO;
	
	
	@Override
	public List<Map<String, Object>> selectReviewList(Map<String, Object> map) throws Exception {
		
		return reviewDAO.selectReviewList(map);
	}


	@Override
	public void reviewDelete(Map<String, Object> map) throws Exception {
		reviewDAO.reviewDelete(map);
		
	}

}
