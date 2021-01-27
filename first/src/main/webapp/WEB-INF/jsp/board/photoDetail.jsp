<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>

	<script> 
	/*
		function COMMENTLIST(){
		var BOARD_IDX = ${map.BOARD_IDX};
		$.getJSON("<c:url value='/board/photoCommentList.do?n=${map.BOARD_IDX}' />", function(data){
			var str = "";

			$(data.list).each(function(){
			console.log(data);
			var COMMENT_REGDATE = new Date(this.COMMENT_REGDATE);
			COMMENT_REGDATE = COMMENT_REGDATE.toLocaleDateString("ko-US")

			str += "<li>"
				+ "<div class='userInfo'>"
				+ "<span class='userName bg-white'>" + "[" + this.MEMBER_ID + "]님 " + "</span>"
				+ "<span class='date bg-white'>" + COMMENT_REGDATE + "</span>"
				
				+ "</div>"
				+ "<div class='commentContent bg-white'>" + this.COMMENT_CONTENT + "</div>"

				+ "<div class='replyFooter'>"
				+ "<button type='button' id='modify_modal' class='modify btn btn-warning btn-sm' data-COMMENT_IDX='" + this.COMMENT_IDX + "'>수정</button>"
				+ "<button type='button' id='deleteComment' class='delete btn btn-danger btn-sm' data-COMMENT_IDX='" + this.COMMENT_IDX + "'>삭제</button>"
				+ "</div><br/>"

				+ "</li>";
			});

			$("section.commentList ol").html(str);
		});
		}
	*/
	</script>
<!-- 모달박스 리뷰수정용 -->	
<style>
 div.replyModal { position:relative; z-index:1; display:none; }
 div.modalBackground { position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0, 0, 0, 0.8); z-index:-1; }
 div.modalContent { position:fixed; top:20%; left:calc(50% - 250px); width:500px; height:250px; padding:20px 10px; background:#fff; border:2px solid #666; }
 div.modalContent textarea { font-size:16px; font-family:'맑은 고딕', verdana; padding:10px; width:470px; height:160px; }
 div.modalContent button { font-size:20px; padding:5px 10px; margin:10px 0; background:#fff; border:1px solid #ccc; }
 div.modalContent button.modal_cancel { margin-left:20px; }
 div.form-control { position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0, 0, 0, 0.8); z-index:-1; }	

</style>


</head>
<body>
	<table class="board_view table table-hover">
		<colgroup>
			<col width="15%"/>
			<col width="35%"/>
			<col width="10%"/>
			<col width="10%"/>
			<col width="10%"/>
		</colgroup>
		<caption>포토게시판 상세</caption>
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
				<td colspan="3">${map.BOARD_TITLE }</td>
			</tr>
			<tr>
				<td colspan="4">${map.BOARD_CONTENT }</td>
			</tr>
			

		</tbody>
	</table>
	
	<a href="#this" class="btn btn-primary" id="list">목록으로</a>
	<a href="#this" class="btn btn-primary" id="update">수정하기</a>
	<a href="#this" class="btn btn-danger" id="delete">삭제하기</a>
	
	

	<div id="reply">

		<c:if test="${session_MEMBER_ID == null }">
			<p>
				소감을 남기시려면 <a href="${pageContext.request.contextPath}/member/loginForm.do">로그인</a>해주세요
			</p>
		</c:if>

		<c:if test="${session_MEMBER_ID != null}">

			<form role="form" method="post" id="commentForm" name="commentForm"
				autocomplete="off">
				
				<div class="input_area input-group col-sm-8">
					<input type="hidden" name="MEMBER_ID" value="${session_MEMBER_ID}"> 
					<input type="hidden" name="BOARD_IDX" value="${map.BOARD_IDX}"> 
					<textarea name="COMMENT_CONTENT" cols="30" rows="5" class="form-control COMMENT_CONTENT" id="COMMENT_CONTENT"
						placeholder="댓글작성 악플금지."></textarea>
				</div>

				<a href="#this" class="btn btn-primary" id="commentWrite">댓글쓰기</a>
				
				
			</form>

		</c:if>

	<section id="commentList" class="commentList">
		<ol>
		
		</ol>
		
		<script>
		/*
			COMMENTLIST();
		*/
		</script>
		
	</section>
	
	<!-- 페이징위치 -->
	<div id="PAGE_NAVI"></div>
	<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX"/>
	
	
	</div>
	
	
	
	
	
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
	/*비아이작스 댓글수정
	$(document).on("click", ".modal_modify_btn", function(){
		
		var comSubmit = new ComSubmit();
		var COMMENT_IDX = $(this).attr("data-COMMENT_IDX");
		var COMMENT_CONTENT = $(".modal_COMMENT_CONTENT").val();
		comSubmit.addParam("COMMENT_IDX", COMMENT_IDX);
		comSubmit.addParam("MEMBER_ID", "${session_MEMBER_ID}");
		comSubmit.addParam("COMMENT_CONTENT", COMMENT_CONTENT);
		comSubmit.addParam("BOARD_IDX", "${map.BOARD_IDX}");
		comSubmit.setUrl("<c:url value='/board/photoCommentModify.do' />");
		comSubmit.submit();

	});
	*/
	$(document).on("click", ".modal_modify_btn", function(){

		var comAjax = new ComAjax();
		
		var COMMENT_IDX = $(this).attr("data-COMMENT_IDX");
		var COMMENT_CONTENT = $(".modal_COMMENT_CONTENT").val();
		
		comAjax.setUrl("<c:url value='/board/photoCommentModify.do' />");
		comAjax.setCallback("fn_selectPhotoList");
		comAjax.addParam("COMMENT_IDX", COMMENT_IDX);
		comAjax.addParam("MEMBER_ID","${session_MEMBER_ID}");
		comAjax.addParam("COMMENT_CONTENT", COMMENT_CONTENT);
		$(".replyModal").fadeOut(200);
		$(".input-group").fadeIn(200);
		comAjax.ajax();
		 

	});
	

	$(document).on("click", "#deleteComment", function(e){
		
		e.preventDefault();
		fn_commentDelete($(this).attr("data-COMMENT_IDX"));
		
	});


	$(document).on("click", ".modify", function(){
		 //$(".replyModal").attr("style", "display:block;");
		 $(".replyModal").fadeIn(200);
		 $(".input-group").fadeOut(200);
		 
		 var COMMENT_IDX = $(this).attr("data-COMMENT_IDX");
		 var COMMENT_CONTENT = $(this).parent().parent().children(".commentContent").text();
		 alert(COMMENT_CONTENT);
		 $(".modal_COMMENT_CONTENT").val(COMMENT_CONTENT);
		 $(".modal_modify_btn").attr("data-COMMENT_IDX", COMMENT_IDX);
			 
	});
	
	$(document).ready(function(){

		fn_selectPhotoList(1);


		$("#list").on("click", function(e){ //목록으로 버튼
			e.preventDefault();
			fn_openBoardList();
		});
		
		$("#update").on("click", function(e){ //수정하기 버튼
			e.preventDefault();
			fn_openBoardUpdate();
		});
			
		$("#delete").on("click", function(e){ //수정하기 버튼
			e.preventDefault();
			fn_boardDelete();
		});

		$("#commentWrite").on("click", function(e){ //상품평댓글
				e.preventDefault();
				fn_commentWrite();
			});
		
		});

		/*댓글페이징*/
		function fn_selectPhotoList(pageNo){
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/board/selectPhotoCommentList.do' />");
			comAjax.setCallback("selectPhotoCommentListCollback");
			
			comAjax.addParam("BOARD_IDX","${map.BOARD_IDX}");
			comAjax.addParam("PAGE_INDEX",pageNo);
			comAjax.addParam("PAGE_ROW", 15);
			comAjax.ajax();
		}
		function selectPhotoCommentListCollback(data){
			var total = data.TOTAL;
			var body = $("table>tbody");
			
			if(total == 0){
				var str = "<tr>" + 
								"<td colspan='4'>조회된 결과가 없습니다.</td>" + 
							"</tr>";
				$("section.commentList ol").html(str);
			}
			else{
				var params = {
					divId : "PAGE_NAVI",
					pageIndex : "PAGE_INDEX",
					totalCount : total,
					eventName : "fn_selectPhotoList"
				};
				gfn_renderPaging(params);
				
				var str = "";
				$.each(data.list, function(key, value){
					
						str += "<li>"
							+ "<div class='userInfo'>"
							+ "<span class='userName bg-white'>" + "[" + value.MEMBER_ID + "]님 " + "</span>"
							+ "<span class='date bg-white'>" + value.COMMENT_REGDATE + "</span>"
							
							+ "</div>"
							+ "<div class='commentContent bg-white'>" + value.COMMENT_CONTENT + "</div>"

							+ "<div class='replyFooter'>"
							+ "<button type='button' id='modify_modal' class='modify btn btn-warning btn-sm' data-COMMENT_IDX='" + value.COMMENT_IDX + "'>수정</button>"
							+ "<button type='button' id='deleteComment' class='delete btn btn-danger btn-sm' data-COMMENT_IDX='" + value.COMMENT_IDX + "'>삭제</button>"
							+ "</div><br/>"

							+ "</li>";
									
				$("section.commentList ol").html(str);
				});
				
			
			}
		}

		/*댓글삭제 비 아이작스
		function fn_commentDelete(COMMENT_IDX){
			var comSubmit = new ComSubmit();
			
			comSubmit.addParam("COMMENT_IDX", COMMENT_IDX);
			comSubmit.addParam("MEMBER_ID", "${session_MEMBER_ID}");
			comSubmit.addParam("BOARD_IDX", "${map.BOARD_IDX}");
			comSubmit.setUrl("<c:url value='/board/photoCommentDelete.do' />");
			comSubmit.submit();
		}
		*/
		/*댓글삭제 아이작스*/
		function fn_commentDelete(COMMENT_IDX){
			
			var comAjax = new ComAjax();
			
			comAjax.setUrl("<c:url value='/board/photoCommentDelete.do' />");
			comAjax.setCallback("fn_selectPhotoList");
			comAjax.addParam("MEMBER_ID","${session_MEMBER_ID}");
			comAjax.addParam("COMMENT_IDX", COMMENT_IDX);
			comAjax.ajax();
			
		}
		
		

		
		function fn_openBoardList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/photoList.do' />");
			comSubmit.submit();
		}
		
		function fn_openBoardUpdate(){
			var idx = "${map.BOARD_IDX}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/openPhotoUpdate.do' />");
			comSubmit.addParam("BOARD_IDX", idx);
			comSubmit.submit();
		}

		function fn_openBoardUpdate(){
			var idx = "${map.BOARD_IDX}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/openPhotoUpdate.do' />");
			comSubmit.addParam("BOARD_IDX", idx);
			comSubmit.submit();
		}
		
		function fn_boardDelete(){
			var idx = "${map.BOARD_IDX}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/photoDelete.do' />");
			comSubmit.addParam("BOARD_IDX", idx);
			comSubmit.submit();
		}

		function fn_commentWrite(){
			var comAjax = new ComAjax();
			
			comAjax.setUrl("<c:url value='/board/commentWrite.do' />");
			comAjax.setCallback("fn_selectPhotoList");
			
			comAjax.addParam("BOARD_IDX","${map.BOARD_IDX}");
			comAjax.addParam("MEMBER_ID","${session_MEMBER_ID}");
			comAjax.addParam("COMMENT_CONTENT", $("#COMMENT_CONTENT").val());
			
			comAjax.ajax();
			$("#COMMENT_CONTENT").val("");
			$("#COMMENT_CONTENT").focus;
		}
		
	</script>


<div class="replyModal">
	<div class="modalContent">
		<div>
			<textarea class="modal_COMMENT_CONTENT" name="modal_COMMENT_CONTENT"></textarea>
		</div>
		<div>
			<button type="button" class="modal_modify_btn">수정</button>
			<button type="button" class="modal_cancel">취소</button>
		</div>
	</div>
	<div class="modalBackground"></div>
</div>

<script>
$(".modal_cancel").click(function(){
 //$(".replyModal").attr("style", "display:none;");
	 $(".replyModal").fadeOut(200);
	 $(".input-group").fadeIn(200);
});
</script>


</body>
</html>
