<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>

	<!-- 세션에 정보가 없을 경우에만 로그인 창 보여주기 -->
	<%
		if (session.getAttribute("session_MEMBER_ID") == null) {
	%>

	<div class="container">
		<div class="row">
			<!-- 입력폼 그리드 -->
			<div class="col-lg-4">
				
				<!-- 유튜브동영상 임베디드 링크 -->
				<div class="embed-responsive embed-responsive-21by9">
				<iframe class="embed-responsive-item" width="560" height="315" src="https://www.youtube.com/embed/pBuZEGYXA6E" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
				</div>
			
			
				<form id="frm">
					<!-- ID입력 -->
					<div class="input-group mt-3 mb-1">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1">ID</span>
						</div>
						<input type="text" name="MEMBER_ID" id="MEMBER_ID" class="form-control"
							placeholder="Input ID" aria-label="Input ID"
							aria-describedby="basic-addon1" required>
					</div>
					<!-- PW입력 -->
					<div class="input-group mb-2">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1">PW</span>
						</div>
						<input type="password" name="MEMBER_PASSWORD" id="MEMBER_PASSWORD" class="form-control"
							placeholder="Input Password" aria-label="Input Password"
							aria-describedby="basic-addon1" required>
					</div>
					<!-- 자동 로그인 -->
					<div class="custom-control custom-checkbox mb-1">
						<input type="checkbox" class="custom-control-input"
							name="isAutoLogin" value="true" id="customCheck1"> <label
							class="custom-control-label" for="customCheck1">로그인 유지</label>
					</div>
					
				</form>
		
				<!-- 로그인 버튼 -->
				<a href="#this" class="btn btn-dark btn-sm btn-block" id="login">로그인</a>

				<!-- 회원가입 버튼 -->
				<a href="#this" class="btn btn-dark btn-sm btn-block my-1" id="joinForm">회원가입</a>
				
				<!-- 관리자 버튼 -->
				<a href="#this" class="btn btn-dark btn-sm btn-block" id="admin">관리자로그인</a>
				
				<!-- 아이디찾기 버튼 -->
				<a href="#this" class="btn btn-dark btn-sm btn-block" id="openfindId">아이디찾기</a>
				
				<!-- 비밀번호찾기 버튼 -->
				<a href="#this" class="btn btn-dark btn-sm btn-block" id="openfindPw">비밀번호찾기</a>
				
				
				
				
				<%
					} else {
				%>
				<script type="text/javascript">
					location.href="${path}/first/main/openBoardList.do";
				</script>
				<%
					}
				%>

				<!-- 회원가입 성공, 로그인 실패 등 메세지가 있으면 경고창 출력 -->
				<%
					Object obj = session.getAttribute("loginMsg");
					if (obj != null) {
						String msg = (String) obj;
				%>
				<div class="alert alert-danger text-center" role="alert"><%=msg%></div>
				<%
					// 출력한 메세지는 지워줌
						session.removeAttribute("loginMsg");
					}
				%>
			</div>

			<!-- 그림 넣을 그리드 -->
			<div class="col-lg-8"></div>
		</div>
	</div>

<%@ include file="/WEB-INF/include/include-body.jspf" %>

<script type="text/javascript">

$(document).on('click','#findId',function(){

		
	var name = $('#MEMBER_NAME').val();
 	var email = $('#MEMBER_EMAIL').val();

 	var postData = {'MEMBER_NAME' : name , 'MEMBER_EMAIL' : email};
 	alert(postData.MEMBER_NAME);
 	alert(postData.MEMBER_EMAIL);

 	var comAjax = new ComAjax();
 	comAjax.setUrl("<c:url value='/member/findingId.do' />");
	comAjax.setCallback("fn_findingIdCallback");
	comAjax.addParam("MEMBER_NAME",name);
	comAjax.addParam("MEMBER_EMAIL", email);
	comAjax.ajax();
 	
	 

});



	function fn_findingIdCallback(data){
		alert(data);
		var findMemberId = data.MEMBER_ID;
		$("#findIdList *").remove();
    	if(findMemberId != null)
        {	
			$("#findIdList").append("<h1>"+"회원님의 정보로 등록된 아이디는 : "+findMemberId+" 입니다.</h1>")
        }
    	else
    	{	
			$("#findIdList").append("<h1>"+"회원님의 정보로 등록된 아이디는 없습니다.</h1>")
        }
    }



	$(document).on('click','#findPw',function(){


		$("#findPw").on("click", function(e){ //비번찾기 버튼
			
			
		});
		
		var id2 = $('#MEMBER_ID2').val();
	 	var email2 = $('#MEMBER_EMAIL2').val();

	 	var postData = {'MEMBER_ID2' : id2 , 'MEMBER_EMAIL2' : email2};
	 	
	 	alert(postData.MEMBER_ID2);
	 	alert(postData.MEMBER_EMAIL2);

	 	var comAjax = new ComAjax();
	 	comAjax.setUrl("<c:url value='/member/findingPw.do' />");
		comAjax.setCallback("fn_findingPwCallback");
		comAjax.addParam("MEMBER_ID",id2);
		comAjax.addParam("MEMBER_EMAIL", email2);
		comAjax.ajax();
	 	
		
	});


	function fn_findingPwCallback(data){
		alert(data);
		var findMemberPw = data.MEMBER_PASSWORD;
		$("#findPwList *").remove();
    	if(findMemberPw != null)
        {	
			$("#findPwList").append("<h1>"+"회원님의 비밀번호는 : "+findMemberPw+" 입니다.</h1>")
        }
    	else
    	{	
			$("#findPwList").append("<h1>"+"회원님의 정보로 등록된 아이디는 없습니다.</h1>")
        }
    }
	



$(document).ready(function(){
	$("#login").on("click", function(e){ //로그인하기 버튼
		e.preventDefault();
		fn_login();
	});
	
	$("#joinForm").on("click", function(e){ //회원가입으로 버튼
		e.preventDefault();
		fn_openJoinForm();
	});

	$("#admin").on("click", function(e){ //관리자모드로가기 버튼
		e.preventDefault();
		fn_gotoAdmin();
	});

	$("#openfindId").on("click", function(e){ //아이디찾기활성화
		$("#id_form").removeClass('d-none');
		$("#id_form").fadeIn(200);
	});
	
	$("#openfindPw").on("click", function(e){ //비밀번호찾기활성화
		$("#pwd_form").removeClass('d-none');
		$("#pwd_form").fadeIn(200);
	});

	$("#closefindid").on("click", function(e){ //아이디찾기숨김
		$("#id_form").fadeOut(200);
		
	});
	
	$("#closefindpw").on("click", function(e){ //비밀번호찾기숨김
		$("#pwd_form").fadeOut(200);
		
	});
	
	
});



function fn_openJoinForm(){
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/member/joinForm.do' />");
	comSubmit.submit();
}

function fn_login(){
	var comSubmit = new ComSubmit("frm");
	comSubmit.setUrl("<c:url value='/member/login.do' />");
	comSubmit.submit();
}

function fn_gotoAdmin(){
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/admin/memberList.do' />");
	comSubmit.submit();
}

</script>
	
	<div class="container  ">
	<div class="row">
	<div class="col-lg-4">
	

		<div id="loginer">
		
			
		
		
            <form id = "id_form" class="d-none" method="POST">
                <fieldset>
                    <legend>Find Your ID</legend>
                    이름 : <input type="text" id ="MEMBER_NAME" name ="MEMBER_NAME" placeholder="Enter Your Name">
                    <br>
                    E-mail: <input type="text" id ="MEMBER_EMAIL" name ="MEMBER_EMAIL" placeholder="Enter Your Email">
                    <br><br>
                    <input type="hidden" value="0" name = "check"><!--서버에서 아이디 찾기인지 비번찾기 인지 구별하기 위한 속성-->
                    <input type="button" class="btn btn-dark btn-sm btn-block" value="아이디 찾기!" id="findId">
                    <input type="button" class="btn btn-dark btn-sm btn-block" value="사라져!" id="closefindid">
                    <br>
                    <span id="findIdList"></span>
                </fieldset>
            </form>
            <form id = "pwd_form" action="/test/FindAccount/FindLook" class="d-none" method="POST">
                <fieldset>
                    <legend>Find Your Password</legend>
                    아이디 : <input type="text" id ="MEMBER_ID2" name ="MEMBER_ID2" placeholder="Enter Your ID">
                    <br>
                    E-mail: <input type="text" id ="MEMBER_EMAIL2"  name ="MEMBER_EMAIL2" placeholder="Enter Your Email">
                    <br><br>
                    <input type="hidden" value="1" name = "check">
                    <input type="button" class="btn btn-dark btn-sm btn-block" value="비밀번호 찾기!" id="findPw">
                    <input type="button" class="btn btn-dark btn-sm btn-block" value="사라져!" id="closefindpw">
                    <br>
                    <span id="findPwList"></span>
                </fieldset>
            </form>
        </div>
        
	 
       
		
	</div>
	</div>
	</div>

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>