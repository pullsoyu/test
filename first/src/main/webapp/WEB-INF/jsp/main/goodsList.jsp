<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>first</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<style>
.wrapper{
margin-left:200px;margin-top:100px;}
</style>
<body>
<div class="wrapper">
	<h2 align="center">상품 리스트</h2>
	

	<tr>
	<td class="GOODS_COUNT_DESC"><a href="#this" name="GOODS_COUNT_DESC">인기상품순</a>
	<input type="hidden" id="IDX" value="${row.GOODS_IDX }"></td>
	</td>
	<td class="GOODS_PRICE_ASC">낮은가격순</td>
	<td class="GOODS_PRICE_DESC">높은가격순</td>
	<td class="GOODS_REVIEW_DESC">후기많은순</td>
	<td class="GOODS_IDX_DESC">최근등록순</td>
	</tr>
	

	<td class="GOODS_NAME">
						<a href="#this" name="GOODS_NAME">${row.GOODS_NAME }</a>
						<input type="hidden" id="IDX" value="${row.GOODS_IDX }"></td>
	
	
	
	<table class="board_list">
		<colgroup>
			<col width="10%"/>
			<col width="*"/>
			<col width="15%"/>
			<col width="20%"/>
		</colgroup>
		<thead>
			<tr>
			<th scope="col">상품이름</th>
			<th scope="col">상품사진</th>
			<th scope="col">제조사</th>
			<th scope="col">상품가격</th>
			</tr>
		</thead>
		<tbody>
		<c:choose>
			<c:when test="${fn:length(list) > 0}">
				<c:forEach items="${list }" var="row">
					<tr>
						<td class="GOODS_NAME">
						<a href="#this" name="GOODS_NAME">${row.GOODS_NAME }</a>
						<input type="hidden" id="IDX" value="${row.GOODS_IDX }"></td>
						<td class="GOODS_SUMIMG">
						<a href="#this" name="GOODS_SUMIMG"><img src="/first/resources/CKimg/${row.GOODS_SUMIMG }" /></a>
						<input type="hidden" id="IDX" value="${row.GOODS_IDX }">
						<%-- <img src="/first/resources/CKimg/${row.GOODS_SUMIMG }" /> --%></td>
						<td>${row.GOODS_COMPANY }</td>
						<td>${row.GOODS_PRICE }</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="4">조회된 결과가 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>	
		</tbody>
		
		<div id="PAGE_NAVI"></div>
	<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX"/>
	
	<br/>
	
</div>
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
		$(document).ready(function(){
			
			$("a[name='GOODS_NAME']").on("click", function(e){ //상품상세보기
				e.preventDefault();
				fn_openGoodsDetail($(this));
			});

			$("a[name='GOODS_SUMIMG']").on("click", function(e){ //상품상세보기
				e.preventDefault();
				fn_openGoodsDetail($(this));
			});
			

		});
		
		function fn_openGoodsDetail(obj){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/main/goodsDetail.do' />");
			comSubmit.addParam("GOODS_IDX", obj.parent().find("#IDX").val());
			comSubmit.submit();
		}


		
	</script>
		
		
	</table>

	
	
</body>
</html>