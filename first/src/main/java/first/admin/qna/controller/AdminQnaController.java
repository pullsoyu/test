package first.admin.qna.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import first.admin.qna.service.AdminQnaService;
import first.common.common.CommandMap;

@Controller
public class AdminQnaController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="adminQnaService")
	private AdminQnaService adminQnaService;
	
	
	@RequestMapping(value="/admin/qnaList.do")
	public ModelAndView adminQnaList(HttpServletRequest httpServletRequest, Map<String,Object> commandMap) throws Exception{
		ModelAndView mv = new ModelAndView(".tiles/admin/qnaList");
	return mv;
	}
	
	@RequestMapping(value="/admin/selectQnaList.do")
    public ModelAndView selectQnaList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	List<Map<String,Object>> list = adminQnaService.selectQnaList(commandMap.getMap());
    	mv.addObject("list", list);
    	if(list.size() > 0){
    		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
    	}
    	else{
    		mv.addObject("TOTAL", 0);
    	}
    	
    	return mv;
    }
	
	@RequestMapping(value="/admin/qnaDetail.do")//질문상세내역
	public ModelAndView qnaDetail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView(".tiles/admin/qnaDetail");
		
		Map<String,Object> map = adminQnaService.adminQnaDetail(commandMap.getMap());
		mv.addObject("map", map);
		
		return mv;
	}
	
	@RequestMapping(value="/admin/qnaModifyForm.do")
    public ModelAndView qnaModifyForm(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView(".tiles/admin/qnaModifyForm");
    	
    	Map<String,Object> map = adminQnaService.adminQnaDetail(commandMap.getMap());
		mv.addObject("map", map);
    	
    	return mv;
    }
	
	@RequestMapping(value="/admin/qnaModify.do")
	public ModelAndView updateQna(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/qnaList.do");
		
		adminQnaService.adminQnaModify(commandMap.getMap());
		
		mv.addObject("QNA_IDX", commandMap.get("QNA_IDX"));
		return mv;
	}
	
	@RequestMapping(value="/admin/qnaDelete.do")
	public ModelAndView deleteQna(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/qnaList.do");

		adminQnaService.adminQnaDelete(commandMap.getMap());
		mv.addObject("QNA_IDX", commandMap.get("QNA_IDX"));
		return mv;
	}
	
}
