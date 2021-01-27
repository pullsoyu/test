package first.admin.member.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import first.admin.member.dao.AdminMemberDAO;


@Service("adminMemberService")
public class AdminMemberServiceImpl implements AdminMemberService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="adminMemberDAO")
	private AdminMemberDAO adminMemberDAO;
	
	/*
	 * @Override public List<Map<String, Object>> adminMemberList(Map<String,
	 * Object> map) throws Exception {
	 * 
	 * return adminMemberDAO.adminMemberList(map);
	 * 
	 * }
	 */

	@Override
	public Map<String, Object> adminMemberDetail(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = adminMemberDAO.adminMemberDetail(map);
		return resultMap;
	}

	@Override
	public void adminMemberModify(Map<String, Object> map) throws Exception {
		adminMemberDAO.adminMemberModify(map);
		
	}

	@Override
	public List<Map<String, Object>> selectMemberList(Map<String, Object> map) throws Exception {
		return adminMemberDAO.selectMemberList(map);
	}

	

}
