package first.admin.order.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import first.common.dao.AbstractDAO;

@Repository("adminOrderDAO")
public class AdminOrderDAO extends AbstractDAO{

	/*
	 * @SuppressWarnings("unchecked") public List<Map<String, Object>>
	 * adminOrderList(Map<String, Object> map) throws Exception { return
	 * (List<Map<String,Object>>)selectList("admin.orderList",map); }
	 */

	public void adminOrderModify(Map<String, Object> map) throws Exception{
		update("admin.orderModify",map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectOrderList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectPagingList("admin.selectOrderList", map);
	}

}
