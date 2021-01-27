<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

</head>
<body>

<div id="con_lf" class="container">
	<h2 class="pg_tit">
		<span>상품상세보기</span>
	</h2>


	<table class="table table-hover">
		<colgroup>
			<col width="15%" />
			<col width="35%" />
			<col width="15%" />
			<col width="35%" />
		</colgroup>
		
		<tbody>
			<tr>
				<th scope="row">IDX</th>
				<td>${map.GOODS_IDX }</td>
				<th scope="row">분류</th>
				<td>${map.GOODS_KIND }</td>

			</tr>
			<tr>
				<th scope="row">상품명</th>
				<td>${map.GOODS_NAME }</td>
				<th scope="row">가격</th>
				<td>${map.GOODS_PRICE }</td>
			</tr>

			<tr>
				<th scope="row">제조사</th>
				<td>${map.GOODS_COMPANY }</td>
				<th scope="row">원산지</th>
				<td>${map.GOODS_ORIGIN }</td>
			</tr>
			<tr>
				<th scope="row">재고</th>
				<td>${map.GOODS_COUNT }</td>
				<th scope="row">배송비</th>
				<td>${map.DELIVERY_PAY }</td>
			</tr>
			<tr>
				<th scope="row">상세</th>
				<td colspan="3">${map.GOODS_CONTENT }</td>
			</tr>
			<tr>
				<th scope="row">이미지</th>
				<td colspan="3">${map.SUMIMG }</td>
			</tr>


		</tbody>
	</table>


	<a href="#this" class="btn btn-primary" id="goodslist">상품목록으로</a>
	<a href="#this" class="btn btn-primary" id="modifyForm">수정하기로가기</a>


</div>

	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#goodslist").on("click", function(e){ //관리자모드로가기 버튼
				e.preventDefault();
				fn_goodslist();
			});
			
			$("#modifyForm").on("click", function(e){
				e.preventDefault();
				fn_modifyForm();
			});
		});
		
		function fn_goodslist(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/goodsList.do' />");
			comSubmit.submit();
		}
		
		function fn_modifyForm(){//멤버에서 상품으로 바꿔야함
			var idx = "${map.GOODS_IDX}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/goodsModifyForm.do' />");
			comSubmit.addParam("GOODS_IDX", idx);
			comSubmit.submit();
		}
	</script>
</body>
</html>



