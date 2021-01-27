package first.goods.service;

import java.util.List;
import java.util.Map;

public interface GoodsService {

	List<Map<String, Object>> selectFruitListPA(Map<String, Object> map)throws Exception;
	List<Map<String, Object>> selectFruitListPD(Map<String, Object> map)throws Exception;
	List<Map<String, Object>> selectFruitListRD(Map<String, Object> map)throws Exception;
	List<Map<String, Object>> selectFruitListID(Map<String, Object> map)throws Exception;
	
	List<Map<String, Object>> selectGrainListPA(Map<String, Object> map)throws Exception;
	List<Map<String, Object>> selectGrainListPD(Map<String, Object> map)throws Exception;
	List<Map<String, Object>> selectGrainListRD(Map<String, Object> map)throws Exception;
	List<Map<String, Object>> selectGrainListID(Map<String, Object> map)throws Exception;
	
	List<Map<String, Object>> selectMeatListPA(Map<String, Object> map)throws Exception;
	List<Map<String, Object>> selectMeatListPD(Map<String, Object> map)throws Exception;
	List<Map<String, Object>> selectMeatListRD(Map<String, Object> map)throws Exception;
	List<Map<String, Object>> selectMeatListID(Map<String, Object> map)throws Exception;
	
	List<Map<String, Object>> selectVegetableListPA(Map<String, Object> map)throws Exception;
	List<Map<String, Object>> selectVegetableListPD(Map<String, Object> map)throws Exception;
	List<Map<String, Object>> selectVegetableListRD(Map<String, Object> map)throws Exception;
	List<Map<String, Object>> selectVegetableListID(Map<String, Object> map)throws Exception;
	
	
}
