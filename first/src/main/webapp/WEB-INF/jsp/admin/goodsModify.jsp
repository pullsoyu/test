<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<script src="//cdn.ckeditor.com/4.4.4/standard/ckeditor.js"></script>

</head>
<body>
	<div class="container">
	<form id="goodsform" name="goodsform">
		<table class="table table-hover">
			<colgroup>
				<col width="15%"/>
				<col width="35%"/>
				<col width="15%"/>
				<col width="35%"/>
			</colgroup>
			<caption>상품 수정하기</caption>
			<tbody>
				<tr>
					<th scope="row">IDX</th>
				<td>
				${map.GOODS_IDX }
				<input type="hidden" id="GOODS_IDX" name="GOODS_IDX" value="${map.GOODS_IDX }">
				</td>
				<th scope="row">분류</th>
				<td>${map.GOODS_KIND }</td>
					
				</tr>
				<tr>
					<th scope="row">상품명</th>
					<td>
						<input type="text" id="GOODS_NAME" name="GOODS_NAME" class="wdp_90 form-control" value="${map.GOODS_NAME }"/>
					</td>
					<th scope="row">가격</th>
					<td>
						<input type="text" id="GOODS_PRICE" name="GOODS_PRICE" class="wdp_90 form-control" value="${map.GOODS_PRICE }"/>
					</td>
				</tr>
				
				<tr>
					<th scope="row">제조사</th>
					<td>
						<input type="text" id="GOODS_COMPANY" name="GOODS_COMPANY" class="wdp_90 form-control" value="${map.GOODS_COMPANY }"/>
					</td>
					
					<th scope="row">원산지</th>
					<td>
						<input type="text" id="GOODS_ORIGIN" name="GOODS_ORIGIN" class="wdp_90 form-control" value="${map.GOODS_ORIGIN }"/>
					</td>
					
				</tr>
				<tr>
					<th scope="row">재고</th>
					<td>
						<input type="text" id="GOODS_COUNT" name="GOODS_COUNT" class="wdp_90 form-control" value="${map.GOODS_COUNT }"/>
					</td>
					
					<th scope="row">배송비</th>
					<td>
						<input type="text" id="DELIVERY_PAY" name="DELIVERY_PAY" class="wdp_90 form-control" value="${map.DELIVERY_PAY }"/>
					</td>
					
				</tr>
				<tr>
					<th scope="row">상세</th>
					<td colspan="3">
						<textarea id="GOODS_CONTENT" name="GOODS_CONTENT" class="wdp_90" >${map.GOODS_CONTENT }</textarea>
						<script>
			                CKEDITOR.replace( 'GOODS_CONTENT',{
			                	filebrowserUploadUrl: "${pageContext.request.contextPath}/imageUpload.do"
					        });
			            </script>
					
					</td>
					
					
				</tr>
				
				
			</tbody>
		</table>
	</form>
	<a href="#this" class="btn btn-primary" id="goodsList">상품목록으로</a>
	<a href="#this" class="btn btn-primary" id="modify">저장하기</a>
	<a href="#this" class="btn btn-danger" id="delete">삭제하기</a>

	
	</div>
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#goodsList").on("click", function(e){ //상품목록으로
				e.preventDefault();
				fn_goodsList();
			});
			
			$("#modify").on("click", function(e){ //저장하기 버튼
				e.preventDefault();
				fn_modifyGoods();
			});

			$("#delete").on("click", function(e){ //삭제하기 버튼
				e.preventDefault();
				fn_deleteGoods();
			});
		});
		
		function fn_goodsList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/goodsList.do' />");
			comSubmit.submit();
		}
		
		function fn_modifyGoods(){
			var comSubmit = new ComSubmit("goodsform");
			comSubmit.setUrl("<c:url value='/admin/goodsModify.do' />");
			comSubmit.submit();
		}

		function fn_deleteGoods(){
			var comSubmit = new ComSubmit("goodsform");
			comSubmit.setUrl("<c:url value='/admin/goodsDelete.do' />");
			comSubmit.submit();
		}


		
	</script>
</body>
</html>



