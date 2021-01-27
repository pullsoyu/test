<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
	
	<form id="frm" name="frm" enctype="multipart/form-data">
		<table class="board_list">
			<colgroup>
				<col width="15%">
				<col width="*"/>
			</colgroup>
			
			<tbody>
				<tr>
					<th scope="row">아이디</th>
					<td><input type="text" id="MEMBER_ID" name="MEMBER_ID" class="wdp_90"></input></td>
				</tr>
				
				<tr>
					<th scope="row">비밀번호</th>
					<td><input type="text" id="MEMBER_PASSWORD" name="MEMBER_PASSWORD" class="wdp_90"></input></td>
				</tr>

			</tbody>
		</table>
		
		
		<br/><br/>
		
		<a href="#this" class="btn btn-dark btn-sm btn-block my-1" id="joinForm">회원가입으로</a>
		<a href="#this" class="btn btn-dark btn-sm btn-block" id="login">로그인하기</a>
		<a href="#this" class="btn" id="admin">관리자모드로가기(사실회원목록)</a>
		
		
	</form>


<%@ include file="/WEB-INF/include/include-body.jspf" %>

<script type="text/javascript">
$(document).ready(function(){
	$("#joinForm").on("click", function(e){ //회원가입으로 버튼
		e.preventDefault();
		fn_openJoinForm();
	});
	
	$("#login").on("click", function(e){ //로그인하기 버튼
		e.preventDefault();
		fn_login();
	});

	$("#admin").on("click", function(e){ //관리자모드로가기 버튼
		e.preventDefault();
		fn_gotoAdmin();
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

</body>
</html>