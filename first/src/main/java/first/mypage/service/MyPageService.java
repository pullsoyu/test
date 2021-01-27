package first.mypage.service;

import java.util.List;
import java.util.Map;

public interface MyPageService {

	int selectPwCheck(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectAccountInfo(Map<String, Object> map) throws Exception; 
		
	void updateAccountModify(Map<String, Object> map) throws Exception;
		  					
	void deleteAccount(Map<String, Object> map) throws Exception;
	/*
	 * Map<String,Object> selectMyReportList(Map<String, Object> map) throws
	 * Exception;
	 * 
	 * Map<String, Object> selectMyReportDetail(Map<String, Object> map) throws
	 * Exception;
	 * 
	 * Map<String, Object> selectMyQnaList(Map<String, Object> map)throws Exception;
	 * Map<String, Object> selectMyQnaDetail(Map<String, Object>map) throws
	 * Exception;
	 */

	List<Map<String, Object>> selectLikeList(Map<String, Object> map) throws Exception;

	void likeDelete(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> selectBasketList(Map<String, Object> map);

	void basketDelete(int cartNum) throws Exception;

	List<Map<String, Object>> selectMyOrdertList(Map<String, Object> map);

	List<Map<String, Object>> selectMyOrderDetail(Map<String, Object> map);

	void basketClear(Map<String, Object> map);

	void likeClear(Map<String, Object> map);
	
	void cancelOrder(Map<String, Object> map) throws Exception;

	void basketModify(Map<String, Object> map);

	void addBasket(int likeNum);

	

	



			 
		 
	 
	
	
}
