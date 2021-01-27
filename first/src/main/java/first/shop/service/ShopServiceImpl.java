package first.shop.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import first.shop.dao.ShopDAO;

@Service("shopService")
public class ShopServiceImpl implements ShopService{

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="shopDAO")
	private ShopDAO shopDAO; 
	
	@Override
	public void addLike(Map<String, Object> map) throws Exception {
		
		shopDAO.addLike(map);
		
	}

	@Override
	public void reviewWrite(Map<String, Object> map) throws Exception {
		shopDAO.reviewWrite(map);
		
	}

	@Override
	public List<Map<String, Object>> goodsReviewList(Map<String, Object> map) throws Exception {
		return shopDAO.reviewList(map);
	}

	@Override
	public void reviewDelete(Map<String, Object> map) throws Exception {
		shopDAO.reviewDelete(map);
		
	}

	@Override
	public void reviewModify(Map<String, Object> map) throws Exception {
		shopDAO.reviewModify(map);
		
	}

	@Override
	public void addCart(Map<String, Object> map) throws Exception {
		shopDAO.addCart(map);
		
	}

	@Override
	public void addOrderList(Map<String, Object> map) throws Exception {
		shopDAO.addOrderList(map);
		
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public void addCartOrderList(List list,Map<String, Object> map) {
		// TODO Auto-generated method stub
		
		for(int i=0; i<list.size(); i++) {
			
			map.remove("CART_IDX");
			
			((Map)list.get(i)).putAll(map);
			shopDAO.addCartOrderList(list.get(i));
			System.out.println(list.get(i)+"@@");
		}
		
	}

	@Override
	public List<Map<String, Object>> selectOrderList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return shopDAO.selectOrderList(map);
	}
	
	@Override
	public void orderError(Map<String, Object> map) {
		// TODO Auto-generated method stub
		shopDAO.orderError(map);
	}
	

}
