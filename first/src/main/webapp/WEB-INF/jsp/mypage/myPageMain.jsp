<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
<div id="con_lf" class="container">
<h2>마이페이지 메인</h2><Br>
<table class="table table-hover">
		
		
		<thead>
		
	
		<tr>
			<td><h4>회원 상세정보</h4></td>
			<td>
			</td>
			<td>
			</td>
			<td align="right"  scope="col">
			<form id="frm" name="frm" enctype="multipart/form-data" >
			<div align="right">
			<a href="#this" class="btn btn-info" id="modifyForm">회원정보수정</a>
			<a href="#this" class="btn btn-info" id="deleteForm">회원삭제</a>
			</div>
			</form>
			</td>
			
		</tr>
		</thead>
		
		
		
		<tbody>
		
		
			<tr scope="col">
				<th scope="row">아이디</th>
				<td>${map.MEMBER_ID }</td>
				<th scope="row">포인트</th>
				<td>${map.MEMBER_POINT }</td>
				
			</tr>
			<tr scope="col">
				<th scope="row">연락처</th>
				<td>${map.MEMBER_PHONE }</td>
				<th scope="row">EMAIL</th>
				<td>${map.MEMBER_EMAIL}</td>
			</tr>
			
			<tr scope="col">
				<th scope="row">가입일시</th>
				<td>${map.MEMBER_REGISTDATE }</td>
			</tr>

			<tr scope="col">
				<th scope="row">주소</th>
				<td>${map.MEMBER_ADDRESS1 } ${map.MEMBER_ADDRESS2 }</td>
			</tr>
				
		</tbody>
		
		
</table>
<br>
<Br>
<table class="table table-hover">
		<colgroup>
				<col width="10%"/>
				<col width="60%"/>
				<col width="10%"/>
				<col width="20%"/>

		</colgroup>
		
		<thead>

		<tr><td><h4>최근 주문한 상품</h4></td></tr>
 
         <tr>

            <th scope="col">주문일자</th>   
            <th scope="col">상품정보</th>   
            <th scope="col">가격</th>   
            <th scope="col">상태</th>   

         </tr>
		</thead>
		<tbody>
		
		<c:choose>
				<c:when test="${fn:length(myOrderList) > 0}">
					<c:forEach items="${myOrderList }" var="row" begin="0" end="4">
					
					  	<tr>
			            <td>${row.ORDER_REGISTDATE }</td>		
					<td class="GOODS_SUMIMG">
						<a href="#this" id="goodsDetail" name="goodsDetail"><img src="/first/resources/CKimg/${row.GOODS_SUMIMG }" height="50" width="50"/></a>
						<input type="hidden" id="GOODS_IDX" value="${row.GOODS_IDX }">
				<br/>
				${row.GOODS_NAME }<br/>
				주문번호:${row.ORDER_IDX }/주문수량:${row.ORDER_AMOUNT }/배송비:${row.DELIVERY_PAY }</td>			
				<td>${row.GOODS_PRICE }</td>
				<td>${row.ORDER_STATE }</td>
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
	</table>
	
		
			<p align="center" ><a href="#this" name="orderMore" class="btn btn-info">주문내역 더보기</a></p>
		
	

<Br/>
<br/>

<table class="table table-hover">	
		<colgroup>
				<col width="20%"/>
				<col width="50%"/>
				<col width="10%"/>
				<col width="10%"/>
				<col width="10%"/>
		</colgroup>
		
		
		<thead>
		<tr><td><h4>최근 추가한 장바구니</h4></td></tr>
		 
         <tr>
		    <td scope="col">이미지</td>   
            <td scope="col">상품정보</td>   
            <td scope="col">가격</td>   
            <td scope="col">배송비</td>   
            <td scope="col">수량</td>         
         </tr>
		</thead>
		
		<tbody>
		
		<c:choose>
				<c:when test="${fn:length(cartList) > 0}">
					<c:forEach items="${cartList }" var="row" begin="0" end="4">
					
					  	<tr>
			            	<td class="GOODS_SUMIMG">
						<a href="#this" id="goodsDetail" name="goodsDetail"><img src="/first/resources/CKimg/${row.GOODS_SUMIMG }" height="50" width="50"/></a>
						<input type="hidden" id="GOODS_IDX" value="${row.GOODS_IDX }">
				</td>      
			            <td>${ row.GOODS_NAME}</td>
			            <td>${ row.GOODS_PRICE}</td>
			            <td>${ row.DELIVERY_PAY}</td>
			            <td>${ row.GOODS_AMOUNT}</td>
			            
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
</table>	
<p align="center"><a href="#this" class="btn btn-info" name="basketMore">장바구니 더보기</a></p>

<Br/>
<br/>


<table class="table table-hover">

		<colgroup>
				<col width="40%"/>
				<col width="30%"/>
				<col width="30%"/>
		</colgroup>
			
		<thead>
		<tr><td><h4>최근 추가한 찜한상품</h4></td></tr>
 
         <tr>

            <th scope="col">이미지</th>   
            <th scope="col">상품정보</th>   
            <th scope="col">가격</th>   

         </tr>
		</thead>
		<tbody>
		
		<c:choose>
				<c:when test="${fn:length(likeList) > 0}">
					<c:forEach items="${likeList }" var="row" begin="0" end="4">
					
					  	<tr>
			            
			           	<td class="GOODS_SUMIMG">
						<a href="#this" id="goodsDetail" name="goodsDetail"><img src="/first/resources/CKimg/${row.GOODS_SUMIMG }" height="50" width="50"/></a>
						<input type="hidden" id="GOODS_IDX" value="${row.GOODS_IDX }">
				</td>   
			            <td>${ row.GOODS_NAME}</td>
			            <td>${ row.GOODS_PRICE}</td>
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
	</table>
<p align="center"><a href="#this" class="btn btn-info" name="likeMore">장바구니 더보기</a></p>	
</div>	
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#modifyForm").on("click", function(e){
				e.preventDefault();
				fn_pwCheckForm();
			});
				
			$("#deleteForm").on("click", function(e){
				e.preventDefault();	
				fn_deleteForm();
			});

			$("a[name='likeMore']").on("click", function(e){
				e.preventDefault();
				fn_likeMore();
			});

			$("a[name='basketMore']").on("click", function(e){
				e.preventDefault();
				fn_basketMore();
			});

			$("a[name='orderMore']").on("click", function(e){
				e.preventDefault();
				fn_orderMore();
			});

			$("a[name='goodsDetail']").on("click", function(e){ //상품상세보기
				e.preventDefault();
				fn_openGoodsDetail($(this));
			});

			
		});
		

		function fn_pwCheckForm(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/myPage/pwCheckForm.do' />");
			comSubmit.submit();
		}
		function fn_deleteForm(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/myPage/accountDeleteForm.do' />");
			comSubmit.submit();
		}

		function fn_likeMore(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/myPage/likeList.do' />");
			comSubmit.submit();
		}

		function fn_basketMore(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/myPage/basketList.do' />");
			comSubmit.submit();
		}

		function fn_orderMore(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/myPage/myOrderList.do' />");
			comSubmit.submit();
		}

		 function fn_openGoodsDetail(obj){
				var comSubmit = new ComSubmit();
				comSubmit.setUrl("<c:url value='/main/goodsDetail.do' />");
				comSubmit.addParam("GOODS_IDX", obj.parent().find("#GOODS_IDX").val());
				comSubmit.submit();
			}
		   
				
		
	</script>
</body>
</html>