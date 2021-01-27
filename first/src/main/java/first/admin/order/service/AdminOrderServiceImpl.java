package first.admin.order.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import first.admin.order.dao.AdminOrderDAO;

@Service("adminOrderService")
public class AdminOrderServiceImpl implements AdminOrderService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="adminOrderDAO")
	private AdminOrderDAO adminOrderDAO;

	/*
	 * @Override public List<Map<String, Object>> adminOrderList(Map<String, Object>
	 * map) throws Exception {
	 * 
	 * return adminOrderDAO.adminOrderList(map); }
	 */

	@Override
	public void adminOrderModify(Map<String, Object> map) throws Exception {
		adminOrderDAO.adminOrderModify(map);
		
	}

	@Override
	public List<Map<String, Object>> selectOrderList(Map<String, Object> map) throws Exception {
		return adminOrderDAO.selectOrderList(map);
	}
	
	
	
}
