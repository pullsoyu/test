<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
<div id="con_lf" class="container">

	<form id="mem" name="mem" enctype="multipart/form-data">
		<table  class="table table-hover">
			<colgroup>
				<col width="15%"/>
				<col width="35%"/>
				<col width="15%"/>
				<col width="35%"/>
			</colgroup>
			
			<h2 class="pg_tit">
				<span>회원 삭제</span>
			</h2>
			
			<tbody>
				<tr>
					<th scope="row">아이디</th>
					<td>${map.MEMBER_ID }</td>
				</tr>
				<tr>
				<th scope="row">연락처</th>
				<td>${map.MEMBER_PHONE }</td>
				</tr>
				<tr>
					<th scope="row">이메일</th>
					<td>${map.MEMBER_EMAIL }</td>
				</tr>
				<tr>
					<th scope="row">포인트</th>
					<td>${map.MEMBER_POINT }</td>
					
				</tr>
				<tr>
					<th scope="row">비밀번호</th>
					<td>
						<input type="password" id="MEMBER_PASSWORD" name="MEMBER_PASSWORD"  class="wdp_90" />
						
					</td>
				</tr>
				
			</tbody>
		</table>
		
	<a href="#this" class='btn btn-info' id="delete">삭제하기</a>
	<a href="#this" class='btn btn-info' id="admin">취소하기</a>
	
	</form>
	</div>
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#admin").on("click", function(e){ //관리자모드로가기 버튼
				e.preventDefault();
				fn_gotoAccount();
			});
			
			$("#delete").on("click", function(e){
				e.preventDefault();
				fn_deleteAccount();
			});
		});
		
		function fn_gotoAccount(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/myPage/myPageMain.do' />");
			comSubmit.submit();
		}
		
		function fn_deleteAccount(){
			
			var comSubmit = new ComSubmit("mem");
			comSubmit.setUrl("<c:url value='/myPage/accountDelete.do' />");
			
			comSubmit.submit();
		}

		
	</script>
</body>
</html>



