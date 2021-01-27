package first.admin.goods.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import first.admin.goods.service.AdminGoodsService;
import first.common.common.CommandMap;

@Controller
public class AdminGoodsController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="adminGoodsService")
	private AdminGoodsService adminGoodsService;
	
	@RequestMapping(value="/admin/goodsList.do")
	public ModelAndView adminGoodsList(Map<String,Object> commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView(".tiles/admin/goodsList");
    	
    	return mv;
	}
	
	@RequestMapping(value="/admin/selectGoodsList.do")
    public ModelAndView selectGoodsList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	List<Map<String,Object>> list = adminGoodsService.selectGoodsList(commandMap.getMap());
    	mv.addObject("list", list);
    	if(list.size() > 0){
    		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
    	}
    	else{
    		mv.addObject("TOTAL", 0);
    	}
    	
    	return mv;
    }
	
	
	
	@RequestMapping(value="/admin/goodsDetail.do")//상품상세보기
	public ModelAndView openGoodsDetail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView(".tiles/admin/goodsDetail");
		
		Map<String,Object> map = adminGoodsService.adminGoodsDetail(commandMap.getMap());
		mv.addObject("map", map);
		
		return mv;
	}
	
	@RequestMapping(value="/admin/goodsWriteForm.do") //상품등록폼으로가기
	public ModelAndView goodsWriteForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView(".tiles/admin/goodsWriteForm");
		
		return mv;
	}
	@RequestMapping(value="/admin/goodsWrite.do") //상품등록
	public ModelAndView goodsWrite(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/goodsList.do");
		
		commandMap.put("GOODS_SUMIMG", request.getSession().getAttribute("uploadFileName"));
		
		adminGoodsService.goodsWrite(commandMap.getMap());
		
		return mv;
	}
	
	@RequestMapping(value="/admin/goodsModifyForm.do")
    public ModelAndView goodsModifyForm(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView(".tiles/admin/goodsModify");
    	
    	Map<String,Object> map = adminGoodsService.adminGoodsDetail(commandMap.getMap());
		mv.addObject("map", map);
    	
    	return mv;
    }
	
	
	@RequestMapping(value="/admin/goodsModify.do")
	public ModelAndView updateGoods(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/goodsList.do");
		
		adminGoodsService.adminGoodsModify(commandMap.getMap());
		
		mv.addObject("GOODS_IDX", commandMap.get("GOODS_IDX"));
		return mv;
	}
	
	@RequestMapping(value="/admin/goodsDelete.do")
	public ModelAndView deleteGoods(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/goodsList.do");

		adminGoodsService.adminGoodsDelete(commandMap.getMap());
		mv.addObject("GOODS_IDX", commandMap.get("GOODS_IDX"));
		return mv;
	}
	
	
	
	
	
	
}
