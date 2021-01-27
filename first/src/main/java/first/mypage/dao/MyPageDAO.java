package first.mypage.dao;

import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Repository;
import first.common.dao.AbstractDAO;

@Repository("myPageDAO")
public class MyPageDAO extends AbstractDAO{
	
	public int selectPwCheck(Map<String, Object> map) throws Exception{
		return (Integer) selectOne ("mypage.selectPwCheck", map); 
	}
	
	
	@SuppressWarnings("unchecked")//타입 안정성
	  public Map<String, Object> selectAccountInfo(Map<String, Object> map) throws
	  Exception{ return (Map<String, Object>) selectOne ("mypage.selectAccountInfo", map); 
	  }
	 
	  
	  public void updateAccountModify(Map<String, Object> map) throws Exception{
	  update("mypage.updateAccountModify", map); 
	  }
	  
	  public void deleteAccount(Map<String, Object> map) throws Exception{
	  update("mypage.deleteAccount", map); }

	
	
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectLikeList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>)selectPagingList("mypage.likeList", map);
	}

	public void likeDelete(Map<String, Object> map) {
		// TODO Auto-generated method stub
		delete("mypage.likeDelete", map);
	}




	public List<Map<String, Object>> selectBasketList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>)selectPagingList("mypage.basketList", map);
	}


	public void basketDelete(int cartNum)throws Exception {
		// TODO Auto-generated method stub
		delete("mypage.basketDelete", cartNum);
		
	}


	public List<Map<String, Object>> selectMyOrdertList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>)selectPagingList("mypage.myOrderList", map);
	}


	public List<Map<String, Object>> selectMyOrdertDetail(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>)selectList("mypage.myOrderDetail", map);
	}


	public void basketClear(Map<String, Object> map) {
		// TODO Auto-generated method stub
		delete("mypage.basketClear", map);
	}


	public void likeClear(Map<String, Object> map) {
		// TODO Auto-generated method stub
		delete("mypage.likeClear", map);
	}
	
	public void cancelOrder(Map<String, Object> map) {
		update("mypage.cancelOrder",map);	
	}


	public void basketModify(Map<String, Object> map) {
		// TODO Auto-generated method stub
		update("mypage.basketModify",map);
	}


	public void addBasket(int likeNum) {
		// TODO Auto-generated method stub
		insert("mypage.addBasket",likeNum);
	}









	
	  
	/*
	 * public Map<String, Object> selectMyReportList(Map<String, Object> map) throws
	 * Exception{ return (Map<String, Object>) selectList
	 * ("mypage.selectMyReportList", map); }
	 * 
	 * public Map<String, Object> selectMyReportDetail(Map<String, Object> map)
	 * throws Exception{ return (Map<String, Object>) selectOne
	 * ("mypage.selectMyReportDetail", map); }
	 * 
	 * public Map<String, Object> selectMyQnaList(Map<String, Object> map) throws
	 * Exception{ return (Map<String, Object>) selectList ("mypage.selectMyQnaList",
	 * map); }
	 * 
	 * public Map<String, Object> selectMyQnaDetail(Map<String, Object> map) throws
	 * Exception{ return (Map<String, Object>) selectOne
	 * ("mypage.selectMyQnaDetail", map); }
	 */
	 
	 

}
