package first.admin.notice.board.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import first.admin.board.service.AdminBoardService;
import first.common.common.CommandMap;

@Controller
public class AdminNoticeBoardController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="adminBoardService")
	private AdminBoardService adminBoardService;
	
	@RequestMapping(value="/admin/board/openNoticeBoardList.do")
    public ModelAndView openBoardList(Map<String,Object> commandMap) throws Exception{ 
		ModelAndView mv = new ModelAndView(".tiles/admin/noticeList"); 
				
		return mv; 
	} 	
	
	@RequestMapping(value="/admin/board/selectNoticeBoardList.do")
	public ModelAndView selectBoardList(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		
		List<Map<String,Object>> list = adminBoardService.selectNoticeBoardList(commandMap.getMap());
		mv.addObject("list", list);
		if(list.size() > 0){
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		}
		else{
			mv.addObject("TOTAL", 0);
		}
		
		return mv;
	}
	
	/*
	 * @RequestMapping(value = "/sample/testMapArgumentResolver.do") public
	 * ModelAndView testMapArgumentResolver(CommandMap commandMap) throws Exception
	 * {
	 * 
	 * ModelAndView mv = new ModelAndView("");
	 * 
	 * if (commandMap.isEmpty() == false) { Iterator<Entry<String, Object>> iterator
	 * = commandMap.getMap().entrySet().iterator(); Entry<String, Object> entry =
	 * null; while (iterator.hasNext()) { entry = iterator.next();
	 * log.debug("key : " + entry.getKey() + ", value : " + entry.getValue()); } }
	 * return mv; }
	 */

	@RequestMapping(value = "/admin/board/openNoticeBoardWrite.do")
	public ModelAndView openBoardWrite(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/admin/noticeWrite");
		
		return mv;
	}	

	@RequestMapping(value = "/admin/board/insertNoticeBoard.do")
	public ModelAndView insertBoard(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/board/openNoticeBoardList.do");
		
		adminBoardService.insertBoard(commandMap.getMap(), request);
		
		return mv;
	}

	@RequestMapping(value = "/admin/board/openNoticeBoardDetail.do")
	public ModelAndView openBoardDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/admin/noticeDetail");
		
		Map<String, Object> map = adminBoardService.selectBoardDetail(commandMap.getMap());
		
		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));

		mv.addObject("commentList", map.get("commentList"));
		
		return mv; 
		
		} 
	
	@RequestMapping(value = "/admin/board/openNohitNoticeBoardDetail.do")
	public ModelAndView openNohitBoardDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView(".tiles/admin/noticeDetail");
		
		Map<String, Object> map = adminBoardService.selectNohitBoardDetail(commandMap.getMap());
		
		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));

		mv.addObject("commentList", map.get("commentList"));	
			
		return mv; 
		
		} 		
	
	@RequestMapping(value="/admin/board/openNoticeBoardUpdate.do")
	public ModelAndView openBoardUpdate(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView(".tiles/admin/noticeUpdate");
		
		Map<String,Object> map = adminBoardService.selectNohitBoardDetail(commandMap.getMap());
		
		mv.addObject("map", map.get("map")); 
		mv.addObject("list", map.get("list"));
		
		return mv;
	}

	@RequestMapping(value="/admin/board/updateNoticeBoard.do")
	public ModelAndView updateBoard(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/board/openNoticeBoardList.do");
		
		adminBoardService.updateBoard(commandMap.getMap(), request);
		
		mv.addObject("BOARD_KIND", commandMap.get("BOARD_KIND"));
		mv.addObject("BOARD_IDX", commandMap.get("BOARD_IDX"));
			
		return mv;
	}		
		
	@RequestMapping(value = "/admin/board/deleteNoticeBoard.do")
	public ModelAndView deleteBoard(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/board/openNoticeBoardList.do");
		adminBoardService.deleteBoard(commandMap.getMap());
		return mv;
	}
	
	/* 댓글컨트롤러 */	
	@ResponseBody
	@RequestMapping(value = "/admin/board/openCommentNoticeBoardList.do", method = RequestMethod.GET)
	public ModelAndView openCommentBoardList(@RequestParam("n") int BOARD_IDX, @RequestParam("m") int BOARD_KIND, CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		
		commandMap.getMap().put("BOARD_KIND", BOARD_KIND);
		commandMap.getMap().put("BOARD_IDX", BOARD_IDX);
		
		List<Map<String,Object>> list = adminBoardService.selectCommentBoardList(commandMap.getMap());
		mv.addObject("list", list);
		
		return mv; 
	} 	
	
	@RequestMapping(value="/admin/board/selectCommentNoticeBoardList.do")
	public ModelAndView selectCommentBoardList(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		
		List<Map<String,Object>> list = adminBoardService.selectCommentBoardList(commandMap.getMap());
		
		if(list.size() > 0){
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		}
		else{
			mv.addObject("TOTAL", 0);
		}
		
		return mv;
	}
	
	@RequestMapping(value = "/admin/board/insertCommentNoticeBoard.do")
	public ModelAndView insertCommentBoard(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/board/openNohitNoticeBoardDetail.do");
		
		adminBoardService.insertCommentBoard(commandMap.getMap());
		
		mv.addObject("BOARD_KIND", commandMap.get("BOARD_KIND"));
		mv.addObject("BOARD_IDX", commandMap.get("BOARD_IDX"));
		
		return mv;
	}
	
	@RequestMapping(value="/admin/board/updateCommentNoticeBoard.do")
	public ModelAndView updateCommentBoard(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/board/openNohitNoticeBoardDetail.do");
		
		commandMap.put("COMMENT_IDX", commandMap.get("COMMENT_IDX"));
    	commandMap.put("MEMBER_ID", commandMap.get("MEMBER_ID"));
		
		adminBoardService.updateCommentBoard(commandMap.getMap());

		mv.addObject("BOARD_KIND", commandMap.get("BOARD_KIND"));
		mv.addObject("BOARD_IDX", commandMap.get("BOARD_IDX"));
	
		return mv;
	}		
		
	@RequestMapping(value = "/admin/board/commentNoticeBoardDelete.do")
	public ModelAndView deleteCommentBoard(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/board/openNohitNoticeBoardDetail.do");
		
		commandMap.put("COMMENT_IDX", commandMap.get("COMMENT_IDX"));
    	commandMap.put("MEMBER_ID", commandMap.get("MEMBER_ID"));
		
		adminBoardService.deleteCommentBoard(commandMap.getMap());
		
		mv.addObject("BOARD_KIND", commandMap.get("BOARD_KIND"));
		mv.addObject("BOARD_IDX", commandMap.get("BOARD_IDX"));
		
		return mv;
	}
	
}

