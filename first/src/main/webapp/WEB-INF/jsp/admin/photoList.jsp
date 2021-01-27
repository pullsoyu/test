
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
<div class="container">
	<h2>포토게시판</h2>
	<table class="board_list table table-hover">
		<colgroup>
			<col width="10%"/>
			<col width="*"/>
			<col width="15%"/>
			<col width="20%"/>
		</colgroup>
		<thead>
			<tr>
				<th scope="col">이미지</th>
				<th scope="col">게시글번호</th>
				<th scope="col">제목</th>
				<th scope="col">작성일</th>
				<th scope="col">글쓴이</th>
			</tr>
		</thead>
		<tbody>
		
			<!-- 
			<c:choose>
				<c:when test="${fn:length(memberlist) > 0}">
					<c:forEach items="${memberlist }" var="row">
						<tr>
							<td>${row.MEMBER_IDX}</td>
							<td class="MEMBER_ID">
								<a href="#this" name="MEMBER_ID">${row.MEMBER_ID }</a>
								<input type="hidden" id="IDX" value="${row.MEMBER_IDX }">
							</td>
							<td>${row.MEMBER_NAME }</td>
							<td>${row.MEMBER_REGISTDATE }</td>
							<td>${row.MEMBER_DELGB }</td>
							
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="4">조회된 결과가 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
			-->
			
		</tbody>
	</table>
	
	
	
	<div id="PAGE_NAVI"></div>
	<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX"/>
	
	<br/>
	
	
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
		$(document).ready(function(){
			fn_selectPhotoList(1);
			
			$("#PHOTO_IMAGE").on("click", function(e){ //제목 
				e.preventDefault();
				fn_openPhotoDetail($(this));
			});
			
			$("a[name='BOARD_TITLE']").on("click", function(e){ //멤머상세보기
				e.preventDefault();
				fn_openPhotoDetail($(this));
			});
		});

		
		
		
		
		function fn_openPhotoDetail(obj){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/openPhotoDetail.do' />");
			comSubmit.addParam("BOARD_IDX", obj.parent().find("#IDX").val());
			comSubmit.submit();
		}
		
		function fn_selectPhotoList(pageNo){
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/admin/selectPhotoList.do' />");
			comAjax.setCallback("fn_selectPhotoListCallback");
			comAjax.addParam("PAGE_INDEX",pageNo);
			comAjax.addParam("PAGE_ROW", 15);
			comAjax.ajax();
		}
		
		function fn_selectPhotoListCallback(data){
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
					eventName : "fn_selectPhotoList"
				};
				gfn_renderPaging(params);
				
				var str = "";
				$.each(data.list, function(key, value){
					str += "<tr>" + 

								"<td>" +
								"<a href='#this' name='PHOTO_IMAGE'>" +
								"<img class='img-responsive img-thumbnail' src='/first/resources/CKimg/" + value.IMAGE_NAME + "' />" +
								"</a> <input type='hidden' id='IDX' value='" + value.BOARD_IDX + "'>" +
								"</td>" +

					
								"<td>" + value.BOARD_IDX + "</td>" + 
								"<td class='title'>" +
									"<a href='#this' name='BOARD_TITLE'>" + value.BOARD_TITLE + "</a>" +
									"<input type='hidden' id='IDX' name='IDX' value=" + value.BOARD_IDX + ">" + 
								"</td>" +
								"<td>" + value.BOARD_REGDATE + "</td>" + 
								"<td>" + value.MEMBER_ID + "</td>" + 
							"</tr>";
				});
				body.append(str);
				
				
				$("a[name='BOARD_TITLE']").on("click", function(e){ //멤머상세보기
					e.preventDefault();
					fn_openPhotoDetail($(this));
				});

				$("a[name='PHOTO_IMAGE']").on("click", function(e){ //제목 
					e.preventDefault();
					fn_openPhotoDetail($(this));
				});
				
			}
		}
		
	</script>
	</div>
</body>
</html>