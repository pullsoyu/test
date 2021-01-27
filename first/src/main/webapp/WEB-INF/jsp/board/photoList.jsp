<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
<div class="container">
	<h2>포토이미지 게시판</h2>
	<table class="board_list">
		<colgroup>
			<col width="10%"/>
			<col width="*"/>
			<col width="10%"/>
			<col width="10%"/>
			<col width="10%"/>
			<col width="10%"/>
		</colgroup>
		
		<tbody>
			
		</tbody>
	</table>
	
	<div id="PAGE_NAVI"></div>
	<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX"/>
	
	<a href="#this" class="btn btn-primary" id="write">글쓰기</a>
	
	
	<br/>
	<!-- <a href="#this" class="btn" id="write">글쓰기</a> -->
	
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
		$(document).ready(function(){
			fn_selectPhotoList(1);
			
			$("#PHOTO_IMAGE").on("click", function(e){ //제목 
				e.preventDefault();
				fn_openPhotoDetail($(this));
			});
			
			$("#write").on("click", function(e){ //글쓰기 버튼
				e.preventDefault();
				fn_openPhotoWrite();
			});	
			
		});
		
		
		function fn_openPhotoWrite(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/openPhotoWrite.do' />");
			comSubmit.submit();
		}
		
		function fn_openPhotoDetail(obj){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/openPhotoDetail.do' />");
			comSubmit.addParam("BOARD_IDX", obj.parent().find("#IDX").val());
			comSubmit.submit();
		}

		function fn_selectPhotoList(pageNo){
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/board/selectPhotoList.do' />");
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
					str += 

				"<div class='col-sm-5 col-md-4 col-lg-2'>" +
					"<div class='card h-100'>" +

						"<td>" +
						"<a href='#this' name='PHOTO_IMAGE'>" +
						"<img class='img-responsive img-thumbnail' src='/first/resources/CKimg/" + value.IMAGE_NAME + "' />" +
						"</a> <input type='hidden' id='IDX' value='" + value.BOARD_IDX + "'>" +
						"</td>" +
						
						"<div class='card-body'>" +
						"<h4 class='card-title'>" +
							"<td>" + value.BOARD_TITLE + "</td>" + 
						"</h4>" +


						
						"<td class='card-text'>" +
						"<a href='#this' name='title'>" + value.BOARD_IDX + "</a>" +
						"<input type='hidden' name='title' id='IDX' value=" + value.BOARD_IDX + ">" + 
						"</td>" +
						
						"<td>" + value.MEMBER_ID + "</td>" +  
						"<td>" + value.BOARD_COUNT + "</td>" +
						"<td>" + value.BOARD_REGDATE + "</td>" + 
						
						


							
						"</div>"+	
					"</div>"+
				"</div>";


					
				});
				body.append(str);
				
				$("a[name='title']").on("click", function(e){ //제목 
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
