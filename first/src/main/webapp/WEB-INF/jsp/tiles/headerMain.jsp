<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">

<div class="top_menu">
	<div class="Header">

		<div class="title" align="right">
			

			<c:if test="${session_MEMBER_ID == null }">
				<a href="${path}/first/member/loginForm.do">로그인</a> |
		<a href="${path}/first/member/joinForm.do">회원가입</a> |
	</c:if>
			<c:if test="${session_MEMBER_ID != null }">
				<span>${session_MEMBER_ID}&nbsp;님</span>|
		<a href="${path}/first/member/loginOut.do">로그아웃</a> |
 	</c:if>
			<a href="${path}/first/myPage/myPageMain.do">마이페이지</a> | <a
				href="${path}/first/board/openNoticeBoardList.do">공지사항</a> | <a
				href="${path}/first/board/openEventBoardList.do">이벤트</a> | <a
				href="${path}/first/board/photoList.do">포토갤러리</a> | <a
				href="${path}/first/board/reviewList.do">상품평</a> |<a
				href="${path}/first/board/qnaList.do">QNA</a> |<a
				href="${path}/first/board/faqList.do?faq_category=1">FAQ</a> |<a
				href="${path}/first/myPage/myOrderList.do">주문/배송조회</a> 
		</div>
		
<div id="con_lf" class="container">
	<div align="center">
	<a href="/first/main/openBoardList.do"><img src="/first/resources/CKimg/pullsoyu.png" alt=""  /></a> 
	</div> 
	
 		


		<!-- 통합검색 -->
		<div align="right">
			<form id="frm" class="form-inline">

				<select name="selectSearch" id="selectSearch" class="form-control">
					<option value="GOODS_NAME">상품이름</option>
					<option value="GOODS_COMPANY">제조사</option>
					<option value="GOODS_NAME">원산지</option>
				</select>
				<div>
					<input class="form-control mr-sm-2 search-input" type="search"
						placeholder="Search..." name="SEARCHKEYWORD" id="SEARCHKEYWORD">
					<a href="#this" class="btn btn-outline-secondary btn-sm"
						id="searchList">검색</a>
						
				</div>

			</form>
		</div>
		<hr>
	

</div>
	</div>
</div>
<br/>

<script type="text/javascript">
	$(document).ready(function() {
		$("#searchList").on("click", function(e) { //목록으로 버튼
			e.preventDefault();
			fn_searchList();
		});

	});

	function fn_searchList() {
		var comSubmit = new ComSubmit("frm");
		comSubmit.setUrl("<c:url value='/main/searchList.do' />");
		comSubmit.submit();
	}
</script>