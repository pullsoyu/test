package first.admin.photo.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import first.common.dao.AbstractDAO;

@Repository("adminPhotoDAO")
public class AdminPhotoDAO extends AbstractDAO {

	public List<Map<String, Object>> selectPhotoList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectPagingList("admin.selectPhotoList", map);
	}

}
