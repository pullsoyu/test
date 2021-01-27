package first.main.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import first.common.common.CommandMap;
import first.common.util.FileUtils;
import first.main.dao.MainDAO;
import first.shop.dao.ShopDAO;

@Service("mainService")
public class MainServiceImpl implements MainService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="mainDAO")
	private MainDAO mainDAO;
	
	@Resource(name="shopDAO")
	private ShopDAO shopDAO;
	
	@Override
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception {
		return mainDAO.selectBoardList(map);
		
	}

	@Override
	public Map<String, Object> goodsDetail(Map<String, Object> map) throws Exception {
		Map<String,Object> resultMap=mainDAO.goodsDetail(map);
		return resultMap;
	}

	@Override
	public List<Map<String, Object>> selectFruitList(Map<String, Object> map) throws Exception {
		return mainDAO.selectFruitList(map);
	}
	
	@Override
	public List<Map<String, Object>> selectGrainList(Map<String, Object> map) throws Exception {
		return mainDAO.selectGrainList(map);
	}
	
	@Override
	public List<Map<String, Object>> selectMeatList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return mainDAO.selectMeatList(map);
	}
	
	@Override
	public List<Map<String, Object>> selectVegetableList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return mainDAO.selectVegetableList(map);
	}

	@Override
	public List<Map<String, Object>> selectSearchList(Map<String, Object> map) throws Exception {
		return mainDAO.selectSearchList(map);
	}
	
	/*상품평 아이작스로 바꾸면서 파라미터타입도 바뀌고 필요도 없음
	@Override
	public List<Map<String, Object>> reviewList(Map<String, Object> map) throws Exception {
		
		return shopDAO.reviewList(map);
	}
	 */
	/*
	 * @Override public void insertBoard(Map<String, Object> map, HttpServletRequest
	 * request) throws Exception { sampleDAO.insertBoard(map);
	 * 
	 * List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(map, request);
	 * for(int i=0, size=list.size(); i<size; i++){
	 * sampleDAO.insertFile(list.get(i)); } }
	 * 
	 * @Override public Map<String, Object> selectBoardDetail(Map<String, Object>
	 * map) throws Exception { sampleDAO.updateHitCnt(map); Map<String, Object>
	 * resultMap = new HashMap<String,Object>(); Map<String, Object> tempMap =
	 * sampleDAO.selectBoardDetail(map); resultMap.put("map", tempMap);
	 * 
	 * List<Map<String,Object>> list = sampleDAO.selectFileList(map);
	 * resultMap.put("list", list);
	 * 
	 * return resultMap; }
	 * 
	 * @Override public void updateBoard(Map<String, Object> map, HttpServletRequest
	 * request) throws Exception{ sampleDAO.updateBoard(map);
	 * 
	 * sampleDAO.deleteFileList(map); List<Map<String,Object>> list =
	 * fileUtils.parseUpdateFileInfo(map, request); Map<String,Object> tempMap =
	 * null; for(int i=0, size=list.size(); i<size; i++){ tempMap = list.get(i);
	 * if(tempMap.get("IS_NEW").equals("Y")){ sampleDAO.insertFile(tempMap); } else{
	 * sampleDAO.updateFile(tempMap); } } }
	 * 
	 * @Override public void deleteBoard(Map<String, Object> map) throws Exception {
	 * sampleDAO.deleteBoard(map); }
	 */

}
