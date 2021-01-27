<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
<div id="con_lf" class="container">
<h2>주문/배송 상세보기</h2>
<table class="table table-hover">

		<colgroup>
			<col width="10%"/>
			<col width="30%"/>
			<col width="10%"/>
			<col width="10%"/>
			<col width="10%"/>
		</colgroup>

		<thead>
			<tr>
				
				<th scope="col">주문일자</th>	
				<th scope="col">상품정보</th>	
				<th scope="col">가격</th>	
				<th scope="col">상태</th>

			</tr>
		</thead>
			
		<tbody>
		<c:choose>
			<c:when test="${fn:length(list) > 0}">
					
			<c:forEach items="${list }" var="row">
			<tr>
				<td>${row.ORDER_REGISTDATE }</td>
				<td class="GOODS_SUMIMG">
						<a href="#this" id="goodsDetail" name="goodsDetail"><img src="/first/resources/CKimg/${row.GOODS_SUMIMG }" height="100" width="100"/></a>
						<input type="hidden" id="GOODS_IDX" value="${row.GOODS_IDX }">
				</td>
				<td>
				${row.GOODS_NAME }/
				${row.ORDER_IDX }/${row.ORDER_AMOUNT }/${row.DELIVERY_PAY }</td>			
				<td>${row.GOODS_PRICE }</td>
				<td>${row.ORDER_STATE }</td>
						
			</tr>
			<br/>

	
			</c:forEach>
			</c:when>
		</c:choose>
		</tbody>
		
	</table>
<a href="#this" class="btn btn-primary" id="cancelOrder">환불/취소</a>
	

	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
	
	$(document).ready(function(){
	
		$("#cancelOrder").on("click", function(e){ //상품등록
			e.preventDefault();
			fn_cancelOrder($(this));
		});


		$("a[name='goodsDetail']").on("click", function(e){ //상품상세보기
			e.preventDefault();
			fn_openGoodsDetail($(this));
		});
		
		
	});

	function fn_cancelOrder(){
		var comSubmit = new ComSubmit();
		alert("주문이 취소 되었습니다");
		comSubmit.addParam("ORDER_IDX","${list[0]['ORDER_IDX']}");
		comSubmit.setUrl("<c:url value='/myPage/cancelOrder.do' />");
		comSubmit.submit();
	}
	

	 function fn_openGoodsDetail(obj){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/main/goodsDetail.do' />");
			comSubmit.addParam("GOODS_IDX", obj.parent().find("#GOODS_IDX").val());
			comSubmit.submit();
		}

	  
	  
	</script>
</div>	
</body>
</html>