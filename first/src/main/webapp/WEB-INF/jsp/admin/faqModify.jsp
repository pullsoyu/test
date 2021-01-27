<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
	<form id="frm" name="frm">
		<table class="board_view">
			<colgroup>
				<col width="15%"/>
				<col width="35%"/>
				<col width="15%"/>
				<col width="35%"/>
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">FAQ_IDX</th>
					<td>
						${map.FAQ_IDX }
						<input type="hidden" id="FAQ_IDX" name="FAQ_IDX" value="${map.FAQ_IDX }">
					</td>
					
					<td>
					
						<input type="text" id="FAQ_QUESTION" name="FAQ_QUESTION" class="wdp_90" value="${map.FAQ_QUESTION }"></input>
						
						<select  name="FAQ_CATEGORY" id="FAQ_CATEGORY">
							<option value="1">배송문의</option>
							<option value="2">취소/교환/반품</option>
							<option value="3">환불관련</option>
							<option value="4">주문/결재</option>
							<option value="5">쿠폰/포인트</option>
							<option value="6">회원관련</option>
							<option value="7">기타</option>
						</select> 
					</td>
				</tr>
				
				<tr>
					<td colspan="4" class="view_text">
						<textarea rows="20" cols="100" title="내용" id="FAQ_ANSWER" name="FAQ_ANSWER">${map.FAQ_ANSWER }</textarea>
						
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	

	<a href="#this" class="btn" id="list">목록으로</a>
	<a href="#this" class="btn" id="update">저장하기</a>
	<a href="#this" class="btn" id="delete">삭제하기</a>
	
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
		
		$(document).ready(function(){
			$("#list").on("click", function(e){ //목록으로 버튼
				e.preventDefault();
				fn_faqList();
			});
			
			$("#update").on("click", function(e){ //저장하기 버튼
				e.preventDefault();
				fn_updateBoard();
			});
			
			$("#delete").on("click", function(e){ //삭제하기 버튼
				e.preventDefault();
				fn_deleteBoard();
			});
			
			
		
		});
		
		function fn_faqList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/faqList.do?faq_category=1' />");
			comSubmit.submit();
		}
		
		function fn_updateBoard(){
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/admin/faqModify.do' />");
			comSubmit.submit();
		}
		
		function fn_deleteBoard(){
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/admin/faqDelete.do' />");
			//comSubmit.addParam("FAQ_IDX", $("#FAQ_IDX").val());
			comSubmit.submit();
			
		}
		
	
	</script>
</body>
</html>