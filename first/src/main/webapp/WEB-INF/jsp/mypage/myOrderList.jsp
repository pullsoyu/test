<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
<div id="con_lf" class="container">
<h2>주문/배송 조회</h2>
<table class=" table table-hover">
		<colgroup>
			<col width="20%"/>
			<col width="40%"/>
			<col width="20%"/>
			<col width="20%"/>
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
		
		</tbody>
	</table>
	

	<div id="PAGE_NAVI"></div>
	<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX"/>
	
	<br/>
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
	
	$(document).ready(function(){
	     fn_selectBoardList(1); 
		
		$("a[name='ORDERDETAIL']").on("click", function(e){ 
			e.preventDefault();
			fn_myOrderDetail($(this));
		});

		$("a[name='goodsDetail']").on("click", function(e){ 
			e.preventDefault();
			fn_openGoodsDetail($(this));
		});

		
		
		
	});
	function fn_myOrderDetail(obj){
		var comSubmit = new ComSubmit();
		
		comSubmit.setUrl("<c:url value='/myPage/myOrderDetail.do' />");
		comSubmit.addParam("ORDER_IDX", obj.parent().find("#ORDER_IDX").val());
		comSubmit.submit();
	}

	function fn_openGoodsDetail(obj){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/main/goodsDetail.do' />");
		comSubmit.addParam("GOODS_IDX", obj.parent().find("#GOODS_IDX").val());
		comSubmit.submit();
	}

	 function fn_selectBoardList(pageNo){
		var comAjax = new ComAjax();
		comAjax.setUrl("<c:url value='/myPage/selectMyOrdertList.do' />");
		comAjax.setCallback("fn_selectBoardListCallback");
		comAjax.addParam("PAGE_INDEX",pageNo);
		comAjax.addParam("PAGE_ROW", 20);
		comAjax.ajax();
	}
	
	function fn_selectBoardListCallback(data){
		var total = data.TOTAL;
		var random2 = Math.floor(Math.random() * 1000000);
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
				eventName : "fn_selectBoardList"
			};
			gfn_renderPaging(params);
			
			var str = "";
			$.each(data.list, function(key, value){
				str +=  
			"<tr>"+
				
				"<th>" + value.ORDER_REGISTDATE + "<BR>"+ 
				"<a href='#this' id='ORDERDETAIL' name='ORDERDETAIL' class='btn btn-info'>" + "상세보기" + "</a>"+
				"<input type='hidden' id='ORDER_IDX' value=" + value.ORDER_IDX + ">"+
				"</th>"+	

				"<td class='GOODS_SUMIMG'>" +
				"<a href='#this' id='goodsDetail' name='goodsDetail'>" +
				"<img src='/first/resources/CKimg/"+value.GOODS_SUMIMG+"' height='100' width='100'/>" +
				"<input type='hidden' id='GOODS_IDX' value=" + value.GOODS_IDX + ">"+
				"</a>"+
				"<BR>"+ 
				value.GOODS_NAME+"<br/>" +
				value.ORDER_IDX +"/"+ value.ORDER_AMOUNT +"/"+ value.DELIVERY_PAY +"</td>"+ "</a>"+
				"</td>"+
				"<td>"+ value.GOODS_PRICE + "</td>"+
				"<td>"+ value.ORDER_STATE + "</td>"+
				 
				
			"</tr>";
			
			});
			body.append(str);
			
			$("a[name='ORDERDETAIL']").on("click", function(e){ 
				e.preventDefault();
				fn_myOrderDetail($(this));
			});

			$("a[name='goodsDetail']").on("click", function(e){ //상품상세보기
				e.preventDefault();
				fn_openGoodsDetail($(this));
			});
		}
	}  
	</script>
	</div>
</body>
</html>