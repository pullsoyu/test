<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
	<form id="frm">
		<table class="table table-hover">
			<colgroup>
				<col width="15%">
				<col width="*"/>
			</colgroup>
			
			<tbody>
				<tr>
					<th>질문내용</th>
				</tr>
				
				<tr>
					
					<td>
						<select  name="FAQ_CATEGORY" id="FAQ_CATEGORY">
							<option value="1">배송문의</option>
							<option value="2">취소/교환/반품</option>
							<option value="3">환불관련</option>
							<option value="4">주문/결재</option>
							<option value="5">쿠폰/포인트</option>
							<option value="6">회원관련</option>
							<option value="7">기타</option>
						</select> 
						<input type="text" id="FAQ_QUESTION" name="FAQ_QUESTION" class="form-control col-sm-8" placeholder="Text input"></input>
					</td>
				
				
				</tr>
				<tr>
					<td colspan="2" class="view_text">
						<textarea class="form-control col-sm-8" rows="8" cols="100" title="내용" id="FAQ_ANSWER" name="FAQ_ANSWER"></textarea>
					</td>
				</tr>
			</tbody>
		</table>
		
		<a href="#this" class="btn btn-primary" id="write" >작성하기</a>
		<a href="#this" class="btn btn-primary" id="list" >목록으로</a>
	</form>
	
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#list").on("click", function(e){ //목록으로 버튼
				e.preventDefault();
				fn_openFaqList();
			});
			
			$("#write").on("click", function(e){ //작성하기 버튼
				e.preventDefault();
				fn_faqWrite();
			});
		});

		function fn_openFaqList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/faqList.do?faq_category=1' />");
			comSubmit.submit();
		}
		
		function fn_faqWrite(){
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/admin/faqWrite.do' />");
			comSubmit.submit();
		}



		
	</script>
</body>
</html>