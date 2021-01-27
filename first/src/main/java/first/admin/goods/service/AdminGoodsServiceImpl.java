package first.admin.goods.service;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import first.admin.goods.dao.AdminGoodsDAO;
import first.admin.goods.service.AdminGoodsService;

@Service("adminGoodsService")
public class AdminGoodsServiceImpl implements AdminGoodsService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="adminGoodsDAO")
	private AdminGoodsDAO adminGoodsDAO;
	
	/*
	 * @Override public List<Map<String, Object>> adminGoodsList(Map<String, Object>
	 * map) throws Exception { return adminGoodsDAO.adminGoodsList(map); }
	 */

	@Override
	public Map<String, Object> adminGoodsDetail(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = adminGoodsDAO.adminGoodsDetail(map);
		return resultMap;
	}

//	@Override
//	public void goodsWrite(Map<String, Object> map, HttpServletRequest request) throws Exception {
//		adminGoodsDAO.goodWrite(map);
//		
//		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
//		
//		MultipartFile multipartFile = null;
//		
//		multipartFile = multipartHttpServletRequest.getFile("file");
//			if(multipartFile.isEmpty() == false){
//				log.debug("------------- file start -------------");
//				log.debug("name : "+multipartFile.getName());
//				log.debug("filename : "+multipartFile.getOriginalFilename());
//				log.debug("size : "+multipartFile.getSize());
//				log.debug("-------------- file end --------------\n");
//			}
//		}

	@Override
	public void goodsWrite(Map<String, Object> map) throws Exception {
		adminGoodsDAO.goodsWrite(map);
		
	}

	@Override
	public void adminGoodsModify(Map<String, Object> map) throws Exception {
		adminGoodsDAO.adminGoodsModify(map);
		
	}

	@Override
	public void adminGoodsDelete(Map<String, Object> map) throws Exception {
		adminGoodsDAO.adminGoodsDelete(map);
		
	}

	@Override
	public List<Map<String, Object>> selectGoodsList(Map<String, Object> map) throws Exception {
		return adminGoodsDAO.selectGoodsList(map);
	}
	
}
