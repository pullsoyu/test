package first.shop.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import first.common.common.CommandMap;
import first.mypage.service.MyPageService;
import first.shop.service.ShopService;

@Controller
public class ShopController {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="shopService")
	private ShopService shopService;
	@Resource(name="myPageService")
	private MyPageService myPageService;
	
	@ResponseBody
	@RequestMapping(value="/shop/addCartOrderList.do")
	public ModelAndView addOrderList(CommandMap commandMap,@RequestParam(value = "chk[]") List<String> chArr,HttpServletRequest request
			) throws Exception { 
		ModelAndView mv = new ModelAndView("./mypage/cartKakaoPay");
		int cartNum = 0;
		
		HttpSession session = request.getSession(); 
		commandMap.put("MEMBER_ID",session.getAttribute("session_MEMBER_ID"));
		List<Map<String,Object>> list = myPageService.selectBasketList(commandMap.getMap());
		
		
		/*
		 * Map<String,Object> map2 = ; map2.put("totalPrice",
		 * commandMap.getMap().get("totalPrice")); map2.put("RANDOM",
		 * commandMap.getMap().get("RANDOM")); System.out.println(map2+"@@@");
		 */
		
		shopService.addCartOrderList(list,commandMap.getMap());
		
		
		/*
		 * for(String i : chArr) { cartNum = Integer.parseInt(i);
		 * System.out.println(commandMap.getMap());
		 * shopService.addCartOrderList(commandMap.getMap()); }
		 */
		 
		
		System.out.println(commandMap.getMap());
		mv.addObject("list", commandMap.getMap());
		HttpSession sessionId = request.getSession(); 
		commandMap.put("MEMBER_ID",sessionId.getAttribute("session_MEMBER_ID"));
		myPageService.basketClear(commandMap.getMap());
		
		return mv; 
	}
	
	@ResponseBody
	@RequestMapping(value="/shop/addOrderList.do")
	public ModelAndView addOrderList(CommandMap commandMap) throws Exception { 
		ModelAndView mv = new ModelAndView("./mypage/kakaoPay");		
		shopService.addOrderList(commandMap.getMap());
		String price = String.valueOf(commandMap.getMap().get("GOODS_PRICE"));
		System.out.println(commandMap.get("GOODS_PRICE")+"@@@");
		mv.addObject("GOODS_PRICE", commandMap.get("GOODS_PRICE"));
		mv.addObject("RANDOM", commandMap.get("RANDOM"));
		return mv; 
	}
	
	@ResponseBody
	@RequestMapping(value="/shop/addLike2.do")	//통합검색에서 찜하기
	public void addLike2(CommandMap commandMap) throws Exception { 
		//ModelAndView mv = new ModelAndView("redirect:/main/searchList.do");
		shopService.addLike(commandMap.getMap());
		//return mv; 
	}
	@ResponseBody
	@RequestMapping(value="/shop/addLike.do")	//상품상세보기에서 찜하기
	public ModelAndView addLike(CommandMap commandMap) throws Exception { 
		ModelAndView mv = new ModelAndView("redirect:/main/goodsDetail.do");
		shopService.addLike(commandMap.getMap());
		mv.addObject("GOODS_IDX", commandMap.get("GOODS_IDX"));
		return mv; 
	}
	@ResponseBody
	@RequestMapping(value="/shop/addCart.do")
	public ModelAndView addCart(CommandMap commandMap) throws Exception { 
		ModelAndView mv = new ModelAndView("redirect:/main/goodsDetail.do");
		shopService.addCart(commandMap.getMap());
		mv.addObject("GOODS_IDX", commandMap.get("GOODS_IDX"));
		return mv; 
	}
	
	
	@RequestMapping(value="/shop/reviewWrite.do")
	public ModelAndView reviewWrite(CommandMap commandMap) throws Exception { 
		ModelAndView mv = new ModelAndView("redirect:/main/goodsDetail.do");
		shopService.reviewWrite(commandMap.getMap());
		mv.addObject("GOODS_IDX", commandMap.get("GOODS_IDX"));
		
		return mv; 
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/shop/goodsReviewList.do", method = RequestMethod.GET)
	public ModelAndView goodsReviewList(@RequestParam("n") int GOODS_IDX, CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		commandMap.getMap().put("GOODS_IDX", GOODS_IDX);
		
		List<Map<String,Object>> list = shopService.goodsReviewList(commandMap.getMap());
		mv.addObject("list", list);
		
		return mv; 
	}
	
	
	
	@RequestMapping(value="/shop/goodsReviewDelete.do")
    public ModelAndView goodsReviewDelete(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("redirect:/main/goodsDetail.do");
    	
    	commandMap.put("REVIEW_IDX", commandMap.get("REVIEW_IDX"));
    	commandMap.put("MEMBER_IDX", commandMap.get("MEMBER_IDX"));
    	shopService.reviewDelete(commandMap.getMap());
    	mv.addObject("GOODS_IDX", commandMap.get("GOODS_IDX"));
    	
    	return mv;
    }
	
	@RequestMapping(value="/shop/goodsReviewModify.do")
	public ModelAndView goodsReviewModify(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("redirect:/main/goodsDetail.do");
    	
    	commandMap.put("REVIEW_IDX", commandMap.get("REVIEW_IDX"));
    	commandMap.put("MEMBER_IDX", commandMap.get("MEMBER_IDX"));
    	shopService.reviewModify(commandMap.getMap());
    	mv.addObject("GOODS_IDX", commandMap.get("GOODS_IDX"));
    	
    	return mv;
    }
	
	@RequestMapping(value="/shop/orderError.do")
	public ModelAndView orderError(CommandMap commandMap,HttpServletRequest request) throws Exception{
    	ModelAndView mv = new ModelAndView("redirect:/main/openBoardList.do");
    	HttpSession session = request.getSession(); 
		commandMap.put("MEMBER_ID",session.getAttribute("session_MEMBER_ID"));
    	shopService.orderError(commandMap.getMap());
    	
		mv.addObject(commandMap.getMap());
    	return mv;
    }
	
	
	
	
}
