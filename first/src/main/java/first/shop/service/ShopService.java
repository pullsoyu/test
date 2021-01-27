package first.shop.service;

import java.util.List;
import java.util.Map;

public interface ShopService {

	void addLike(Map<String, Object> map) throws Exception;

	void reviewWrite(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> goodsReviewList(Map<String, Object> map) throws Exception;

	void reviewDelete(Map<String, Object> map) throws Exception;

	void reviewModify(Map<String, Object> map) throws Exception;

	void addCart(Map<String, Object> map) throws Exception;

	void addOrderList(Map<String, Object> map) throws Exception;
	
	void addCartOrderList(List list,Map<String, Object> map);
	
	List<Map<String, Object>> selectOrderList(Map<String, Object> map);
	
	void orderError(Map<String, Object> map);

}
