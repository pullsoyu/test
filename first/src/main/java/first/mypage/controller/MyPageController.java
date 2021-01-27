package first.mypage.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;

import first.common.common.CommandMap;

import first.member.service.MemberService;
import first.mypage.service.MyPageService;


@Controller	//컨트롤러 객체 선언
public class MyPageController {
	
		@Resource(name="myPageService") 
	   private MyPageService myPageService;
		
		@Resource(name="memberService") 
		   private MemberService memberService;
		

	  
	  @RequestMapping(value = "/myPage/myPageMain.do") 
	  public ModelAndView myPageMain(CommandMap commandMap,HttpServletRequest request) throws Exception { 
		ModelAndView mv = new ModelAndView(".myPageTiles/mypage/myPageMain"); 
	  	HttpSession session = request.getSession(); 
		commandMap.put("MEMBER_ID",session.getAttribute("session_MEMBER_ID"));
		Map<String,Object> map = myPageService.selectAccountInfo(commandMap.getMap());
		List<Map<String,Object>> list = myPageService.selectBasketList(commandMap.getMap());
		List<Map<String,Object>> list2 = myPageService.selectLikeList(commandMap.getMap());
		List<Map<String,Object>> list3 = myPageService.selectMyOrdertList(commandMap.getMap());
		mv.addObject("map",map);
		mv.addObject("cartList",list); 
		mv.addObject("likeList",list2);
		mv.addObject("myOrderList",list3); 
      return mv; 
        
	  }
	
	  @RequestMapping(value = "/myPage/pwCheckForm.do") // 비밀번호 인증 폼을 보여주는 메소드
	  public ModelAndView pwCheckForm(CommandMap commandMap) throws Exception { 
		  ModelAndView mv = new ModelAndView("./mypage/pwCheckForm"); 
	  	return mv; 
	  }
	  
	  @RequestMapping(value = "/myPage/pwCheck.do") // 비밀번호 인증
	  public @ResponseBody String pwCheck(CommandMap commandMap, HttpServletRequest request) throws Exception {	  
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEMBER_ID"));
		System.out.println(commandMap.getMap());
		String pwCheck = String.valueOf(myPageService.selectPwCheck(commandMap.getMap()));  
		System.out.println(pwCheck);
	  	return pwCheck; 
	  }
	
		 
		 
		  
	  	  @RequestMapping(value = "/myPage/accountModifyForm.do") 
		  public ModelAndView accountModifyForm(CommandMap commandMap, HttpServletRequest request) throws Exception { 
		  ModelAndView mv = new ModelAndView(".myPageTiles/mypage/accountModifyForm");
		  HttpSession session = request.getSession(); 
		  commandMap.put("MEMBER_ID",session.getAttribute("session_MEMBER_ID")); 
		  Map<String,Object> map = myPageService.selectAccountInfo(commandMap.getMap());
		  mv.addObject("map",map); 
		  return mv; 
	  }
	  	
		  
		  @RequestMapping(value = "/myPage/accountModify.do") 
		  public ModelAndView accountModify(CommandMap commandMap) throws Exception { 
		  ModelAndView mv = new ModelAndView("redirect:/myPage/myPageMain.do");
			
		    myPageService.updateAccountModify(commandMap.getMap());
			mv.addObject("ID", commandMap.get("ID"));
			return mv;
	  }
		  @RequestMapping(value = "/myPage/accountDeleteForm.do") 
		  public ModelAndView accountDeleteForm(CommandMap commandMap, HttpServletRequest request) throws Exception { 
		  ModelAndView mv = new ModelAndView(".myPageTiles/mypage/accountDeleteForm");
		  HttpSession session = request.getSession(); 
		  commandMap.put("MEMBER_ID",session.getAttribute("session_MEMBER_ID")); 
		  Map<String,Object> map = myPageService.selectAccountInfo(commandMap.getMap());
		  mv.addObject("map",map); 
		  return mv; 
	  }
		  
		  
		  @RequestMapping(value = "/myPage/accountDelete.do") 
		  public ModelAndView accountDelete(CommandMap commandMap, HttpServletRequest request) throws Exception { 
		  ModelAndView mv = new ModelAndView(".myPageTiles/mypage/accountDelete");
		  	String message = "";
		  	String message2 = "";
			String url = "";
			HttpSession session = request.getSession();
			commandMap.put("MEMBER_ID",session.getAttribute("session_MEMBER_ID"));
			Map<String, Object> chk = memberService.loginCheck(commandMap.getMap());
			
		
				if(commandMap.get("MEMBER_PASSWORD") == null  ) {
					message = "비밀번호를 입력하세요";
				}else if(chk.get("MEMBER_PASSWORD").equals(commandMap.get("MEMBER_PASSWORD"))) {
					myPageService.deleteAccount(commandMap.getMap());
					message2 = "회원탈퇴 성공!";
					mv.setViewName("redirect:/member/loginForm.do");//로그인 성공시 리다이렉트 주소 지정
				} else { 
					message = "비밀번호가 틀립니다";
				}
				
			System.out.println(chk.get("MEMBER_PASSWORD"));
			System.out.println(commandMap.get("MEMBER_PASSWORD"));
			System.out.println(commandMap.getMap());
			mv.addObject("message",message);
			mv.addObject("message2",message2);
			mv.addObject("url",url); 
			 
			return mv;
	  
		}
		  
		  @RequestMapping(value="/myPage/likeList.do")
			public ModelAndView LikeList(CommandMap commandMap,HttpServletRequest request) throws Exception {
				ModelAndView mv = new ModelAndView(".myPageTiles/mypage/likeList");
				HttpSession session = request.getSession(); 
				commandMap.put("MEMBER_ID",session.getAttribute("session_MEMBER_ID"));
				List<Map<String,Object>> list = myPageService.selectLikeList(commandMap.getMap());
			  	mv.addObject("list", list);
				
				 
		
		    	return mv;
			}
		  
		  @ResponseBody	
		  @RequestMapping(value = "/myPage/addBasket.do", method = RequestMethod.POST) 
		  public int addBasket(CommandMap commandMap, @RequestParam(value = "chbox[]") List<String> chArr,HttpServletRequest request) throws Exception { 
			  
			  int likeNum = 0;
			  int result = 0;
				
				if(chArr != null) {
				for(String i : chArr) {
					likeNum = Integer.parseInt(i);		  		
					  myPageService.addBasket(likeNum);
					  
					  commandMap.put("LIKE_IDX",likeNum);
					  myPageService.likeDelete(commandMap.getMap());
			  	}
				result = 1;
				}
			    
			  return result; 
			  }
		  
		  
		  @RequestMapping(value = "/myPage/likeDelete.do") 
		  public ModelAndView likeDelete(CommandMap commandMap) throws Exception { 
			  ModelAndView mv = new ModelAndView("redirect:/myPage/likeList.do");
			  
			  myPageService.likeDelete(commandMap.getMap());
			  
			  return mv; 
			  }

		  
		  @RequestMapping(value = "/myPage/likeClear.do") 
		  public @ResponseBody ModelAndView likeClear(CommandMap commandMap,HttpServletRequest request) throws Exception { 
		  ModelAndView mv = new ModelAndView("redirect:/myPage/likeList.do");
		  HttpSession session = request.getSession(); 
		  commandMap.put("MEMBER_ID",session.getAttribute("session_MEMBER_ID"));
		  myPageService.likeClear(commandMap.getMap());
		  
		  
		  return mv; 
	  }
		  
		 
		  @RequestMapping(value="/myPage/basketList.do")
			public ModelAndView basketList(CommandMap commandMap, HttpServletRequest request) throws Exception {
				ModelAndView mv = new ModelAndView(".myPageTiles/mypage/basketList");
				HttpSession session = request.getSession(); 
				commandMap.put("MEMBER_ID",session.getAttribute("session_MEMBER_ID"));
				List<Map<String,Object>> list = myPageService.selectBasketList(commandMap.getMap());
				Map<String,Object> map = myPageService.selectAccountInfo(commandMap.getMap());
				
			  	mv.addObject("list", list);
				mv.addObject("map",map);

		    	return mv;
			}
		  
		  @ResponseBody	
		  @RequestMapping(value = "/myPage/basketModify.do") 
		  public ModelAndView basketModify(CommandMap commandMap) throws Exception { 
			  ModelAndView mv = new ModelAndView("redirect:/myPage/basketList.do");
			  System.out.println(commandMap.getMap()+"@@");
			  myPageService.basketModify(commandMap.getMap());
			  
			  return mv; 
			  }
	  
		  @ResponseBody	
		  @RequestMapping(value = "/myPage/basketDelete.do", method = RequestMethod.POST) 
		  public int basketDelete(@RequestParam(value = "chbox[]") List<String> chArr) throws Exception { 
			  
			  int cartNum = 0;
			  int result = 0;
				
				if(chArr != null) {
				for(String i : chArr) {
			  		cartNum = Integer.parseInt(i);		  		
					  myPageService.basketDelete(cartNum);
			  	}
				result = 1;
				}		  
			  return result; 
			  }
		  
		  
			 
		  
		  @RequestMapping(value = "/myPage/basketClear.do") 
		  public ModelAndView basketClear(CommandMap commandMap,HttpServletRequest request) throws Exception { 
		  ModelAndView mv = new ModelAndView("redirect:/myPage/basketList.do");
		  HttpSession session = request.getSession(); 
		  commandMap.put("MEMBER_ID",session.getAttribute("session_MEMBER_ID"));
		  myPageService.basketClear(commandMap.getMap());
		  
		  
		  return mv; 
	  }
		  
		  
		  @RequestMapping(value="/myPage/myOrderList.do")
			public ModelAndView myOrderList(CommandMap commandMap,HttpServletRequest request) throws Exception {
				ModelAndView mv = new ModelAndView(".myPageTiles/mypage/myOrderList");
				
		    	return mv;
			}
		  
		  @RequestMapping(value="/myPage/selectMyOrdertList.do")
		  public ModelAndView selectMyOrdertList(CommandMap commandMap, HttpServletRequest request) throws Exception{
		  	ModelAndView mv = new ModelAndView("jsonView");
		  	
		  	HttpSession session = request.getSession(); 
			commandMap.put("MEMBER_ID",session.getAttribute("session_MEMBER_ID"));
		  	List<Map<String,Object>> list = myPageService.selectMyOrdertList(commandMap.getMap());
		  	mv.addObject("list", list);
		  	if(list.size() > 0){
		  		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		  	}
		  	else{
		  		mv.addObject("TOTAL", 0);
		  	}
		  	
		  	return mv;
		  }
		  
			
		  
		  @RequestMapping(value="/myPage/myOrderDetail.do")
		  public ModelAndView selectMyOrdertDetail(CommandMap commandMap, HttpServletRequest request) throws Exception{
		  	ModelAndView mv = new ModelAndView(".myPageTiles/mypage/myOrderDetail");
		  	
		  	List<Map<String,Object>> list = myPageService.selectMyOrderDetail(commandMap.getMap());
		  	mv.addObject("list", list);
		  
		  	
		  	return mv;
		  }
		  
		  @RequestMapping(value="/myPage/cancelOrder.do")
		  public ModelAndView cancelOrder(CommandMap commandMap, HttpServletRequest request ) throws Exception{
			  	ModelAndView mv = new ModelAndView("redirect:/myPage/myOrderDetail.do");
			  	System.out.println("테스트2"+commandMap.get("ORDER_IDX"));
			  	
			  	myPageService.cancelOrder(commandMap.getMap());
			  	mv.addObject("ORDER_IDX", commandMap.get("ORDER_IDX"));
			  	
			  	return mv;
			  }
		  
		
		  
}
		  

