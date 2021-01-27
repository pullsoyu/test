package first.faq.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import first.faq.dao.FaqDAO;

@Service("faqService")
public class FaqServiceImpl implements FaqService{

	@Resource(name="faqDAO")
	private FaqDAO faqDAO;
	
	@Override
	public List<Map<String, Object>> faqList(Map<String, Object> map) throws Exception {
		
		return faqDAO.faqList(map);
	}

	@Override
	public void faqWrite(Map<String, Object> map) throws Exception{
		faqDAO.faqWrite(map);
		
	}

	@Override
	public Map<String, Object> faqDetail(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = faqDAO.faqDetail(map);
		return resultMap;
	}

	@Override
	public void faqModify(Map<String, Object> map) throws Exception {
		faqDAO.faqModify(map);
		
	}

	@Override
	public void faqDelete(Map<String, Object> map) throws Exception {
		faqDAO.faqDelete(map);
		
	}

}
