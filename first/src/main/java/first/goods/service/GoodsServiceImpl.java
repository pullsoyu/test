package first.goods.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import first.goods.dao.GoodsDAO;
import first.common.util.FileUtils;

@Service("goodsService")
public class GoodsServiceImpl implements GoodsService{
	Logger log=Logger.getLogger(this.getClass());
	
	@Resource(name="goodsDAO")
	private GoodsDAO goodsDAO;
	
	@Override
	public List<Map<String, Object>> selectFruitListPA(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return goodsDAO.selectFruitListPA(map);
	}
	@Override
	public List<Map<String, Object>> selectFruitListPD(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return goodsDAO.selectFruitListPD(map);
	}
	@Override
	public List<Map<String, Object>> selectFruitListRD(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return goodsDAO.selectFruitListRD(map);
	}
	@Override
	public List<Map<String, Object>> selectFruitListID(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return goodsDAO.selectFruitListID(map);
	}
	
	//------------//
	@Override
	public List<Map<String, Object>> selectGrainListPA(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return goodsDAO.selectGrainListPA(map);
	}
	@Override
	public List<Map<String, Object>> selectGrainListPD(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return goodsDAO.selectGrainListPD(map);
	}
	@Override
	public List<Map<String, Object>> selectGrainListRD(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return goodsDAO.selectGrainListRD(map);
	}
	@Override
	public List<Map<String, Object>> selectGrainListID(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return goodsDAO.selectGrainListID(map);
	}
	
	//===//
	@Override
	public List<Map<String, Object>> selectMeatListPA(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return goodsDAO.selectMeatListPA(map);
	}
	@Override
	public List<Map<String, Object>> selectMeatListPD(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return goodsDAO.selectMeatListPD(map);
	}
	@Override
	public List<Map<String, Object>> selectMeatListRD(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return goodsDAO.selectMeatListRD(map);
	}
	@Override
	public List<Map<String, Object>> selectMeatListID(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return goodsDAO.selectMeatListID(map);
	}
	//========//
	public List<Map<String, Object>> selectVegetableListPA(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return goodsDAO.selectVegetableListPA(map);
	}
	@Override
	public List<Map<String, Object>> selectVegetableListPD(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return goodsDAO.selectVegetableListPD(map);
	}
	@Override
	public List<Map<String, Object>> selectVegetableListRD(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return goodsDAO.selectVegetableListRD(map);
	}
	@Override
	public List<Map<String, Object>> selectVegetableListID(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return goodsDAO.selectVegetableListID(map);
	}
}
