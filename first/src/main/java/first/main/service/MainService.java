package first.main.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import first.common.common.CommandMap;

public interface MainService {

	List<Map<String, Object>> selectBoardList(Map<String, Object> commandmap) throws Exception;

	Map<String, Object> goodsDetail(Map<String, Object> map)throws Exception;

	List<Map<String, Object>> selectFruitList(Map<String, Object> map)throws Exception;
	
	List<Map<String, Object>> selectGrainList(Map<String, Object> map)throws Exception;

	List<Map<String, Object>> selectMeatList(Map<String, Object> map)throws Exception;
	
	List<Map<String, Object>> selectVegetableList(Map<String, Object> map)throws Exception;
	
	List<Map<String, Object>> selectSearchList(Map<String, Object> map) throws Exception;
/* 아이작스로 바뀌면서 기존상품평 구동코드는 필요없음
	List<Map<String, Object>> reviewList(Map<String, Object> map) throws Exception;
*/

}
