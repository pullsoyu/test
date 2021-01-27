package first.admin.photo.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import first.admin.photo.service.AdminPhotoService;
import first.common.common.CommandMap;

@Controller
public class AdminPhotoController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="adminPhotoService")
	private AdminPhotoService adminPhotoService;
	
	@RequestMapping(value="/admin/photoList.do")
	public ModelAndView adminPhotoList(Map<String,Object> commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView(".tiles/admin/photoList");
    	
    	return mv;
	}
	
	@RequestMapping(value="/admin/selectPhotoList.do")
    public ModelAndView selectPhotoList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	List<Map<String,Object>> list = adminPhotoService.selectPhotoList(commandMap.getMap());
    	mv.addObject("list", list);
    	if(list.size() > 0){
    		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
    	}
    	else{
    		mv.addObject("TOTAL", 0);
    	}
    	
    	return mv;
    }
	
	
	
}
