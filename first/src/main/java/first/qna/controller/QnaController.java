package first.qna.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import first.common.common.CommandMap;
import first.qna.service.QnaService;

@Controller
public class QnaController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="qnaService")
	private QnaService qnaService;
	
	
	@RequestMapping(value="/board/qnaWriteForm.do")
	public ModelAndView faqWriteForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView(".mainTiles/board/qnaWriteForm");
		
		return mv;
	}
	
	@RequestMapping(value="/board/qnaList.do")
	public ModelAndView qnaList(HttpServletRequest httpServletRequest, Map<String,Object> commandMap) throws Exception{
		ModelAndView mv = new ModelAndView(".mainTiles/board/qnaList");
		HttpSession session = httpServletRequest.getSession(); 
		commandMap.put("MEMBER_ID",session.getAttribute("session_MEMBER_ID"));
		
		List<Map<String,Object>> list = qnaService.qnaList(commandMap);
		mv.addObject("qnalist", list);
		
	return mv;
	}
	
	@RequestMapping(value="/board/qnaDetail.do")//질문상세내역
	public ModelAndView qnaDetail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView(".mainTiles/board/qnaDetail");
		
		Map<String,Object> map = qnaService.qnaDetail(commandMap.getMap());
		mv.addObject("map", map);
		
		return mv;
	}
	
	@RequestMapping(value="/board/qnaModifyForm.do")
    public ModelAndView qnaModifyForm(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView(".mainTiles/board/qnaModifyForm");
    	
    	Map<String,Object> map = qnaService.qnaDetail(commandMap.getMap());
		mv.addObject("map", map);
    	
    	return mv;
    }
	
	@RequestMapping(value="/board/qnaModify.do")
	public ModelAndView updateQna(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/board/qnaList.do");
		qnaService.qnaModify(commandMap.getMap());
		mv.addObject("QNA_IDX", commandMap.get("QNA_IDX"));
		return mv;
	}
	
	@RequestMapping(value="/board/qnaWrite.do")
	public ModelAndView qnaWrite(HttpServletRequest httpServletRequest, CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/board/qnaList.do");
		
		HttpSession session = httpServletRequest.getSession(); 
		commandMap.put("MEMBER_ID",session.getAttribute("session_MEMBER_ID"));
		
		
		qnaService.qnaWrite(commandMap.getMap());
		
		mv.addObject("QNA_IDX", commandMap.get("QNA_IDX"));
		return mv;
	}
	
	@RequestMapping(value="/board/qnaDelete.do")
	public ModelAndView qnaDelete(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/board/qnaList.do");
		System.out.println("@@##"+commandMap.getMap());
		qnaService.qnaDelete(commandMap.getMap());
		mv.addObject("QNA_IDX", commandMap.get("QNA_IDX"));
		return mv;
	}
	
}
