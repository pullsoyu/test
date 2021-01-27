package first.goods.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import first.common.dao.AbstractDAO;

@Repository("goodsDAO")
public class GoodsDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFruitListPA(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>)selectPagingList("goods.selectFruitListPA", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFruitListPD(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>)selectPagingList("goods.selectFruitListPD", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFruitListRD(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>)selectPagingList("goods.selectFruitListRD", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFruitListID(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>)selectPagingList("goods.selectFruitListID", map);
	}
	
	//====//
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectGrainListPA(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>)selectPagingList("goods.selectGrainListPA", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectGrainListPD(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>)selectPagingList("goods.selectGrainListPD", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectGrainListRD(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>)selectPagingList("goods.selectGrainListRD", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectGrainListID(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>)selectPagingList("goods.selectGrainListID", map);
	}
	//---------------//
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMeatListPA(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>)selectPagingList("goods.selectMeatListPA", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMeatListPD(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>)selectPagingList("goods.selectMeatListPD", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMeatListRD(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>)selectPagingList("goods.selectMeatListRD", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMeatListID(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>)selectPagingList("goods.selectMeatListID", map);
	}
	//==================//
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectVegetableListPA(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>)selectPagingList("goods.selectVegetableListPA", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectVegetableListPD(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>)selectPagingList("goods.selectVegetableListPD", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectVegetableListRD(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>)selectPagingList("goods.selectVegetableListRD", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectVegetableListID(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>)selectPagingList("goods.selectVegetableListID", map);
	}
	
}
