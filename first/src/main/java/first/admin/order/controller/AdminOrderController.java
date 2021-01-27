package first.admin.order.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import first.admin.order.service.AdminOrderService;
import first.common.common.CommandMap;


@Controller
public class AdminOrderController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="adminOrderService")
	private AdminOrderService adminOrderService;
	
	@RequestMapping(value="/admin/orderList.do")
	public ModelAndView adminOrderList(Map<String,Object> commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView(".tiles/admin/orderList");
	
    	return mv;
	}
	
	@RequestMapping(value="/admin/selectOrderList.do")
    public ModelAndView selectOrderList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	List<Map<String,Object>> list = adminOrderService.selectOrderList(commandMap.getMap());
    	mv.addObject("list", list);
    	if(list.size() > 0){
    		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
    	}
    	else{
    		mv.addObject("TOTAL", 0);
    	}
    	
    	return mv;
    }
	
	
	
	@RequestMapping(value="/admin/orderStateModify.do")
	public ModelAndView updateOrder(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/orderList.do");
		
		adminOrderService.adminOrderModify(commandMap.getMap());
		
		mv.addObject("ORDER_IDX", commandMap.get("ORDER_IDX"));
		return mv;
		
		}
		
		
	
	
	
	
	
	
	
}
