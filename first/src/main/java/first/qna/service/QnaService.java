package first.qna.service;

import java.util.List;
import java.util.Map;

public interface QnaService {

	List<Map<String, Object>> qnaList(Map<String, Object> commandMap) throws Exception;

	Map<String, Object> qnaDetail(Map<String, Object> map) throws Exception;

	void qnaModify(Map<String, Object> map) throws Exception;

	void qnaDelete(Map<String, Object> map) throws Exception;

	void qnaWrite(Map<String, Object> map) throws Exception;

}
