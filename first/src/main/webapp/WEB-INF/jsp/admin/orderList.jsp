
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
<div class="container">
	<h2>주문 목록</h2>
	<table class="board_list table table-hover">
		<colgroup>
			<col width="5%"/>
			<col width="5%"/>
			<col width="5%"/>
			<col width="5%"/>
			<col width="15%"/>
			<col width="10%"/>
			<col width="5%"/>
			<col width="10%"/>
		</colgroup>
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">상품</th>
				<th scope="col">회원</th>
				<th scope="col">수량</th>
				<th scope="col">주문일</th>
				<th scope="col">주문상태</th>
				<th scope="col">총액</th>
				<th scope="col">배송비</th>
			</tr>
		</thead>
		<tbody>
		
			<!-- 
			<c:choose>
				<c:when test="${fn:length(orderlist) > 0}">
					<c:forEach items="${orderlist }" var="row">
						<tr>
							<td>${row.ORDER_IDX}</td>
							<td>${row.GOODS_IDX}</td>
							<td>${row.MEMBER_IDX}</td>
							<td>${row.ORDER_AMOUNT}</td>
							<td>${row.ORDER_REGISTDATE}</td>
							<td>${row.ORDER_STATE}</td>
							<td>${row.ORDER_TOTAL}</td>
							<td>${row.DELIVERY_PAY }</td>
							<td class="title">
								<select name="select-states" id="select-states">
									<option selected value="${row.ORDER_STATE}">주문상태 : ${row.ORDER_STATE}</option>
									<option value="발송전">발송전</option>
									<option value="배송중">배송중</option>
									<option value="배송완료">배송완료</option>
									<option value="구매확정">구매확정</option>
									<option value="반품신청">반품신청</option>
								</select> 
							
								<a href="#this" id="state" name="state">주문상태변경</a>
								
								<input type="hidden" id="IDX" value="${row.ORDER_IDX}">
							</td>
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
	
		$(document).ready(function () {
			fn_selectOrderList(1);
			
			$("a[name='state']").on("click", function(e){//상태수정하기
				e.preventDefault(); //새로고침막기,이동되는것막기
				fn_orderStateModify($(this));
			});
		});


		function fn_selectOrderList(pageNo){
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/admin/selectOrderList.do' />");
			comAjax.setCallback("fn_selectOrderListCallback");
			comAjax.addParam("PAGE_INDEX",pageNo);
			comAjax.addParam("PAGE_ROW", 15);
			comAjax.ajax();
		}

	
	
		
		function fn_orderStateModify(obj){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/orderStateModify.do' />");
			comSubmit.addParam("ORDER_IDX", obj.parent().find("#IDX").val());
			comSubmit.addParam("ORDER_STATE", obj.parent().find("#select-states option:selected").val());

			
			/* alert('아이디엑스');
			alert(obj.parent().find("#IDX").val());
			alert('스테이트');
			alert(obj.parent().find("#select-states option:selected").val()); */

			
			comSubmit.submit();
		}


		function fn_selectOrderListCallback(data){
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
					eventName : "fn_selectOrderList"
				};
				gfn_renderPaging(params);
				
				var str = "";
				$.each(data.list, function(key, value){
					str += "<tr>" + 
								"<td>" + value.ORDER_IDX + "</td>" + 
								"<td>" + value.GOODS_IDX + "</td>" + 
								"<td>" + value.MEMBER_IDX + "</td>" + 
								"<td>" + value.ORDER_AMOUNT + "</td>" + 
								"<td>" + value.ORDER_REGISTDATE + "</td>" + 
								"<td>" + value.ORDER_STATE + "</td>" + 
								"<td>" + value.ORDER_TOTAL + "</td>" + 
								"<td>" + value.DELIVERY_PAY + "</td>" + 
								"<td>" +
								"<select name='select-states' id='select-states'>" +
									"<option selected value=" + value.ORDER_STATE + ">주문상태 :"+ value.ORDER_STATE +"</option>" +
									"<option value='발송전'>발송전</option>" +
									"<option value='배송중'>배송중</option>" +
									"<option value='배송완료'>배송완료</option>" +
									"<option value='구매확정'>구매확정</option>" +
									"<option value='반품신청'>반품신청</option>" +
								"</select>" +
							
								"<a href='#this' id='state' name='state'>주문상태변경</a>" +
								
								"<input type='hidden' id='IDX' value=" + value.ORDER_IDX + ">" +
								"</td>" +
							"</tr>";
				});
				body.append(str);
				
				
				$("a[name='state']").on("click", function(e){//상태수정하기
					e.preventDefault(); //새로고침막기,이동되는것막기
					fn_orderStateModify($(this));
				});
				
			}
		}
		
	</script>
	</div>
</body>
</html>