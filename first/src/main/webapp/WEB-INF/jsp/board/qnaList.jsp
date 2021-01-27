<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>


<div id="con_lf" class="container">
	<h2 class="pg_tit">
		<span>QnA게시판목록</span>
	</h2>
	
	
	<table class="table table-hover">
		<tbody>
			<thead>
				<tr>
					<th>번호</th>
					<th>분류</th>
					<th>제목</th>
					<th>아이디</th>
					<th>날짜</th>
					<th>답변상태</th>
				</tr>
			</thead>
			
			<c:choose>
				<c:when test="${fn:length(qnalist) > 0}">
					<c:forEach items="${qnalist }" var="row">
						<tr>
							<td>${row.QNA_IDX}</td>
							<td>${row.QNA_CATEGORY}</td>
							<td>
								<a href="#this" name="QNA_TITLE">${row.QNA_TITLE }</a>
								<input type="hidden" id="IDX" value="${row.QNA_IDX }">
							</td>
							<td>${row.MEMBER_ID}</td>
							<td>${row.QNA_REGDATE}</td>
							<td>${row.REPLY_STATE}</td>

						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="4">조회된 결과가 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>

	<a class="btn btn-primary" id="qnaWriteForm" href="#this">Write</a>
	
	
</div>

<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
		$(document).ready(function(){

			$("a[name='QNA_TITLE']").on("click", function(e){ //상품상세보기
				e.preventDefault();
				fn_qnaDetail($(this));
			});
			
			$("#qnaWriteForm").on("click", function(e){ //상품등록
				e.preventDefault();
				fn_qnaWriteForm($(this));
			});
			
		});


		function fn_qnaDetail(obj){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/qnaDetail.do' />");
			comSubmit.addParam("QNA_IDX", obj.parent().find("#IDX").val());
			comSubmit.submit();
		}
		
		function fn_qnaWriteForm(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/qnaWriteForm.do' />");
			comSubmit.submit();
		}

	</script>



</body>
</html>


						