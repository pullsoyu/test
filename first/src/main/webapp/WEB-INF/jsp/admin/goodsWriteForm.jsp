<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<script src="//cdn.ckeditor.com/4.4.4/standard/ckeditor.js"></script>
<%@ include file="/WEB-INF/include/include-header.jspf" %>

</head>
<body>
<div class="container">
	<form id="frm" name="frm" >
		<table class="board_view table table-hover">
			<colgroup>
				<col width="15%">
				<col width="*"/>
			</colgroup>
			<caption> 상품 등록폼</caption>
			<tbody>
			

			
				<tr>
					<th scope="row">상품이름</th>
					<td><input type="text" id="GOODS_NAME" name="GOODS_NAME" class="wdp_90 form-control"></input></td>
				</tr>
				<tr>
					<th scope="row">상품가격</th>
					<td><input type="text" id="GOODS_PRICE" name="GOODS_PRICE" class="wdp_90 form-control"></input></td>
				</tr>
				<tr>
					<th scope="row">제조사</th>
					<td><input type="text" id="GOODS_COMPANY" name="GOODS_COMPANY" class="wdp_90 form-control"></input></td>
				</tr>
				<tr>
					<th scope="row">분류</th>
					<td><input type="text" id="GOODS_KIND" name="GOODS_KIND" class="wdp_90 form-control"></input></td>
				</tr>
				<tr>
					<th scope="row">배송비</th>
					<td><input type="text" id="DELIVERY_PAY" name="DELIVERY_PAY" class="wdp_90 form-control"></input></td>
				</tr>
				<tr>
					<th scope="row">입고량</th>
					<td><input type="text" id="GOODS_COUNT" name="GOODS_COUNT" class="wdp_90 form-control"></input></td>
				</tr>
				<tr>
					<th scope="row">생산지</th>
					<td><input type="text" id="GOODS_ORIGIN" name="GOODS_ORIGIN" class="wdp_90 form-control"></input></td>
				</tr>
				<tr>
					<td colspan="4">
						<textarea name="GOODS_CONTENT" id="GOODS_CONTENT" rows="30" cols="100"></textarea>
						<script>
			                CKEDITOR.replace( 'GOODS_CONTENT',{
			                	filebrowserUploadUrl: "${pageContext.request.contextPath}/imageUpload.do"
					        });
			            </script>
					
					
					
					</td>
				</tr>
			</tbody>
		</table>
		
		<br/><br/>

		<a href="#this" class="btn" id="write">작성하기</a>
		<a href="#this" class="btn" id="list">목록으로</a>
	</form>
</div>
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
	 
	


	
		$(document).ready(function(){
			$("#list").on("click", function(e){ //목록으로 버튼
				e.preventDefault();
				fn_openGoodsList();
			});
			
			$("#write").on("click", function(e){ //작성하기 버튼
				e.preventDefault();
				fn_goodsWrite();
			});

		});

		
		
		function fn_openGoodsList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/goodsList.do' />");
			comSubmit.submit();
		}
		
		function fn_goodsWrite(){
			
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/admin/goodsWrite.do' />");
			comSubmit.submit();
		}
		
		
	</script>

</body>
</html>