package first.faq.service;

import java.util.List;
import java.util.Map;

public interface FaqService {

	List<Map<String, Object>> faqList(Map<String, Object> commandMap) throws Exception;

	void faqWrite(Map<String, Object> map) throws Exception;

	Map<String, Object> faqDetail(Map<String, Object> map) throws Exception;

	void faqModify(Map<String, Object> map) throws Exception;

	void faqDelete(Map<String, Object> map) throws Exception;

}
