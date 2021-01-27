package first.admin.review.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import first.admin.review.service.AdminReviewService;
import first.common.common.CommandMap;

@Controller
public class AdminReviewController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="adminReviewService")
	private AdminReviewService adminReviewService;
	
	@RequestMapping(value="/admin/reviewList.do")
    public ModelAndView openBoardList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView(".tiles/admin/reviewList");
    	
    	return mv;
    }

	@RequestMapping(value="/admin/selectReviewList.do")
    public ModelAndView selectReviewList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	List<Map<String,Object>> list = adminReviewService.selectReviewList(commandMap.getMap());
    	mv.addObject("list", list);
    	if(list.size() > 0){
    		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
    	}
    	else{
    		mv.addObject("TOTAL", 0);
    	}
    	
    	return mv;
    }
	
	
	@RequestMapping(value="/admin/reviewDelete.do")
	public ModelAndView reviewDelete(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/reviewList.do");

		adminReviewService.adminReviewDelete(commandMap.getMap());
		mv.addObject("REVIEW_IDX", commandMap.get("REVIEW_IDX"));
		
		return mv;
	}
	
	
	
}
