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
		<table class="table table-hover">
			<colgroup>
				<col width="15%"/>
				<col width="35%"/>
				<col width="15%"/>
				<col width="35%"/>
			</colgroup>
			<tbody>
				<tr>
					
					<td>
						질문 :  ${map.FAQ_QUESTION }
						
						<input type="hidden" id="FAQ_IDX" name="FAQ_IDX" value="${map.FAQ_IDX }">
					</td>
					
				</tr>
				
				<tr>
					<td colspan="4" class="view_text">
						답변 : ${map.FAQ_ANSWER }
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	

	<a href="#this" class="btn" id="list">목록으로</a>
	
	<!-- 관리자용
	<a href="#this" class="btn" id="update">저장하기</a>
	<a href="#this" class="btn" id="delete">삭제하기</a>
	 -->
	 
	 
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
			comSubmit.setUrl("<c:url value='/board/faqList.do?faq_category=1' />");
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