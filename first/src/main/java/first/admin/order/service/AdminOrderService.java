package first.admin.order.service;

import java.util.List;
import java.util.Map;

public interface AdminOrderService {
	/*
	 * List<Map<String, Object>> adminOrderList(Map<String, Object> commandMap)
	 * throws Exception;
	 */
	void adminOrderModify(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> selectOrderList(Map<String, Object> map) throws Exception;

}
