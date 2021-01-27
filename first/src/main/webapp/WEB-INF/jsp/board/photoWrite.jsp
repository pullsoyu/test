<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<script src="//cdn.ckeditor.com/4.4.4/standard/ckeditor.js"></script>
	<%@ include file="/WEB-INF/include/include-header.jspf" %>
	
</head>
	
<body>

	<form id="frm2" name="frm2" enctype="multipart/form-data">
	
		<table class="table table-hover">
			
			<colgroup>
				<col width="15%">
				<col width="*"/>
			</colgroup>
			
			<tbody>
				<tr>
					<th scope="row">제목</th>
					<td><input type="text" id="TITLE" name="BOARD_TITLE" class="form-control wdp_90"></input></td>
				</tr>
				<tr>
					<td colspan="2" class="view_text">
						<textarea rows="20" cols="100" title="내용" id="CONTENTS" name="BOARD_CONTENT"></textarea>
							<script>
								CKEDITOR.replace( 'BOARD_CONTENT', {
									filebrowserUploadUrl: "${pageContext.request.contextPath}/imageUpload.do"
								 });
							</script>
					</td>
				</tr>
			</tbody>
		</table>
		
		
		<br/><br/>
		
		<a href="#this" class="btn btn-primary" id="write">작성하기</a>
		<a href="#this" class="btn btn-primary" id="list">목록으로</a>
	</form>
	
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
		var gfv_count = 1;
	
		$(document).ready(function(){
			$("#list").on("click", function(e){ //목록으로 버튼
				e.preventDefault();
				fn_openBoardList();
			});
			
			$("#write").on("click", function(e){ //작성하기 버튼
				e.preventDefault();
				fn_insertBoard();
			});
			
			
		});
		
		function fn_openBoardList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/photoList.do' />");
			comSubmit.submit();
		}
		
		function fn_insertBoard(){
			var comSubmit = new ComSubmit("frm2");
			comSubmit.addParam("MEMBER_ID", "${session_MEMBER_INFO.MEMBER_ID}");
			comSubmit.setUrl("<c:url value='/board/insertPhoto.do' />");
			comSubmit.submit();
		}
		
		
	</script>
</body>
</html>