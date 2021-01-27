package first.faq.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import first.common.common.CommandMap;
import first.faq.service.FaqService;

@Controller
public class FaqController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="faqService")
	private FaqService faqService;
	
	

	@RequestMapping(value="/board/faqList.do")
	public ModelAndView faqList(HttpServletRequest httpServletRequest, Map<String,Object> commandMap) throws Exception{
		ModelAndView mv = new ModelAndView(".mainTiles/board/faqList");
		
		
		String category = httpServletRequest.getParameter("faq_category");
		commandMap.put("FAQ_CATEGORY", category);
		
		List<Map<String,Object>> list = faqService.faqList(commandMap);
		//카테고리전송
		
		mv.addObject("faqlist", list);
		
	return mv;
	}
	
	@RequestMapping(value="/board/faqWriteForm.do")
	public ModelAndView faqWriteForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView(".tiles/board/faqWriteForm");
		
		return mv;
	}
	
	@RequestMapping(value="/board/faqWrite.do")
	public ModelAndView faqWrite(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/board/faqList.do?faq_category=1");
		
		faqService.faqWrite(commandMap.getMap());
		
		return mv;
	}
	
	
	
	@RequestMapping(value="/board/faqModifyForm.do")
    public ModelAndView faqModifyForm(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView(".tiles/board/faqModify");
    	
    	Map<String,Object> map = faqService.faqDetail(commandMap.getMap());
		mv.addObject("map", map);
    	
    	return mv;
    }	
		
	@RequestMapping(value="/board/faqModify.do")
	public ModelAndView faqModify(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/board/faqList.do?faq_category=1");
		
		faqService.faqModify(commandMap.getMap());
		
		mv.addObject("FAQ_IDX", commandMap.get("FAQ_IDX"));
		return mv;
	}	
		
	
	@RequestMapping(value="/board/faqDelete.do")
	public ModelAndView faqDelete(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/board/faqList.do?faq_category=1");

		faqService.faqDelete(commandMap.getMap());
		mv.addObject("FAQ_IDX", commandMap.get("FAQ_IDX"));
		return mv;
	}
	
	
	
	
	
	
	
	
	
		
	
}
