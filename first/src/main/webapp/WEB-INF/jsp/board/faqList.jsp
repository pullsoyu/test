<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>FAQ</title>

<%@ include file="/WEB-INF/include/include-header.jspf" %>




</head>
<body>




<div id="con_lf" class="container">
	<h2 class="pg_tit">
		<span>자주묻는 질문</span>
	</h2>
	
	<nav class="navbar  navbar-expand-sm  bg-light">
		<ul class="navbar-nav" id="tab_cate_ul">

			<li class="nav-item"><a class="nav-link" href="faqList.do?faq_category=1">배송문의</a></li>
			<li class="nav-item"><a class="nav-link" href="faqList.do?faq_category=2">취소/교환/반품</a></li>
			<li class="nav-item"><a class="nav-link" href="faqList.do?faq_category=3">환불관련</a></li>
			<li class="nav-item"><a class="nav-link" href="faqList.do?faq_category=4">주문/결제</a></li>
			<li class="nav-item"><a class="nav-link" href="faqList.do?faq_category=5">쿠폰/포인트</a></li>
			<li class="nav-item"><a class="nav-link" href="faqList.do?faq_category=6">회원관련</a></li>
			<li class="nav-item"><a class="nav-link" href="faqList.do?faq_category=7">기타</a></li>
		</ul>
	</nav>
	<table class="table table-hover">
		<tbody>
			<c:choose>
				<c:when test="${fn:length(faqlist) > 0}">
					<c:forEach items="${faqlist }" var="row">
						<tr>
							<td>${row.FAQ_IDX}</td>
							<td>
								${row.FAQ_QUESTION }
								<%-- 
								<a href="#this" name="FAQ_QUESTION">${row.FAQ_QUESTION }</a> 
								--%>
								<input type="hidden" id="IDX" value="${row.FAQ_IDX }">
							</td>
							<td>${row.FAQ_ANSWER}</td>

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

	<!-- 관리자용
	<a class="btn btn-primary" id="faqWriteForm" href="#this">Write</a>
	 -->
	
</div>

<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
		$(document).ready(function(){

			$("a[name='FAQ_QUESTION']").on("click", function(e){ //상품상세보기
				e.preventDefault();
				fn_faqModifyForm($(this));
			});
			

			$("#faqWriteForm").on("click", function(e){ //상품등록
				e.preventDefault();
				fn_faqWriteForm($(this));
			});

		});


		function fn_faqModifyForm(obj){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/faqModifyForm.do' />");
			comSubmit.addParam("FAQ_IDX", obj.parent().find("#IDX").val());
			comSubmit.submit();
		}
		
		function fn_faqWriteForm(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/faqWriteForm.do' />");
			comSubmit.submit();
		}

		</script>

</body>
</html>