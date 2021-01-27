package first.qna.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import first.qna.dao.QnaDAO;

@Service("qnaService")
public class QnaServiceImpl implements QnaService {

	@Resource(name="qnaDAO")
	private QnaDAO qnaDAO;

	@Override
	public List<Map<String, Object>> qnaList(Map<String, Object> map) throws Exception {
		return qnaDAO.qnaList(map);
	}

	@Override
	public Map<String, Object> qnaDetail(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = qnaDAO.qnaDetail(map);
		return resultMap;
	}

	@Override
	public void qnaModify(Map<String, Object> map) throws Exception {
		qnaDAO.qnaModify(map);
		
	}

	@Override
	public void qnaDelete(Map<String, Object> map) throws Exception {
		qnaDAO.qnaDelete(map);
		
	}

	@Override
	public void qnaWrite(Map<String, Object> map) throws Exception {
		qnaDAO.qnaWrite(map);
		
	}
	
}
