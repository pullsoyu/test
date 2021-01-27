<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
</head>
<body>
	<form id="qnaform" name="qnaform">
		<table class="table table-hover">
			<colgroup>
				<col width="15%" />
				<col width="35%" />
				<col width="15%" />
				<col width="35%" />
			</colgroup>

			<tbody>
				<tr>
					<th scope="row">MEMBER_ID</th>
					<td>${session_MEMBER_ID }</td>
					<th scope="row">QNA_CATEGORY</th>
					<td>
						<select  name="QNA_CATEGORY" id="QNA_CATEGORY">
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
					<th scope="row">QNA_TITLE</th>
					<td colspan="3">
						<input type="text" id="QNA_TITLE" name="QNA_TITLE" class="form-control" value="${map.QNA_TITLE }"  >
						<input type="hidden" id="QNA_IDX" name="QNA_IDX" value="${map.QNA_IDX }">
						
					</td>
				</tr>

				<tr>
					<th scope="row">QNA_CONTENT</th>
					
					<td colspan="3" class="view_text"><textarea rows="10" class="form-control"
								cols="80" title="내용" id="QNA_CONTENT" name="QNA_CONTENT" >${map.QNA_CONTENT }</textarea>
					</td>
				</tr>
				
				<tr>
					<th scope="row">QNA_EMAIL</th>
					<td>
						<input type="text" id="QNA_EMAIL" name="QNA_EMAIL" class="form-control" value="${map.QNA_EMAIL}"  >
					</td>
					<th scope="row">ANSWER_EMAIL</th>
					<td>
						<label class="radio-inline">
							<input type='radio' id="ANSWER_EMAIL" name='ANSWER_EMAIL' checked="checked" value='Y'>Y
						</label>
						<label class="radio-inline">
							<input type='radio' id="ANSWER_EMAIL" name='ANSWER_EMAIL' value='N'>N
						</label>
					</td>
				</tr>
				<tr>
					<th scope="row">QNA_PHONE</th>
					<td>
						<input type="text" id="QNA_PHONE" name="QNA_PHONE" class="form-control" value="${map.QNA_PHONE}"  >
					</td>
					<th scope="row">ANSWER_PHONE</th>
					<td>
						<label class="radio-inline">
							<input type='radio' id="ANSWER_PHONE" name='ANSWER_PHONE' checked="checked" value='Y'>Y
						</label>
						<label class="radio-inline">
							<input type='radio' id="ANSWER_PHONE" name='ANSWER_PHONE' value='N'>N
						</label>
					</td>
				</tr>
				
			</tbody>
		</table>
	</form>
			<a href="#this" class="btn btn-primary" id="qnalist">QnA목록으로</a>
			<a href="#this" class="btn btn-primary" id="update">수정하기</a>
			<a href="#this" class="btn btn-primary" id="delete">삭제하기</a>

	

	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#qnalist").on("click", function(e) { //관리자모드로가기 버튼
				e.preventDefault();
				fn_qnalist();
			});

			$("#update").on("click", function(e) { //수정하기 버튼
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
			comSubmit.setUrl("<c:url value='/board/qnaList.do' />");
			comSubmit.submit();
		}
		function fn_deleteQna() {
			var comSubmit = new ComSubmit();
			alert(${map.QNA_IDX});
			comSubmit.addParam("QNA_IDX", ${map.QNA_IDX } );
			comSubmit.setUrl("<c:url value='/board/qnaDelete.do'/>");
			comSubmit.submit();
		}
		function fn_updateQna() {
			var comSubmit = new ComSubmit("qnaform");
			comSubmit.setUrl("<c:url value='/board/qnaModify.do' />");
			comSubmit.submit();
		}

		
	</script>

</body>
</html>



