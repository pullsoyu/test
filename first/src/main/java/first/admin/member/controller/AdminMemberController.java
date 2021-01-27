package first.admin.member.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import first.admin.member.service.AdminMemberService;
import first.common.common.CommandMap;


@Controller
public class AdminMemberController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="adminMemberService")
	private AdminMemberService adminMemberService;
	
	@RequestMapping(value="/admin/memberList.do")
	public ModelAndView adminMemberList(Map<String,Object> commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView(".tiles/admin/memberList");
    	
    	return mv;
	}
	
	@RequestMapping(value="/admin/selectMemberList.do")
    public ModelAndView selectMemberList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	List<Map<String,Object>> list = adminMemberService.selectMemberList(commandMap.getMap());
    	mv.addObject("list", list);
    	if(list.size() > 0){
    		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
    	}
    	else{
    		mv.addObject("TOTAL", 0);
    	}
    	
    	return mv;
    }
	
	@RequestMapping(value="/admin/memberDetail.do")
	public ModelAndView openMemberDetail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView(".tiles/admin/memberDetail");
		
		Map<String,Object> map = adminMemberService.adminMemberDetail(commandMap.getMap());
		mv.addObject("map", map);
		
		return mv;
	}
	
	@RequestMapping(value="/admin/memberModifyForm.do")
    public ModelAndView memberModifyForm(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView(".tiles/admin/memberModify");
    	
    	Map<String,Object> map = adminMemberService.adminMemberDetail(commandMap.getMap());
		mv.addObject("map", map);
    	
    	return mv;
    }
	
	@RequestMapping(value="/admin/memberModify.do")
	public ModelAndView updateMember(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/memberList.do");
		
		adminMemberService.adminMemberModify(commandMap.getMap());
		
		mv.addObject("IDX", commandMap.get("IDX"));
		return mv;
	}
	
	
	
}
