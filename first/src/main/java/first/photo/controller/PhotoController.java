package first.photo.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import first.common.common.CommandMap;
import first.photo.service.PhotoService;

@Controller
public class PhotoController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="photoService")
	private PhotoService photoService;
	
	@RequestMapping(value="/board/photoList.do")
	 public ModelAndView photoList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView(".mainTiles/board/photoList");
    	
    	return mv;
    }
	
	@RequestMapping(value="/board/selectPhotoList.do")
    public ModelAndView selectPhotoList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	List<Map<String,Object>> list = photoService.selectPhotoList(commandMap.getMap());
    	mv.addObject("list", list);
    	if(list.size() > 0){
    		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
    	}
    	else{
    		mv.addObject("TOTAL", 0);
    	}
    	
    	return mv;
    }

	@RequestMapping(value = "/board/openPhotoWrite.do")
	public ModelAndView openPhotoWrite(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView(".mainTiles/board/photoWrite");
		
		return mv;
	}	
	

	@RequestMapping(value = "/board/insertPhoto.do")
	public ModelAndView insertPhoto(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/board/photoList.do");
		
		commandMap.put("IMAGE_NAME", request.getSession().getAttribute("uploadFileName"));
		
		photoService.insertPhoto(commandMap.getMap(), request);
		
		return mv;
	}
	
	@RequestMapping(value = "/board/openPhotoDetail.do")
	public ModelAndView openPhotoDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView(".mainTiles/board/photoDetail");
		
		Map<String, Object> map = photoService.selectPhotoDetail(commandMap.getMap());
		
		mv.addObject("map", map);
		
		
		return mv;
	}
	

	
	@RequestMapping(value = "/board/openPhotoUpdate.do")
	public ModelAndView openPhotoUpdate(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView(".mainTiles/board/photoUpdate");
		
		Map<String, Object> map = photoService.selectPhotoDetail(commandMap.getMap());
		
		mv.addObject("map", map);
		
		
		return mv;
	}
	
	@RequestMapping(value = "/board/photoUpdate.do")
	public ModelAndView PhotoUpdate(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/board/openPhotoDetail.do");
		
		commandMap.put("IMAGE_NAME", request.getSession().getAttribute("uploadFileName"));
		photoService.modifyPhoto(commandMap.getMap());
		mv.addObject("BOARD_IDX", commandMap.get("BOARD_IDX"));
		mv.addObject("PHOTO_IDX", commandMap.get("PHOTO_IDX"));
		
		return mv;
	}
	
	
	@RequestMapping(value = "/board/photoDelete.do")
	public ModelAndView photoDelete(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/board/photoList.do");
		photoService.photoDelete(commandMap.getMap());
		return mv;
	}
	
	
	@RequestMapping(value = "/board/commentWrite.do" , method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public @ResponseBody void commentWrite(CommandMap commandMap) throws Exception {
		
		photoService.commentWrite(commandMap.getMap());
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/board/photoCommentList.do", method = RequestMethod.GET)
	public ModelAndView photoCommentList(@RequestParam("n") int BOARD_IDX, CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		commandMap.getMap().put("BOARD_IDX", BOARD_IDX);
		
		List<Map<String,Object>> list = photoService.photoCommentList(commandMap.getMap());
		mv.addObject("list", list);
		
		return mv; 
	}
	
	@RequestMapping(value="/board/selectPhotoCommentList.do")
    public ModelAndView selectphotoCommentList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	List<Map<String,Object>> list = photoService.selectPhotoCommentList(commandMap.getMap());
    	mv.addObject("list", list);
    	if(list.size() > 0){
    		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
    	}
    	else{
    		mv.addObject("TOTAL", 0);
    	}
    	
    	return mv;
    }
	
	
	@RequestMapping(value="/board/photoCommentDelete.do" , method = RequestMethod.POST, produces = "application/json; charset=utf-8")
    public @ResponseBody void photoCommentDelete(CommandMap commandMap) throws Exception{
    	
    	commandMap.put("COMMENT_IDX", commandMap.get("COMMENT_IDX"));
    	commandMap.put("MEMBER_ID", commandMap.get("MEMBER_ID"));
    	photoService.photoCommentDelete(commandMap.getMap());
    	
    	
    }
	
	
	@RequestMapping(value="/board/photoCommentModify.do" , method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public @ResponseBody void photoCommentModify(CommandMap commandMap) throws Exception{
    	
    	commandMap.put("COMMENT_IDX", commandMap.get("COMMENT_IDX"));
    	commandMap.put("MEMBER_ID", commandMap.get("MEMBER_ID"));
    	photoService.photoCommentModify(commandMap.getMap());
    	
    	
    }
	
}
