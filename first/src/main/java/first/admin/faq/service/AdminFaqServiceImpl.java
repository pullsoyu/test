package first.admin.faq.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import first.admin.faq.dao.AdminFaqDAO;

@Service("adminFaqService")
public class AdminFaqServiceImpl implements AdminFaqService{

	@Resource(name="adminFaqDAO")
	private AdminFaqDAO adminFaqDAO;
	
	@Override
	public List<Map<String, Object>> adminFaqList(Map<String, Object> map) throws Exception {
		
		return adminFaqDAO.adminFaqList(map);
	}

	@Override
	public void faqWrite(Map<String, Object> map) throws Exception{
		adminFaqDAO.faqWrite(map);
		
	}

	@Override
	public Map<String, Object> adminFaqDetail(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = adminFaqDAO.adminFaqDetail(map);
		return resultMap;
	}

	@Override
	public void adminFaqModify(Map<String, Object> map) throws Exception {
		adminFaqDAO.adminFaqModify(map);
		
	}

	@Override
	public void adminFaqDelete(Map<String, Object> map) throws Exception {
		adminFaqDAO.adminFaqDelete(map);
		
	}

}
