package first.admin.photo.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import first.admin.photo.dao.AdminPhotoDAO;

@Service("adminPhotoService")
public class AdminPhotoServiceImpl implements AdminPhotoService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="adminPhotoDAO")
	private AdminPhotoDAO adminPhotoDAO;

	@Override
	public List<Map<String, Object>> selectPhotoList(Map<String, Object> map) throws Exception {
		return adminPhotoDAO.selectPhotoList(map);
	}
}
