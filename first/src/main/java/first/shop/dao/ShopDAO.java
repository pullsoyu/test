package first.shop.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import first.common.common.CommandMap;
import first.common.dao.AbstractDAO;



@Repository("shopDAO")
public class ShopDAO extends AbstractDAO{

	public void addLike(Map<String, Object> map)  throws Exception{

		insert("shop.addLike",map);
		
	}

	public void reviewWrite(Map<String, Object> map)  throws Exception{
		insert("shop.reviewWrite",map);
		
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> reviewList(Map<String, Object> map)  throws Exception{
		
		return (List<Map<String, Object>>)selectList("shop.goodsReviewList", map);
	}

	public void reviewDelete(Map<String, Object> map) throws Exception{
		delete("shop.reviewDelete",map);
		
	}

	public void reviewModify(Map<String, Object> map) {
		update("shop.reviewModify",map);
		
	}

	public void addCart(Map<String, Object> map) {
		insert("shop.addCart",map);
		
	}

	public void addOrderList(Map<String, Object> map) {
		insert("shop.addOrderList",map);
		
	}
	
	public List<Map<String, Object>> selectOrderList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>)selectList("shop.selectOrderList", map);
	}

	public void orderError(Map<String, Object> map) {
		// TODO Auto-generated method stub
		delete("shop.orderError", map);
		
	}
	
	public void addCartOrderList(Object object) {
		// TODO Auto-generated method stub
		insert("shop.addCartOrderList",object);
	}

}
