package first.admin.faq.service;

import java.util.List;
import java.util.Map;

public interface AdminFaqService {

	List<Map<String, Object>> adminFaqList(Map<String, Object> commandMap) throws Exception;

	void faqWrite(Map<String, Object> map) throws Exception;

	Map<String, Object> adminFaqDetail(Map<String, Object> map) throws Exception;

	void adminFaqModify(Map<String, Object> map) throws Exception;

	void adminFaqDelete(Map<String, Object> map) throws Exception;

}
