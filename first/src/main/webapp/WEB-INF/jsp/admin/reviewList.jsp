<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
<div class="container">
	<h2>고객상품평 목록</h2>
	<table class="board_list table table-hover">
		<colgroup>
			<col width="10%"/>
			<col width="10"/>
			<col width="10%"/>
			<col width="15%"/>
			<col width="15%"/>
			<col width="20%"/>
			<col width="10%"/>
			<col width="10%"/>
		</colgroup>
		<thead>
			<tr>
				<th scope="col">리뷰번호</th>
				<th scope="col">상품번호</th>
				<th scope="col">회원번호</th>
				<th scope="col">리뷰제목</th>
				<th scope="col">리뷰내용</th>
				<th scope="col">리뷰등록일</th>
				<th scope="col">리뷰점수</th>
				<th scope="col">리뷰삭제</th>
			</tr>
		</thead>
		<tbody>
			
		</tbody>
	</table>
	
	<div id="PAGE_NAVI"></div>
	<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX"/>
	
	<br/>

	
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
		$(document).ready(function(){
			fn_selectReviewList(1);
			
			$("a[name='GOODS_IDX']").on("click", function(e){ //제목 
				e.preventDefault();
				fn_goodsDetail($(this));
			});

			$("a[name='REVIEW_IDX']").on("click", function(e){ //제목 
				e.preventDefault();
				fn_deleteReview($(this));
			});
		});


		
		function fn_deleteReview(obj){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/reviewDelete.do' />");
			comSubmit.addParam("REVIEW_IDX", obj.parent().find("#REVIEW_IDX").val());
			comSubmit.submit();
		}

			
		function fn_goodsDetail(obj){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/goodsDetail.do' />");
			comSubmit.addParam("GOODS_IDX", obj.parent().find("#GOODS_IDX").val());
			comSubmit.submit();
		}
		
		
		function fn_selectReviewList(pageNo){
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/admin/selectReviewList.do' />");
			comAjax.setCallback("fn_selectReviewListCallback");
			comAjax.addParam("PAGE_INDEX",pageNo);
			comAjax.addParam("PAGE_ROW", 15);
			comAjax.ajax();
		}
		
		function fn_selectReviewListCallback(data){
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
					eventName : "fn_selectReviewList"
				};
				gfn_renderPaging(params);
				
				var str = "";
				$.each(data.list, function(key, value){
					str += "<tr>" + 
								"<td>" + value.REVIEW_IDX + "</td>" + 
								"<td class='title'>" +
									"<a href='#this' name='GOODS_IDX'>" + value.GOODS_IDX + "</a>" +
									"<input type='hidden' id='GOODS_IDX' name='GOODS_IDX' value=" + value.GOODS_IDX + ">" + 
								"</td>" +
								"<td>" + value.MEMBER_IDX + "</td>" + 
								"<td>" + value.REVIEW_TITLE + "</td>" + 
								"<td>" + value.REVIEW_CONTENT + "</td>" + 
								"<td>" + value.REVIEW_DATE + "</td>" + 
								"<td>" + value.REVIEW_SCORE + "</td>" + 
								"<td>" + 
									"<a href='#this' name='REVIEW_IDX'>"+ "리뷰삭제" +"</a>" +
									"<input type='hidden' id='REVIEW_IDX' name='REVIEW_IDX' value=" + value.REVIEW_IDX + ">" +
								"</td>" +	
							"</tr>";
				});
				body.append(str);
				
				$("a[name='GOODS_IDX']").on("click", function(e){ //제목 
					e.preventDefault();
					fn_goodsDetail($(this));
				});

				$("a[name='REVIEW_IDX']").on("click", function(e){ //제목 
					e.preventDefault();
					fn_deleteReview($(this));
				});
			}
		}
	</script>	
</div>
</body>
</html>