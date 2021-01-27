<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
</head>
<body>
	<form id="frm" name="frm" enctype="multipart/form-data">
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
						<td>${map.QNA_IDX } 
						<input type="hidden" id="QNA_IDX" name="QNA_IDX" value="${map.QNA_IDX }">
						</td>

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
						<td colspan="3">
							<input type="text" id="REPLY_TITLE" name="REPLY_TITLE" class="form-control" placeholder="Text input" value="${map.REPLY_TITLE }" >
						</td>
					</tr>

					<tr>
						<th scope="row">REPLY_CONTENT</th>
						<td colspan="4" class="view_text"><textarea rows="20"
								cols="100" title="내용" id="REPLY_CONTENT" name="REPLY_CONTENT">${map.REPLY_CONTENT }</textarea>
						</td>
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
			</div>
	</form>

	<a href="#this" class="btn btn-primary" id="qnalist">QnA목록으로</a>
	<a href="#this" class="btn btn-primary" id="update">답변달기</a>
	<a href="#this" class="btn btn-primary" id="delete">삭제하기</a>


	

	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#qnalist").on("click", function(e) { //관리자모드로가기 버튼
				e.preventDefault();
				fn_qnalist();
			});

			$("#update").on("click", function(e) { //저장하기 버튼
				e.preventDefault();
				fn_updateQna();
			});

			$("#delete").on("click", function(e) { //삭제하기 버튼
				e.preventDefault();
				fn_deleteQna();
			});
		});

		function fn_qnalist() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/qnaList.do' />");
			comSubmit.submit();
		}

		function fn_updateQna() {
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/admin/qnaModify.do' />");
			comSubmit.submit();
		}

		function fn_deleteQna() {
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/admin/qnaDelete.do' />");
			//comSubmit.addParam("FAQ_IDX", $("#FAQ_IDX").val());
			comSubmit.submit();

		}
	</script>

</body>
</html>



