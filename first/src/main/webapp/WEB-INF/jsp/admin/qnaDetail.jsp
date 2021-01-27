<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
</head>
<body>

	<div id="con_lf" class="container">
		<h2 class="pg_tit">
			<span>QnA게시판상세보기</span>
		</h2>


		<table class="table table-hover">
			<colgroup>
				<col width="15%" />
				<col width="35%" />
				<col width="15%" />
				<col width="35%" />
			</colgroup>

			<tbody>
				<tr>
					<th scope="row">QNA_IDX</th>
					<td>${map.QNA_IDX }</td>
					<th scope="row">MEMBER_ID</th>
					<td>${map.MEMBER_ID }</td>

				</tr>
				<tr>
					<th scope="row">QNA_CATEGORY</th>
					<td>${map.QNA_CATEGORY }</td>
					<th scope="row">QNA_TITLE</th>
					<td>${map.QNA_TITLE }</td>
				</tr>

				<tr>
					<th scope="row">QNA_CONTENT</th>
					<td colspan="3">${map.QNA_CONTENT }</td>
				</tr>
				<tr>
					<th scope="row">QNA_REGDATE</th>
					<td colspan="3">${map.QNA_REGDATE }</td>
				</tr>
				<tr>
					<th scope="row">QNA_EMAIL</th>
					<td>${map.QNA_EMAIL }</td>
					<th scope="row">ANSWER_EMAIL</th>
					<td>${map.ANSWER_EMAIL }</td>
				</tr>
				<tr>
					<th scope="row">QNA_PHONE</th>
					<td>${map.QNA_PHONE }</td>
					<th scope="row">ANSWER_PHONE</th>
					<td>${map.ANSWER_PHONE }</td>
				</tr>
				<tr>
					<th scope="row">REPLY_TITLE</th>
					<td colspan="3">${map.REPLY_TITLE }</td>
				</tr>
				
				<tr>
					<th scope="row">REPLY_CONTENT</th>
					<td colspan="3">${map.REPLY_CONTENT }</td>
				</tr>
				
				<tr>
					<th scope="row">REPLY_REGDATE</th>
					<td colspan="3">${map.REPLY_REGDATE }</td>
				</tr>
				<tr>
					<th scope="row">REPLY_STATE</th>
					<td colspan="3">${map.REPLY_STATE}</td>
				</tr>


			</tbody>
		</table>


		<a href="#this" class="btn btn-primary" id="qnalist">QnA목록으로</a> 
		<a href="#this"	class="btn btn-primary" id="qnaModify">답변달기</a>


	</div>

	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#qnalist").on("click", function(e) { //관리자모드로가기 버튼
				e.preventDefault();
				fn_qnalist();
			});

			$("#qnaModify").on("click", function(e) {
				e.preventDefault();
				fn_qnaModify();
			});
		});

		function fn_qnalist() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/qnaList.do' />");
			comSubmit.submit();
		}

		function fn_qnaModify() {//멤버에서 상품으로 바꿔야함
			var idx = "${map.QNA_IDX}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/qnaModifyForm.do' />");
			comSubmit.addParam("QNA_IDX", idx);
			comSubmit.submit();
		}
	</script>
</body>
</html>



