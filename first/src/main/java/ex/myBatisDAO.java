package ex;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class myBatisDAO {
	private myBatisDAO() {
		
	}
	private static myBatisDAO instance=new myBatisDAO();
	public static myBatisDAO getInstance() {
		return instance;
	}
	public int insert(myBatisDTO dto) {
		String res="myBatisMapper.xml";
		SqlSession session=null;
		int check=0;
		
		try {
			InputStream is=Resources.getResourceAsStream(res);
			SqlSessionFactory factory=new SqlSessionFactoryBuilder().build(is);
			session =factory.openSession();
			
			check=session.insert("member.testInsert", dto);
			
			if(check>0) {
				session.commit();
			}else {
				session.rollback();
			}
		}catch(Exception e) {
			
		}finally {
			session.close();
		}
		return check;
	}
	public List<myBatisDTO>select(){
		String res="myBatisMapper.xml";
		SqlSession session=null;
		List<myBatisDTO>list =null;
		try {
			InputStream is=Resources.getResourceAsStream(res);
			SqlSessionFactory factory=new SqlSessionFactoryBuilder().build(is);
			session=factory.openSession();
			
			list=session.selectList("member.testSelect");
		}catch(Exception e) {
			
		}finally {
			session.close();
		}
		return list;
	}

}
