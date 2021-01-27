package first.admin.goods.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import first.common.dao.AbstractDAO;

@Repository("adminGoodsDAO")
public class AdminGoodsDAO extends AbstractDAO{
	
	/*
	 * @SuppressWarnings("unchecked") public List<Map<String, Object>>
	 * adminGoodsList(Map<String, Object> map) throws Exception{ return
	 * (List<Map<String,Object>>)selectList("admin.goodsList",map); }
	 */

	@SuppressWarnings("unchecked")
	public Map<String, Object> adminGoodsDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("admin.goodsDetail", map);
	}

	public void goodsWrite(Map<String, Object> map) throws Exception{
		insert("admin.goodsWrite", map);
	}

	public void adminGoodsModify(Map<String, Object> map) throws Exception {
		update("admin.goodsModify", map);
		
	}

	public void adminGoodsDelete(Map<String, Object> map) throws Exception {
		delete("admin.goodsDelete", map);
		
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectGoodsList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectPagingList("admin.selectGoodsList", map);
	}

}
