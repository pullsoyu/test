package first.admin.member.service;

import java.util.List;
import java.util.Map;

public interface AdminMemberService {
	/*
	 * List<Map<String, Object>> adminMemberList(Map<String, Object> map) throws
	 * Exception;
	 */
	Map<String, Object> adminMemberDetail(Map<String, Object> map) throws Exception;

	void adminMemberModify(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> selectMemberList(Map<String, Object> map) throws Exception;
}
