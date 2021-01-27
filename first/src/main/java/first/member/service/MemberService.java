package first.member.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

public interface MemberService {

	void join(Map<String, Object> map) throws Exception;

	public Map<String, Object> loginCheck(Map<String, Object> map) throws Exception;

	void check_id(String id, HttpServletResponse response) throws Exception;

	void check_email(String email, HttpServletResponse response) throws Exception;
	
	String create_key() throws Exception;
	
	void send_mail(Map<String, Object> map) throws Exception;
	
	void send_mail2(Map<String, Object> map) throws Exception;
	
	void approval_member(Map<String, Object> map, HttpServletResponse response) throws Exception;

	

	Map<String,Object> findId(Map<String, Object> map) throws Exception;

	Map<String, Object> findPw(Map<String, Object> map) throws Exception;
	
}
