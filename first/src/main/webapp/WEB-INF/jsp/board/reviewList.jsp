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
			
			<col width="7%"/>
			<col width="7%"/>
			<col width="7%"/>
			<col width="15%"/>
			<col width="17%"/>
			<col width="18%"/>
			<col width="10%"/>
			
		</colgroup>
		
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">상품</th>
				<th scope="col">회원</th>
				<th scope="col">제목</th>
				<th scope="col">내용</th>
				<th scope="col">등록일</th>
				<th scope="col">점수</th>
				<!-- 관리자용
				<th scope="col">리뷰삭제</th> 
				-->
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

			
			/* 관리자용
			$("a[name='REVIEW_IDX']").on("click", function(e){ //제목 
				e.preventDefault();
				fn_deleteReview($(this));
			}); 
			*/
			
		});


		
		/* 관리자용
		function fn_deleteReview(obj){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/reviewDelete.do' />");
			comSubmit.addParam("REVIEW_IDX", obj.parent().find("#REVIEW_IDX").val());
			comSubmit.submit();
		} 
		*/

			
		function fn_goodsDetail(obj){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/main/goodsDetail.do' />");
			comSubmit.addParam("GOODS_IDX", obj.parent().find("#GOODS_IDX").val());
			comSubmit.submit();
		}
		
		
		function fn_selectReviewList(pageNo){
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/board/selectReviewList.do' />");
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
									
								"</tr>";
				});
				body.append(str);
				
				$("a[name='GOODS_IDX']").on("click", function(e){ //제목 
					e.preventDefault();
					fn_goodsDetail($(this));
				});

				/*관리자용
				 $("a[name='REVIEW_IDX']").on("click", function(e){ //제목 
					e.preventDefault();
					fn_deleteReview($(this));
				}); 
				*/
			}
		}
	</script>	
	</div>
</body>
</html>