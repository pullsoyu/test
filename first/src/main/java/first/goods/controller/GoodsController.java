package first.goods.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import first.common.common.CommandMap;
import first.goods.service.GoodsService;

@Controller
public class GoodsController {
	Logger log=Logger.getLogger(this.getClass());
	
	@Resource(name="goodsService")
	private GoodsService goodsService;
	
	//=========과일==============//
	@RequestMapping(value="/goods/fruitListPA.do")
    public ModelAndView openFruitListPA(CommandMap commandMap) throws Exception{
    	
    	
    	ModelAndView mv = new ModelAndView(".mainTiles/goods/fruitListPA");
    	mv.addObject("map",commandMap.getMap());
    	
    	System.out.println("@@테스트" + commandMap.getMap());
    	
    	return mv;
    }
	
	@RequestMapping(value="/goods/selectFruitListPA.do")
    public ModelAndView selectFruitListPA(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	System.out.println("@@테스트2" + commandMap.getMap());
    	
    	List<Map<String,Object>> list = goodsService.selectFruitListPA(commandMap.getMap());
    	
    	mv.addObject("list", list);
    	if(list.size() > 0){
    		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
    	}
    	else{
    		mv.addObject("TOTAL", 0);
    	}
    	
    	return mv;
    }
	
	@RequestMapping(value="/goods/fruitListPD.do")
    public ModelAndView openFruitListPD(CommandMap commandMap) throws Exception{
    	
    	
    	ModelAndView mv = new ModelAndView(".mainTiles/goods/fruitListPD");
    	mv.addObject("map",commandMap.getMap());
    	
    	System.out.println("@@테스트" + commandMap.getMap());
    	
    	return mv;
    }
	
	@RequestMapping(value="/goods/selectFruitListPD.do")
    public ModelAndView selectFruitListPD(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	System.out.println("@@테스트2" + commandMap.getMap());
    	
    	List<Map<String,Object>> list = goodsService.selectFruitListPD(commandMap.getMap());
    	
    	mv.addObject("list", list);
    	if(list.size() > 0){
    		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
    	}
    	else{
    		mv.addObject("TOTAL", 0);
    	}
    	
    	return mv;
    }
	@RequestMapping(value="/goods/fruitListRD.do")
    public ModelAndView openFruitListRD(CommandMap commandMap) throws Exception{
    	
    	
    	ModelAndView mv = new ModelAndView(".mainTiles/goods/fruitListRD");
    	mv.addObject("map",commandMap.getMap());
    	
    	System.out.println("@@테스트" + commandMap.getMap());
    	
    	return mv;
    }
	
	@RequestMapping(value="/goods/selectFruitListRD.do")
    public ModelAndView selectFruitListRD(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	System.out.println("@@테스트2" + commandMap.getMap());
    	
    	List<Map<String,Object>> list = goodsService.selectFruitListRD(commandMap.getMap());
    	
    	mv.addObject("list", list);
    	if(list.size() > 0){
    		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
    	}
    	else{
    		mv.addObject("TOTAL", 0);
    	}
    	
    	return mv;
    }
	@RequestMapping(value="/goods/fruitListID.do")
    public ModelAndView openFruitListID(CommandMap commandMap) throws Exception{
    	
    	
    	ModelAndView mv = new ModelAndView(".mainTiles/goods/fruitListID");
    	mv.addObject("map",commandMap.getMap());
    	
    	System.out.println("@@테스트" + commandMap.getMap());
    	
    	return mv;
    }
	
	@RequestMapping(value="/goods/selectFruitListID.do")
    public ModelAndView selectFruitListID(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	System.out.println("@@테스트2" + commandMap.getMap());
    	
    	List<Map<String,Object>> list = goodsService.selectFruitListID(commandMap.getMap());
    	
    	mv.addObject("list", list);
    	if(list.size() > 0){
    		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
    	}
    	else{
    		mv.addObject("TOTAL", 0);
    	}
    	
    	return mv;
    }

	//=============잡곡============//
	
	@RequestMapping(value="/goods/grainListPA.do")
    public ModelAndView openGrainListPA(CommandMap commandMap) throws Exception{
    	
    	
    	ModelAndView mv = new ModelAndView(".mainTiles/goods/grainListPA");
    	mv.addObject("map",commandMap.getMap());
    	
    	System.out.println("@@테스트" + commandMap.getMap());
    	
    	return mv;
    }
	
	@RequestMapping(value="/goods/selectGrainListPA.do")
    public ModelAndView selectGrainListPA(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	System.out.println("@@테스트2" + commandMap.getMap());
    	
    	List<Map<String,Object>> list = goodsService.selectGrainListPA(commandMap.getMap());
    	
    	mv.addObject("list", list);
    	if(list.size() > 0){
    		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
    	}
    	else{
    		mv.addObject("TOTAL", 0);
    	}
    	
    	return mv;
    }
	
	@RequestMapping(value="/goods/grainListPD.do")
    public ModelAndView openGrainListPD(CommandMap commandMap) throws Exception{
    	
    	
    	ModelAndView mv = new ModelAndView(".mainTiles/goods/grainListPD");
    	mv.addObject("map",commandMap.getMap());
    	
    	System.out.println("@@테스트" + commandMap.getMap());
    	
    	return mv;
    }
	
	@RequestMapping(value="/goods/selectGrainListPD.do")
    public ModelAndView selectGrainListPD(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	System.out.println("@@테스트2" + commandMap.getMap());
    	
    	List<Map<String,Object>> list = goodsService.selectGrainListPD(commandMap.getMap());
    	
    	mv.addObject("list", list);
    	if(list.size() > 0){
    		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
    	}
    	else{
    		mv.addObject("TOTAL", 0);
    	}
    	
    	return mv;
    }
	@RequestMapping(value="/goods/grainListRD.do")
    public ModelAndView openGrainListRD(CommandMap commandMap) throws Exception{
    	
    	
    	ModelAndView mv = new ModelAndView(".mainTiles/goods/grainListRD");
    	mv.addObject("map",commandMap.getMap());
    	
    	System.out.println("@@테스트" + commandMap.getMap());
    	
    	return mv;
    }
	
	@RequestMapping(value="/goods/selectGrainListRD.do")
    public ModelAndView selectGrainListRD(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	System.out.println("@@테스트2" + commandMap.getMap());
    	
    	List<Map<String,Object>> list = goodsService.selectGrainListRD(commandMap.getMap());
    	
    	mv.addObject("list", list);
    	if(list.size() > 0){
    		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
    	}
    	else{
    		mv.addObject("TOTAL", 0);
    	}
    	
    	return mv;
    }
	@RequestMapping(value="/goods/grainListID.do")
    public ModelAndView openGrainListID(CommandMap commandMap) throws Exception{
    	
    	
    	ModelAndView mv = new ModelAndView(".mainTiles/goods/grainListID");
    	mv.addObject("map",commandMap.getMap());
    	
    	System.out.println("@@테스트" + commandMap.getMap());
    	
    	return mv;
    }
	
	@RequestMapping(value="/goods/selectGrainListID.do")
    public ModelAndView selectGrainListID(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	System.out.println("@@테스트2" + commandMap.getMap());
    	
    	List<Map<String,Object>> list = goodsService.selectGrainListID(commandMap.getMap());
    	
    	mv.addObject("list", list);
    	if(list.size() > 0){
    		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
    	}
    	else{
    		mv.addObject("TOTAL", 0);
    	}
    	
    	return mv;
    }
	//=======축산=====//
	
	@RequestMapping(value="/goods/meatListPA.do")
    public ModelAndView openMeatListPA(CommandMap commandMap) throws Exception{
    	
    	
    	ModelAndView mv = new ModelAndView(".mainTiles/goods/meatListPA");
    	mv.addObject("map",commandMap.getMap());
    	
    	System.out.println("@@테스트" + commandMap.getMap());
    	
    	return mv;
    }
	
	@RequestMapping(value="/goods/selectMeatListPA.do")
    public ModelAndView selectMeatListPA(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	System.out.println("@@테스트2" + commandMap.getMap());
    	
    	List<Map<String,Object>> list = goodsService.selectMeatListPA(commandMap.getMap());
    	
    	mv.addObject("list", list);
    	if(list.size() > 0){
    		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
    	}
    	else{
    		mv.addObject("TOTAL", 0);
    	}
    	
    	return mv;
    }
	
	@RequestMapping(value="/goods/meatListPD.do")
    public ModelAndView openMeatListPD(CommandMap commandMap) throws Exception{
    	
    	
    	ModelAndView mv = new ModelAndView(".mainTiles/goods/meatListPD");
    	mv.addObject("map",commandMap.getMap());
    	
    	System.out.println("@@테스트" + commandMap.getMap());
    	
    	return mv;
    }
	
	@RequestMapping(value="/goods/selectMeatListPD.do")
    public ModelAndView selectMeatListPD(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	System.out.println("@@테스트2" + commandMap.getMap());
    	
    	List<Map<String,Object>> list = goodsService.selectMeatListPD(commandMap.getMap());
    	
    	mv.addObject("list", list);
    	if(list.size() > 0){
    		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
    	}
    	else{
    		mv.addObject("TOTAL", 0);
    	}
    	
    	return mv;
    }
	@RequestMapping(value="/goods/meatListRD.do")
    public ModelAndView openMeatListRD(CommandMap commandMap) throws Exception{
    	
    	
    	ModelAndView mv = new ModelAndView(".mainTiles/goods/meatListRD");
    	mv.addObject("map",commandMap.getMap());
    	
    	System.out.println("@@테스트" + commandMap.getMap());
    	
    	return mv;
    }
	
	@RequestMapping(value="/goods/selectMeatListRD.do")
    public ModelAndView selectMeatListRD(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	System.out.println("@@테스트2" + commandMap.getMap());
    	
    	List<Map<String,Object>> list = goodsService.selectMeatListRD(commandMap.getMap());
    	
    	mv.addObject("list", list);
    	if(list.size() > 0){
    		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
    	}
    	else{
    		mv.addObject("TOTAL", 0);
    	}
    	
    	return mv;
    }
	@RequestMapping(value="/goods/meatListID.do")
    public ModelAndView openMeatListID(CommandMap commandMap) throws Exception{
    	
    	
    	ModelAndView mv = new ModelAndView(".mainTiles/goods/meatListID");
    	mv.addObject("map",commandMap.getMap());
    	
    	System.out.println("@@테스트" + commandMap.getMap());
    	
    	return mv;
    }
	
	@RequestMapping(value="/goods/selectMeatListID.do")
    public ModelAndView selectMeatListID(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	System.out.println("@@테스트2" + commandMap.getMap());
    	
    	List<Map<String,Object>> list = goodsService.selectMeatListID(commandMap.getMap());
    	
    	mv.addObject("list", list);
    	if(list.size() > 0){
    		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
    	}
    	else{
    		mv.addObject("TOTAL", 0);
    	}
    	
    	return mv;
    }
	//============채소============//
	@RequestMapping(value="/goods/vegetableListPA.do")
    public ModelAndView openVegetableListPA(CommandMap commandMap) throws Exception{
    	
    	
    	ModelAndView mv = new ModelAndView(".mainTiles/goods/vegetableListPA");
    	mv.addObject("map",commandMap.getMap());
    	
    	System.out.println("@@테스트" + commandMap.getMap());
    	
    	return mv;
    }
	
	@RequestMapping(value="/goods/selectVegetableListPA.do")
    public ModelAndView selectVegetableListPA(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	System.out.println("@@테스트2" + commandMap.getMap());
    	
    	List<Map<String,Object>> list = goodsService.selectVegetableListPA(commandMap.getMap());
    	
    	mv.addObject("list", list);
    	if(list.size() > 0){
    		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
    	}
    	else{
    		mv.addObject("TOTAL", 0);
    	}
    	
    	return mv;
    }
	
	@RequestMapping(value="/goods/vegetableListPD.do")
    public ModelAndView openVegetableListPD(CommandMap commandMap) throws Exception{
    	
    	
    	ModelAndView mv = new ModelAndView(".mainTiles/goods/vegetableListPD");
    	mv.addObject("map",commandMap.getMap());
    	
    	System.out.println("@@테스트" + commandMap.getMap());
    	
    	return mv;
    }
	
	@RequestMapping(value="/goods/selectVegetableListPD.do")
    public ModelAndView selectVegetableListPD(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	System.out.println("@@테스트2" + commandMap.getMap());
    	
    	List<Map<String,Object>> list = goodsService.selectVegetableListPD(commandMap.getMap());
    	
    	mv.addObject("list", list);
    	if(list.size() > 0){
    		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
    	}
    	else{
    		mv.addObject("TOTAL", 0);
    	}
    	
    	return mv;
    }
	@RequestMapping(value="/goods/vegetableListRD.do")
    public ModelAndView openVegetableListRD(CommandMap commandMap) throws Exception{
    	
    	
    	ModelAndView mv = new ModelAndView(".mainTiles/goods/vegetableListRD");
    	mv.addObject("map",commandMap.getMap());
    	
    	System.out.println("@@테스트" + commandMap.getMap());
    	
    	return mv;
    }
	
	@RequestMapping(value="/goods/selectVegetableListRD.do")
    public ModelAndView selectVegetableListRD(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	System.out.println("@@테스트2" + commandMap.getMap());
    	
    	List<Map<String,Object>> list = goodsService.selectVegetableListRD(commandMap.getMap());
    	
    	mv.addObject("list", list);
    	if(list.size() > 0){
    		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
    	}
    	else{
    		mv.addObject("TOTAL", 0);
    	}
    	
    	return mv;
    }
	@RequestMapping(value="/goods/vegetableListID.do")
    public ModelAndView openVegetableListID(CommandMap commandMap) throws Exception{
    	
    	
    	ModelAndView mv = new ModelAndView(".mainTiles/goods/vegetableListID");
    	mv.addObject("map",commandMap.getMap());
    	
    	System.out.println("@@테스트" + commandMap.getMap());
    	
    	return mv;
    }
	
	@RequestMapping(value="/goods/selectVegetableListID.do")
    public ModelAndView selectVegetableListID(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	System.out.println("@@테스트2" + commandMap.getMap());
    	
    	List<Map<String,Object>> list = goodsService.selectVegetableListID(commandMap.getMap());
    	
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
