<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-board_header.jspf" %>
</head>
<body>
<div class="container">
	<h2>공지사항게시판 관리자</h2>
		
	
	<table class="board_list table table-hover">
		<colgroup>
			<col width="10%"/>
			<col width="*"/>
			<col width="10%"/>
			<col width="10%"/>
			<col width="10%"/>
			<col width="10%"/>
		</colgroup>
		<thead>
			<tr>
				<th scope="col">글번호</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">파일</th>
				<th scope="col">조회수</th>
				<th scope="col">등록일</th>
			</tr>
		</thead>
		<tbody>
			
		</tbody>
	</table>
	
	<div id="PAGE_NAVI"></div>
	<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX"/>
	
	<br/>
	<a href="#this" class="btn" id="write">글쓰기</a>
	
	<%@ include file="/WEB-INF/include/include-board_body.jspf" %>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#SELECT_KIND option:selected").val();	
			fn_selectBoardList(1);
			
			$("#write").on("click", function(e){ //글쓰기 버튼
				e.preventDefault();
				fn_openBoardWrite();
			});	
			
			$("a[name='title']").on("click", function(e){ //제목 
				e.preventDefault();
				fn_openBoardDetail($(this));
			});	
		});
		
		
		function fn_openBoardWrite(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/board/openNoticeBoardWrite.do' />");
			comSubmit.submit();
		}
		
		function fn_openBoardDetail(obj){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/board/openNoticeBoardDetail.do' />");
			comSubmit.addParam("BOARD_KIND", obj.parent().find("#BOARD_KIND").val());
			comSubmit.addParam("BOARD_IDX", obj.parent().find("#BOARD_IDX").val());
			comSubmit.submit();
		}

		function fn_selectBoardList(pageNo){
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/admin/board/selectNoticeBoardList.do' />");
			comAjax.setCallback("fn_selectBoardListCallback");
			comAjax.addParam("PAGE_INDEX",pageNo);
			comAjax.addParam("PAGE_ROW", 15);
			comAjax.ajax();
		}
		
		function fn_selectBoardListCallback(data){
			var total = data.TOTAL;
			var body = $("table>tbody");
			body.empty();
			if(total == 0){
				var str = "<tr>" + 
								"<td colspan='4'>조회된 결과가 없습니다.</td>" + 
							"</tr>";
				body.append(str);
			}
			else{
				var params = {
					divId : "PAGE_NAVI",
					pageIndex : "PAGE_INDEX",
					totalCount : total,
					eventName : "fn_selectBoardList"
				};
				gfn_renderPaging(params);
				
				var str = "";
				$.each(data.list, function(key, value){
					str += "<tr>" + 
								"<td>" + value.BOARD_IDX + "</td>" + 
								"<td class='title'>" +
									"<a href='#this' name='title'>" + value.BOARD_TITLE + "</a>" +
									"<input type='hidden' name='title' id='BOARD_KIND' value=" + value.BOARD_KIND + ">" +
									"<input type='hidden' name='title' id='BOARD_IDX' value=" + value.BOARD_IDX + ">" +
								"</td>" +
								"<td>" + value.MEMBER_ID + "</td>" +  
								"<td>" +   + "</td>" + 
								"<td>" + value.BOARD_COUNT + "</td>" +
								"<td>" + value.BOARD_REGDATE + "</td>" + 
							"</tr>";
				});
				body.append(str);
				
				$("a[name='title']").on("click", function(e){ //제목 
					e.preventDefault();
					fn_openBoardDetail($(this));
				});
			}
		}
		
		
	</script>	
	</div>
</body>
</html>
