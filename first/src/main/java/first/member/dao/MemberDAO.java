package first.member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import first.common.dao.AbstractDAO;

@Repository("memberDAO")
public class MemberDAO extends AbstractDAO {

	@Autowired
	SqlSession sqlsession = null;
	
	public void join(Map<String, Object> map) throws Exception {
		
		insert("member.join",map);
		 
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectId(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("member.selectId", map);
	}

	public int check_id(String id) {
		return sqlsession.selectOne("member.check_id", id);
	}

	public int check_email(String email) {
		return sqlsession.selectOne("member.check_email", email);
	}

	// 이메일 인증
	@Transactional
	public int approval_member(Map<String, Object> map) throws Exception{
		return sqlsession.update("member.approval_member", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> findId(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("member.findId" , map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> findPw(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("member.findPw" , map);
	}
	
	

}
