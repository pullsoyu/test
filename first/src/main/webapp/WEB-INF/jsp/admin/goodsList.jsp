
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
<div class="container">
	<h2>상품 목록</h2>
	<table class="table table-hover">
		<colgroup>
			<col width="10%"/>
			<col width="30%"/>
			<col width="15%"/>
			<col width="20%"/>
		</colgroup>
		<thead>
			<tr>
				<th scope="col">상품번호</th>
				<th scope="col">상품이름</th>
				<th scope="col">가격</th>
				<th scope="col">분류</th>
			</tr>
		</thead>
		<tbody>
		<!-- 
		
			<c:choose>
				<c:when test="${fn:length(goodslist) > 0}">
					<c:forEach items="${goodslist }" var="row">
						<tr>
							<td>${row.GOODS_IDX}</td>
							<td class="GOODS_NAME">
								<a href="#this" name="GOODS_NAME">${row.GOODS_NAME }</a>
								<input type="hidden" id="IDX" value="${row.GOODS_IDX }">
							</td>
							<td>${row.GOODS_PRICE }</td>
							<td>${row.GOODS_KIND}</td>

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
	<a href="#this" class="btn btn-primary" id="goodsWriteForm">상품등록폼으로가기</a>
	
	
</div>	
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
		$(document).ready(function(){
			fn_selectGoodsList(1);
			
			$("a[name='GOODS_NAME']").on("click", function(e){ //상품상세보기
				e.preventDefault();
				fn_openGoodsDetail($(this));
			});

			$("#goodsWriteForm").on("click", function(e){ //상품등록
				e.preventDefault();
				fn_goodsWriteForm($(this));
			});

		});

		
		
		function fn_goodsWriteForm(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/goodsWriteForm.do' />");
			comSubmit.submit();
		}
		
		function fn_openGoodsDetail(obj){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/goodsDetail.do' />");
			comSubmit.addParam("GOODS_IDX", obj.parent().find("#IDX").val());
			comSubmit.submit();
		}

		function fn_selectGoodsList(pageNo){
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/admin/selectGoodsList.do' />");
			comAjax.setCallback("fn_selectGoodsListCallback");
			comAjax.addParam("PAGE_INDEX",pageNo);
			comAjax.addParam("PAGE_ROW", 15);
			comAjax.ajax();
		}
		

		function fn_selectGoodsListCallback(data){
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
					eventName : "fn_selectGoodsList"
				};
				gfn_renderPaging(params);
				
				var str = "";
				$.each(data.list, function(key, value){
					str += "<tr>" + 
								"<td>" + value.GOODS_IDX + "</td>" + 
								"<td class='title'>" +
									"<a href='#this' name='GOODS_NAME'>" + value.GOODS_NAME + "</a>" +
									"<input type='hidden' id='IDX' name='IDX' value=" + value.GOODS_IDX + ">" + 
								"</td>" +
								"<td>" + value.GOODS_NAME + "</td>" + 
								"<td>" + value.GOODS_KIND + "</td>" + 
							"</tr>";
				});
				body.append(str);
				
				
				$("a[name='GOODS_NAME']").on("click", function(e){ //멤머상세보기
					e.preventDefault();
					fn_openGoodsDetail($(this));
				});
				
			}
		}
		
	</script>
	
</body>
</html>