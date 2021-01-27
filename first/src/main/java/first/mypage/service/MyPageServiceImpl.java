package first.mypage.service;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import first.member.dao.MemberDAO;
import first.mypage.dao.MyPageDAO;

@Service("myPageService") //service 객체선언
public class MyPageServiceImpl implements MyPageService{
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="myPageDAO")
	private MyPageDAO myPageDAO;
	
	@Resource(name="memberDAO")
	private MemberDAO memberDAO;
	
	@Override
	public int selectPwCheck(Map<String, Object> map) throws Exception{
		return myPageDAO.selectPwCheck(map);
	}

	@Override
	  public Map<String, Object> selectAccountInfo(Map<String, Object>map) throws Exception{ 
		return myPageDAO.selectAccountInfo(map); 
		}
	 	  
	@Override public void updateAccountModify(Map<String, Object> map) throws Exception{ 
		myPageDAO.updateAccountModify(map); 
		}
	  		  
	@Override public void deleteAccount(Map<String, Object> map) throws Exception{ 
		myPageDAO.deleteAccount(map); 
		}

	@Override
	public List<Map<String, Object>> selectLikeList(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return myPageDAO.selectLikeList(map);
	}

	@Override
	public List<Map<String, Object>> selectBasketList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return myPageDAO.selectBasketList(map);
	}

	@Override
	public void basketDelete(int cartNum) throws Exception {
		// TODO Auto-generated method stub
		myPageDAO.basketDelete(cartNum);
		
	}

	@Override
	public List<Map<String, Object>> selectMyOrdertList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return myPageDAO.selectMyOrdertList(map);
	}

	@Override
	public List<Map<String, Object>> selectMyOrderDetail(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return myPageDAO.selectMyOrdertDetail(map);
	}

	@Override
	public void basketClear(Map<String, Object> map) {
		// TODO Auto-generated method stub
		myPageDAO.basketClear(map);
	}

	@Override
	public void likeClear(Map<String, Object> map) {
		// TODO Auto-generated method stub
		myPageDAO.likeClear(map);
	}

	@Override
	public void likeDelete(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		myPageDAO.likeDelete(map);
	}
	
	@Override
	public void cancelOrder(Map<String, Object> map) throws Exception {
		myPageDAO.cancelOrder(map);
	}



	@Override
	public void basketModify(Map<String, Object> map) {
		// TODO Auto-generated method stub
		myPageDAO.basketModify(map);
	}

	@Override
	public void addBasket(int likeNum) {
		// TODO Auto-generated method stub
		myPageDAO.addBasket(likeNum);
	}



	









	





	









		
	  
			/*
			 * @Override public Map<String, Object> selectMyReportList(Map<String, Object>
			 * map) throws Exception{ return myPageDAO.selectMyReportList(map); }
			 * 
			 * @Override public Map<String, Object> selectMyReportDetail(Map<String, Object>
			 * map) throws Exception{ return myPageDAO.selectMyReportDetail(map); }
			 * 
			 * @Override public Map<String, Object> selectMyQnaList(Map<String, Object> map)
			 * throws Exception{ return myPageDAO.selectMyQnaList(map); }
			 * 
			 * @Override public Map<String, Object> selectMyQnaDetail(Map<String, Object>
			 * map) throws Exception{ return myPageDAO.selectMyQnaDetail(map); }
			 */

}
