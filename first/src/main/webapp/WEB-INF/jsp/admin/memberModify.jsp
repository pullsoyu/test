<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
	<form id="mem" name="mem">
		<table class="board_view table table-hover">
			<colgroup>
				<col width="15%"/>
				<col width="35%"/>
				<col width="15%"/>
				<col width="35%"/>
			</colgroup>
			<caption>회원 수정하기</caption>
			<tbody>
				<tr>
					<th scope="row">IDX</th>
					<td>${map.MEMBER_IDX }</td>
					<th scope="row">아이디</th>
					<td>${map.MEMBER_ID }</td>
					
				</tr>
				<tr>
					<th scope="row">비밀번호</th>
					<td>
						<input type="text" id="member_password" name="member_password" class="wdp_90 form-control" value="${map.MEMBER_PASSWORD }"/>
					</td>
					<th scope="row">이름</th>
					<td>
						<input type="text" id="member_name" name="member_name" class="wdp_90 form-control" value="${map.MEMBER_NAME }"/>
					</td>
				</tr>
				
				<tr>
					<th scope="row">연락처</th>
					<td>
						<input type="text" id="member_phone" name="member_phone" class="wdp_90 form-control" value="${map.MEMBER_PHONE }"/>
					</td>
					
					<th scope="row">이메일</th>
					<td>
						<input type="text" id="member_email" name="member_email" class="wdp_90 form-control" value="${map.MEMBER_EMAIL }"/>
					</td>
					
				</tr>
				<tr>
					<th scope="row">등록일</th>
					<td colspan="3">${map.MEMBER_REGISTDATE }</td>
				</tr>
				<tr>
					<th scope="row">주소</th>
					<td>
						<input type="text" id="member_address1" name="member_address1" class="wdp_90 form-control" value="${map.MEMBER_ADDRESS1 }"/>
						<input type="text" id="member_address2" name="member_address2" class="wdp_90 form-control" value="${map.MEMBER_ADDRESS2 }"/>
					</td>
				</tr>
				<tr>
					<th scope="row">우편번호</th>
					<td>
						<input type="text" id="member_zipcode" name="member_zipcode" class="wdp_90 form-control" value="${map.MEMBER_ZIPCODE }"/>
					</td>
					<th scope="row">포인트</th>
					<td>
						<input type="text" id="member_point" name="member_point" class="wdp_90 form-control" value="${map.MEMBER_POINT }"/>
					</td>
				</tr>
				<tr>
					<th scope="row">탈퇴여부</th>
					<td>
						<input type="text" id="member_delGB" name="member_delGB" class="wdp_90 form-control" value="${map.MEMBER_DELGB }"/>
					</td>
					<th scope="row">탈퇴날짜</th>
					<td>${map.MEMBER_DELDATE }</td>
				</tr>
				
			</tbody>
		</table>
	</form>
	<a href="#this" class="btn btn-primary" id="admin">회원목록으로</a>
	<a href="#this" class="btn btn-primary" id="modify">저장하기</a>
	
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#admin").on("click", function(e){ //관리자모드로가기 버튼
				e.preventDefault();
				fn_gotoAdmin();
			});
			
			$("#modify").on("click", function(e){
				e.preventDefault();
				fn_modifyMember();
			});
		});
		
		function fn_gotoAdmin(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/memberList.do' />");
			comSubmit.submit();
		}
		
		function fn_modifyMember(){
			var idx = "${map.MEMBER_IDX}";
			var comSubmit = new ComSubmit("mem");
			comSubmit.setUrl("<c:url value='/admin/memberModify.do' />");
			comSubmit.addParam("MEMBER_IDX", idx);
			comSubmit.submit();
		}
	</script>
</body>
</html>



