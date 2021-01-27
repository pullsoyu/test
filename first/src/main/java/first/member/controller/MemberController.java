package first.member.controller;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import first.common.common.CommandMap;
import first.member.service.MemberService;
import first.sample.service.SampleService;

@Controller
public class MemberController {
	Logger log = Logger.getLogger(this.getClass());

	
	@Resource(name="memberService")
	private MemberService memberService;
	
	@RequestMapping(value="/member/loginForm.do") //로그인 폼
	public ModelAndView openLoginForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/member/loginForm");
		
		return mv;
	}
	
	

	
		
	@RequestMapping(value="/member/loginOut.do") //로그인 폼
	public ModelAndView loginOut(CommandMap commandMap, HttpServletRequest request) throws Exception{
		
		request.getSession().removeAttribute("session_MEMBER_ID");
		ModelAndView mv = new ModelAndView("/member/loginForm");
		
		return mv;
	}
	
	
	
	@RequestMapping(value="/member/joinForm.do") //회원가입 폼
	public ModelAndView openJoinForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/member/joinForm");
		
		return mv;
	}
	
	@RequestMapping(value="/member/join.do") //회원가입하기
	public ModelAndView join(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/member/loginForm.do");
		//인증키생성
		commandMap.put("MEMBER_VERIFY_KEY", memberService.create_key());
		//회원가입
		memberService.join(commandMap.getMap());
		//인증메일발송
		memberService.send_mail(commandMap.getMap());
		
		return mv;
	}
	
	@RequestMapping(value = "/member/login.do") // 로그인
	public ModelAndView login(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/member/login");
		String message = "";
		String url = "";

		HttpSession session = request.getSession();

		
		Map<String, Object> chk = memberService.loginCheck(commandMap.getMap());
		//Map<String, Object> banChk = adminBanService.banDateCheck(commandMap.getMap());
		if (chk==null) { // 아이디가 있는지 없는지를 확인
			message = "해당 아이디가 존재하지 않습니다.";
		} else {
			if (chk.get("MEMBER_PASSWORD").equals(commandMap.get("MEMBER_PASSWORD"))) {
				session.setAttribute("session_MEMBER_ID", commandMap.get("MEMBER_ID"));
				session.setAttribute("session_MEMBER_INFO", chk);
				System.out.println("@@@@@"+session.getAttribute("session_MEMBER_INFO"));
				mv.setViewName("redirect:/main/openBoardList.do");//로그인 성공시 리다이렉트 주소 지정
			} else { // 비밀번호가 일치하지 않을 때
				message = "비밀번호가 맞지 않습니다.";
			}
		}
		System.out.println(chk);
		mv.addObject("message",message);
		mv.addObject("url",url); 
		 
		return mv;
	}
	
	// 아이디 중복 검사(AJAX)
	@RequestMapping(value = "/member/check_id.do", method = RequestMethod.POST)
	public void check_id(@RequestParam("id") String id, HttpServletResponse response) throws Exception{
		memberService.check_id(id, response);
	}
		
	// 이메일 중복 검사(AJAX)
	@RequestMapping(value = "/member/check_email.do", method = RequestMethod.POST)
	public void check_email(@RequestParam("email") String email, HttpServletResponse response) throws Exception{
		memberService.check_email(email, response);
	}
	
	// 회원 인증
	@RequestMapping(value = "/member/approval_member.do", method = RequestMethod.POST)
	public void approval_member(CommandMap commandMap, HttpServletResponse response) throws Exception{
		
		memberService.approval_member(commandMap.getMap(), response);
	}
	
	
	/*
	@RequestMapping(value = "/member/findingId.do")
	public void findMemberId(CommandMap commandMap, HttpServletRequest request) throws Exception{
		
		
		System.out.println("아이디찾키컨트롤러리소스체크 : " + commandMap.getMap());
		memberService.findMemberId(commandMap.getMap());
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
	
	
	*/
	
	
	// 아이디 찾기 (AJAX)
	@RequestMapping(value = "/member/findingId.do" , method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public @ResponseBody Map<String,Object> findingId(CommandMap commandMap, HttpServletResponse response)throws Exception {

		System.out.println("아이디찾기테스트" + commandMap.getMap().toString());

		Map<String,Object> MEMBER_ID = memberService.findId(commandMap.getMap());

		System.out.println(MEMBER_ID);

		return MEMBER_ID;
	}
	
	
	// 비밀번호 찾기 (AJAX)
		@RequestMapping(value = "/member/findingPw.do" , method = RequestMethod.POST, produces = "application/json; charset=utf-8")
		public @ResponseBody Map<String,Object> findingPw(CommandMap commandMap, HttpServletResponse response)throws Exception {

			System.out.println("비번찾기테스트" + commandMap.getMap().toString());

			Map<String,Object> MEMBER_PW = memberService.findPw(commandMap.getMap());
			//비밀번호메일발송
			
			commandMap.put("MEMBER_PASSWORD", MEMBER_PW.get("MEMBER_PASSWORD"));
			
			memberService.send_mail2(commandMap.getMap());
			System.out.println(MEMBER_PW);

			return MEMBER_PW;
		}
	
	
	
	
}
