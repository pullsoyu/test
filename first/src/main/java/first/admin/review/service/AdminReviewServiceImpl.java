package first.admin.review.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import first.admin.review.dao.AdminReviewDAO;


@Service("adminReviewService")
public class AdminReviewServiceImpl implements AdminReviewService{

	@Resource(name="adminReviewDAO")
	private AdminReviewDAO adminReviewDAO;
	
	
	@Override
	public List<Map<String, Object>> selectReviewList(Map<String, Object> map) throws Exception {
		
		return adminReviewDAO.selectReviewList(map);
	}


	@Override
	public void adminReviewDelete(Map<String, Object> map) throws Exception {
		adminReviewDAO.adminReviewDelete(map);
		
	}

}
