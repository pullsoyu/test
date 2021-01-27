package first.admin.goods.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface AdminGoodsService {

	/*
	 * List<Map<String, Object>> adminGoodsList(Map<String, Object> commandMap)
	 * throws Exception;
	 */
	Map<String, Object> adminGoodsDetail(Map<String, Object> map) throws Exception;

	void goodsWrite(Map<String, Object> map) throws Exception;

	void adminGoodsModify(Map<String, Object> map) throws Exception;

	void adminGoodsDelete(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> selectGoodsList(Map<String, Object> map) throws Exception;

	

}
