package first.review.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import first.common.common.CommandMap;
import first.review.service.ReviewService;

@Controller
public class ReviewController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="reviewService")
	private ReviewService reviewService;
	
	@RequestMapping(value="/board/reviewList.do")
    public ModelAndView openBoardList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView(".mainTiles/board/reviewList");
    	
    	return mv;
    }

	@RequestMapping(value="/board/selectReviewList.do")
    public ModelAndView selectReviewList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	List<Map<String,Object>> list = reviewService.selectReviewList(commandMap.getMap());
    	mv.addObject("list", list);
    	if(list.size() > 0){
    		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
    	}
    	else{
    		mv.addObject("TOTAL", 0);
    	}
    	
    	return mv;
    }
	
	
	@RequestMapping(value="/board/reviewDelete.do")
	public ModelAndView reviewDelete(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/board/reviewList.do");

		reviewService.reviewDelete(commandMap.getMap());
		mv.addObject("REVIEW_IDX", commandMap.get("REVIEW_IDX"));
		
		return mv;
	}
	
	
	
}
