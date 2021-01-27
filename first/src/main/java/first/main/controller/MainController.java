package first.main.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import first.common.common.CommandMap;
import first.main.service.MainService;

@Controller
public class MainController {
Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="mainService")
	private MainService mainService;
	
	@RequestMapping(value="/main/openBoardList.do")
    public ModelAndView openSampleBoardList(Map<String,Object> commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView(".mainTiles/main/boardList");
    	
    	List<Map<String,Object>> list = mainService.selectBoardList(commandMap);
    	mv.addObject("list", list);
    	
    	return mv;
    }
    
	@RequestMapping(value="/main/goodsDetail.do")//상품상세보기
	public ModelAndView openGoodsDetail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView(".mainTiles/main/goodsDetail");
		
		Map<String,Object> map = mainService.goodsDetail(commandMap.getMap());
		mv.addObject("map", map);
						
		return mv;
	}
	
	@RequestMapping(value="/main/fruitList.do")
    public ModelAndView openFruitList(CommandMap commandMap) throws Exception{
		
	ModelAndView mv = new ModelAndView(".mainTiles/goods/fruitList");
    	mv.addObject("map",commandMap.getMap());
    	
    	System.out.println("@@테스트" + commandMap.getMap());
    	
    	return mv;
    }
	
	@RequestMapping(value="/main/selectFruitList.do")
    public ModelAndView selectFruitList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	System.out.println("@@테스트2" + commandMap.getMap());
    	
    	List<Map<String,Object>> list = mainService.selectFruitList(commandMap.getMap());
    	
    	mv.addObject("list", list);
    	if(list.size() > 0){
    		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
    	}
    	else{
    		mv.addObject("TOTAL", 0);
    	}
    	
    	return mv;
    }
	
	@RequestMapping(value="/main/grainList.do")
    public ModelAndView openGrainList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView(".mainTiles/goods/grainList");
    	
    	mv.addObject("map",commandMap.getMap());
    	System.out.println("@@테스트" + commandMap.getMap());
    	
    	return mv;
    }
	
	@RequestMapping(value="/main/selectGrainList.do")
    public ModelAndView selectGrainList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	System.out.println("@@테스트2" + commandMap.getMap());
    	
    	List<Map<String,Object>> list = mainService.selectGrainList(commandMap.getMap());
    	
    	mv.addObject("list", list);
    	if(list.size() > 0){
    		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
    	}
    	else{
    		mv.addObject("TOTAL", 0);
    	}
    	
    	return mv;
    }
	
	@RequestMapping(value="/main/meatList.do")
    public ModelAndView openMeatList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView(".mainTiles/goods/meatList");
    	
    	mv.addObject("map",commandMap.getMap());
    	System.out.println("@@테스트" + commandMap.getMap());
    	
    	return mv;
    }
	
	@RequestMapping(value="/main/selectMeatList.do")
    public ModelAndView selectMeatList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	System.out.println("@@테스트2" + commandMap.getMap());
    	
    	List<Map<String,Object>> list = mainService.selectMeatList(commandMap.getMap());
    	
    	mv.addObject("list", list);
    	if(list.size() > 0){
    		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
    	}
    	else{
    		mv.addObject("TOTAL", 0);
    	}
    	
    	return mv;
    }
	
	@RequestMapping(value="/main/vegetableList.do")
    public ModelAndView openVegetableList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView(".mainTiles/goods/vegetableList");
    	
    	mv.addObject("map",commandMap.getMap());
    	System.out.println("@@테스트" + commandMap.getMap());
    	
    	return mv;
    }
	
	@RequestMapping(value="/main/selectVegetableList.do")
    public ModelAndView selectVegetableList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	System.out.println("@@테스트2" + commandMap.getMap());
    	
    	List<Map<String,Object>> list = mainService.selectVegetableList(commandMap.getMap());
    	
    	mv.addObject("list", list);
    	if(list.size() > 0){
    		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
    	}
    	else{
    		mv.addObject("TOTAL", 0);
    	}
    	
    	return mv;
    }
	
	@RequestMapping(value="/main/searchList.do")
    public ModelAndView openBoardList(CommandMap commandMap) throws Exception{
		
    	ModelAndView mv = new ModelAndView(".mainTiles/main/searchList");
    	mv.addObject("map",commandMap.getMap());
    	
    	System.out.println("@@테스트" + commandMap.getMap());
    	
    	return mv;
    }
	
	//통합검색 ajax
	@RequestMapping(value="/main/selectSearchList.do")
    public ModelAndView selectSearchList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	System.out.println("@@테스트2" + commandMap.getMap());
    	
    	List<Map<String,Object>> list = mainService.selectSearchList(commandMap.getMap());
    	
    	mv.addObject("list", list);
    	if(list.size() > 0){
    		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
    	}
    	else{
    		mv.addObject("TOTAL", 0);
    	}
    	
    	return mv;
    }
	
	
	
}
