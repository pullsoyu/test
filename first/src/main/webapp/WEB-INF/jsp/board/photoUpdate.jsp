<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<script src="//cdn.ckeditor.com/4.4.4/standard/ckeditor.js"></script>
</head>
<body>
	<form id="photoform" name="photoform">
		<table class="board_view table table-hover">
			<colgroup>
				<col width="15%"/>
				<col width="35%"/>
				<col width="10%"/>
				<col width="10%"/>
				<col width="10%"/>
			</colgroup>
			<caption>게시글 상세</caption>
			<tbody>
				<tr>
					<th scope="row">글번호</th>
					<td>${map.BOARD_IDX }</td>
					<th scope="row">조회수</th>
					<td>${map.BOARD_COUNT }</td>
				</tr>
				<tr>
					<th scope="row">작성자</th>
					<td>${map.MEMBER_ID }</td>
					<th scope="row">작성시간</th>
					<td>${map.BOARD_REGDATE }</td>
				</tr>
				<tr>
					<th scope="row">제목</th>
					<td>
							<input type="text" id="BOARD_TITLE" name="BOARD_TITLE" class="wdp_90 form-control" value="${map.BOARD_TITLE }"/>
					
					</td>
	
				</tr>
				<tr>
					<th scope="row">상세</th>
					<td colspan="3">
						<textarea id="BOARD_CONTENT" name="BOARD_CONTENT" class="wdp_90" >${map.BOARD_CONTENT }</textarea>
						<script>
							CKEDITOR.replace( 'BOARD_CONTENT',{
								filebrowserUploadUrl: "${pageContext.request.contextPath}/imageUpload.do"
							});
						</script>
					</td>
				</tr>
				
	
			</tbody>
		</table>
	</form>
	<a href="#this" class="btn" id="list">목록으로</a>
	<a href="#this" class="btn" id="update">저장하기</a>
	
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#list").on("click", function(e){ //목록으로 버튼
				e.preventDefault();
				fn_openBoardList();
			});
			
			$("#update").on("click", function(e){ //수정하기 버튼
				e.preventDefault();
				fn_openBoardUpdate();
			});

		
		});
		
		function fn_openBoardList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/photoList.do' />");
			comSubmit.submit();
		}
		
		function fn_openBoardUpdate(){
			var idx = "${map.BOARD_IDX}";
			var comSubmit = new ComSubmit("photoform");
			comSubmit.setUrl("<c:url value='/board/photoUpdate.do' />");
			comSubmit.addParam("BOARD_IDX", idx);
			comSubmit.submit();
		}
		
		
	</script>

</body>
</html>