package first.main.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import first.common.dao.AbstractDAO;

@Repository("mainDAO")
public class MainDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("main.selectBoardList", map);
	}
	

	@SuppressWarnings("unchecked")
	public Map<String, Object> goodsDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("main.goodsDetail", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFruitList(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>)selectPagingList("main.selectFruitList", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectGrainList(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>)selectPagingList("main.selectGrainList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMeatList(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>)selectPagingList("main.selectMeatList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectVegetableList(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>)selectPagingList("main.selectVegetableList", map);
	}
	/*
	 * public void insertBoard(Map<String, Object> map) throws Exception{
	 * insert("sample.insertBoard", map); }
	 * 
	 * public void updateHitCnt(Map<String, Object> map) throws Exception{
	 * update("sample.updateHitCnt", map); }
	 * 
	 * @SuppressWarnings("unchecked") public Map<String, Object>
	 * selectBoardDetail(Map<String, Object> map) throws Exception{ return
	 * (Map<String, Object>) selectOne("sample.selectBoardDetail", map); }
	 * 
	 * public void updateBoard(Map<String, Object> map) throws Exception{
	 * update("sample.updateBoard", map); }
	 * 
	 * public void deleteBoard(Map<String, Object> map) throws Exception{
	 * update("sample.deleteBoard", map); }
	 * 
	 * public void insertFile(Map<String, Object> map) throws Exception{
	 * insert("sample.insertFile", map); }
	 * 
	 * @SuppressWarnings("unchecked") public List<Map<String, Object>>
	 * selectFileList(Map<String, Object> map) throws Exception{ return
	 * (List<Map<String, Object>>)selectList("sample.selectFileList", map); }
	 * 
	 * public void deleteFileList(Map<String, Object> map) throws Exception{
	 * update("sample.deleteFileList", map); }
	 * 
	 * public void updateFile(Map<String, Object> map) throws Exception{
	 * update("sample.updateFile", map); }
	 */

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectSearchList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectPagingList("main.selectSearchList",map);
	}

}
