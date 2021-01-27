package first.member.service;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import first.member.dao.MemberDAO;

@Service("memberService")
public class MemberServiceImpl implements MemberService{
	Logger log = Logger.getLogger(this.getClass());
	
	
	@Resource(name="memberDAO")
	private MemberDAO memberDAO;
	
	
	@Override
	public void join(Map<String, Object> map) throws Exception {
		memberDAO.join(map);

	}


	@Override
	public Map<String, Object> loginCheck(Map<String, Object> map) throws Exception {
		
		return memberDAO.selectId(map);
	}


	@Override
	public void check_id(String id, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		out.println(memberDAO.check_id(id));
		out.close();
		
	}


	@Override
	public void check_email(String email, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		out.println(memberDAO.check_email(email));
		out.close();
	}

	
	
	//인증키 랜덤 8자리 생성
	@Override
	public String create_key() throws Exception {
		String key = "";
		Random rd = new Random();

		for (int i = 0; i < 8; i++) {
			key += rd.nextInt(10);
		}
		return key;
	}


	
	
	/* 네이버로그인후 SMTP 설정후
	 * 다시돌아와서
	 * hostSMTPid : 네이버아이디 입력
	 * hostSMTPpwd : 네이버비밀번호 입력
	 * fromEmail : 작성
	 * 
	 * */
	@Override
	public void send_mail(Map<String, Object> map) throws Exception {
		// Mail Server 설정
			String charSet = "utf-8";
			String hostSMTP = "smtp.naver.com";
			String hostSMTPid = "ejrtkd12345";
			String hostSMTPpwd = "dlwps123";
				// 보내는 사람 EMail, 제목, 내용
			String fromEmail = "ejrtkd12345@naver.com";
			String fromName = "Spring Homepage";
			String subject = "";
			String msg = "";
				// 회원가입 메일 내용
			subject = "Spring Homepage 회원가입 인증 메일입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += map.get("member_id") + "님 회원가입을 환영합니다.</h3>";
			msg += "<div style='font-size: 130%'>";
			msg += "하단의 인증 버튼 클릭 시 정상적으로 회원가입이 완료됩니다.</div><br/>";
			msg += "<form method='post' action='http://localhost:8080/first/member/approval_member.do'>";
			msg += "<input type='hidden' name='member_email' id='member_email' value='" + map.get("member_email") + "'>";
			msg += "<input type='hidden' name='MEMBER_VERIFY_KEY' id='MEMBER_VERIFY_KEY' value='" + map.get("MEMBER_VERIFY_KEY") + "'>";
			msg += "<input type='submit' value='인증'></form><br/></div>";

			// 받는 사람 E-Mail 주소
			String mail = (String) map.get("member_email");
			try {
				HtmlEmail email = new HtmlEmail();
				email.setDebug(true);
				email.setCharset(charSet);
				email.setSSL(true);
				email.setHostName(hostSMTP);
				email.setSmtpPort(465);
				email.setAuthentication(hostSMTPid, hostSMTPpwd);
				email.setTLS(true);
				email.addTo(mail, charSet);
				email.setFrom(fromEmail, fromName, charSet);
				email.setSubject(subject);
				email.setHtmlMsg(msg);
				email.send();
			} catch (Exception e) {
				System.out.println("메일발송 실패 : " + e);
			}
		
	}
	
	@Override
	public void send_mail2(Map<String, Object> map) throws Exception {
		// Mail Server 설정
			String charSet = "utf-8";
			String hostSMTP = "smtp.naver.com";
			String hostSMTPid = "ejrtkd12345";
			String hostSMTPpwd = "dlwps123";
				// 보내는 사람 EMail, 제목, 내용
			String fromEmail = "ejrtkd12345@naver.com";
			String fromName = "Spring Homepage";
			String subject = "";
			String msg = "";
				// 회원가입 메일 내용
			subject = "Spring Homepage 비밀번호찾기 메일입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += map.get("MEMBER_ID") + "님의 비밀번호는" +  map.get("MEMBER_PASSWORD") + "입니다.</h3>";
			msg += "<div style='font-size: 130%'>";
			msg += "비밀번호 찾기 서비스를 이용해 주셔서 감사합니다.</div><br/>";
			msg += "<br/></div>";

			// 받는 사람 E-Mail 주소
			String mail = (String) map.get("MEMBER_EMAIL");
			try {
				HtmlEmail email = new HtmlEmail();
				email.setDebug(true);
				email.setCharset(charSet);
				email.setSSL(true);
				email.setHostName(hostSMTP);
				email.setSmtpPort(465);
				email.setAuthentication(hostSMTPid, hostSMTPpwd);
				email.setTLS(true);
				email.addTo(mail, charSet);
				email.setFrom(fromEmail, fromName, charSet);
				email.setSubject(subject);
				email.setHtmlMsg(msg);
				email.send();
			} catch (Exception e) {
				System.out.println("메일발송 실패 : " + e);
			}
		
	}

	// 회원 인증
		@Override
		public void approval_member(Map<String, Object> map, HttpServletResponse response) throws Exception {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			if (memberDAO.approval_member(map) == 0) { // 이메일 인증에 실패하였을 경우
				out.println("<script>");
				out.println("alert('잘못된 접근입니다.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
			} else { // 이메일 인증을 성공하였을 경우
				out.println("<script>");
				out.println("alert('인증이 완료되었습니다. 로그인 후 이용하세요.');");
				out.println("location.href='../index.jsp';");
				out.println("</script>");
				out.close();
			}
		}


		
		
		@Override
		public Map<String,Object> findId(Map<String, Object> map) throws Exception {
						
			Map<String, Object> findid = memberDAO.findId(map);
			return findid;
		}


		@Override
		public Map<String, Object> findPw(Map<String, Object> map) throws Exception {
			
			Map<String, Object> findpw = memberDAO.findPw(map);
			return findpw;
		}

	

}
