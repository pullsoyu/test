package first.admin.qna.service;

import java.util.List;
import java.util.Map;

public interface AdminQnaService {
	/*
	List<Map<String, Object>> adminQnaList(Map<String, Object> commandMap) throws Exception;
	 */
	Map<String, Object> adminQnaDetail(Map<String, Object> map) throws Exception;

	void adminQnaModify(Map<String, Object> map) throws Exception;

	void adminQnaDelete(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> selectQnaList(Map<String, Object> map) throws Exception;

}
