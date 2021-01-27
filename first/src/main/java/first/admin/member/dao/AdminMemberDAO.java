package first.admin.member.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import first.common.dao.AbstractDAO;

@Repository("adminMemberDAO")
public class AdminMemberDAO extends AbstractDAO{

	/*
	 * @SuppressWarnings("unchecked") public List<Map<String, Object>>
	 * adminMemberList(Map<String, Object> map) throws Exception{ return
	 * (List<Map<String,Object>>)selectList("admin.memberList",map); }
	 */

	@SuppressWarnings("unchecked")
	public Map<String, Object> adminMemberDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("admin.memberDetail", map);
	}

	public void adminMemberModify(Map<String, Object> map) {
		update("admin.memberModify", map);
		
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMemberList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectPagingList("admin.selectMemberList", map);
	}
}
