package first.admin.photo.service;

import java.util.List;
import java.util.Map;

public interface AdminPhotoService {

	List<Map<String, Object>> selectPhotoList(Map<String, Object> map) throws Exception;

}
