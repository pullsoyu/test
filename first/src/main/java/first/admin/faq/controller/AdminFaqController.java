package first.admin.faq.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import first.admin.faq.service.AdminFaqService;
import first.common.common.CommandMap;

@Controller
public class AdminFaqController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="adminFaqService")
	private AdminFaqService adminFaqService;
	

	@RequestMapping(value="/admin/faqList.do")
	public ModelAndView adminFaqList(HttpServletRequest httpServletRequest, Map<String,Object> commandMap) throws Exception{
		ModelAndView mv = new ModelAndView(".tiles/admin/faqList");
		
		
		String category = httpServletRequest.getParameter("faq_category");
		commandMap.put("FAQ_CATEGORY", category);
		
		List<Map<String,Object>> list = adminFaqService.adminFaqList(commandMap);
		//카테고리전송
		
		mv.addObject("faqlist", list);
		
	return mv;
	}
	
	@RequestMapping(value="/admin/faqWriteForm.do")
	public ModelAndView faqWriteForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView(".tiles/admin/faqWriteForm");
		
		return mv;
	}
	
	@RequestMapping(value="/admin/faqWrite.do")
	public ModelAndView faqWrite(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/faqList.do?faq_category=1");
		
		adminFaqService.faqWrite(commandMap.getMap());
		
		return mv;
	}
	
	
	
	@RequestMapping(value="/admin/faqModifyForm.do")
    public ModelAndView faqModifyForm(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView(".tiles/admin/faqModify");
    	
    	Map<String,Object> map = adminFaqService.adminFaqDetail(commandMap.getMap());
		mv.addObject("map", map);
    	
    	return mv;
    }	
		
	@RequestMapping(value="/admin/faqModify.do")
	public ModelAndView faqModify(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/faqList.do?faq_category=1");
		
		adminFaqService.adminFaqModify(commandMap.getMap());
		
		mv.addObject("FAQ_IDX", commandMap.get("FAQ_IDX"));
		return mv;
	}	
		
	
	@RequestMapping(value="/admin/faqDelete.do")
	public ModelAndView faqDelete(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/faqList.do?faq_category=1");

		adminFaqService.adminFaqDelete(commandMap.getMap());
		mv.addObject("FAQ_IDX", commandMap.get("FAQ_IDX"));
		return mv;
	}
	
	
	
	
	
	
	
	
	
		
	
}
