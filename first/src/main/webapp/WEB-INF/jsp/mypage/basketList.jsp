<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

long random = System.currentTimeMillis();

%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>

<body>
<div id="con_lf" class="container">
<h2>장바구니</h2><br>
<form  method="post" id="basketList" name="basketList" enctype="multipart/form-data">
<input type="hidden" name="chk[]" id="chk" value="" />
<table class="table table-hover">

      <colgroup>
         <col width="10%"/>
         <col width="10%"/>
         <col width="20%"/>
         <col width="10%"/>
         <col width="10%"/>
         <col width="10%"/>
         <col width="20%"/>
      </colgroup>
	 
      <thead>
      <c:choose>
			<c:when test="${fn:length(list) > 0}">
					
			<c:forEach items="${list }" var="row" begin="0" end="0">
      
    
     <p>총 <span style="color:red;">${row.COUNT }개</span>의 상품이 장바구니에 있습니다</p>
     </c:forEach>
     </c:when>
     </c:choose>
      
         <tr>       
            <th scope="col"><div class="allCheck">
               <label for="allCheck">선택</label><input type="checkbox" name="allCheck" id="allCheck" />
               </div>
            </th>
            <th scope="col">이미지</th>   
            <th scope="col">상품정보</th>   
            <th scope="col">가격</th>   
            <th scope="col">수량</th>   
            <th scope="col">소계</th>         

         </tr>
      </thead>
         
      <tbody>
      <c:set var="sum" value="0" />
      <c:set var="sumAmount" value="0" />
      <c:set var="deli" value="0" />
      <c:choose>
			<c:when test="${fn:length(list) > 0}">
			<c:forEach items="${list }" var="row" varStatus="status">
         <tr>
            <th scope="row"><input type="checkbox" class="chBox" id="basketChk" name="basketChk" data-cartNum="${row.CART_IDX }" value="${row.CART_IDX }"></th>
            <td class="GOODS_SUMIMG">
			<a href="#this" id="goodsDetail" name="goodsDetail">
			<img src="/first/resources/CKimg/${row.GOODS_SUMIMG }" height="100" width="100"/></a>
			<input type="hidden" id="GOODS_IDX" value="${row.GOODS_IDX }">
			</td>     
            <td> ${row.GOODS_NAME } </td>
            <td><fmt:formatNumber pattern="###,###,###" value="${row.GOODS_PRICE }" />원</td>
			
			<td>
			
			<input type="hidden" id="cartStock${status.index}" value="${row.CART_IDX}" />
			
						<p class="cartStock ">
							<button type="button" class="plus_${row.CART_IDX} btn btn-info">+</button>
							<input type="number" id="GOODS_AMOUNT" class="numBox_${row.CART_IDX}" min="1" max="100" value="${row.GOODS_AMOUNT }"
								readonly="readonly" data-cartNum="${row.CART_IDX }" />
							
							<button type="button" class="minus_${row.CART_IDX} btn btn-info">-</button>
							<script>
							$(".plus_${row.CART_IDX}").click(function(){
								var num = $(".numBox_${row.CART_IDX}").val();
								var plusNum = Number(num) + 1;
								
								if(plusNum >= 99) {
									$(".numBox_${row.CART_IDX}").val(num);
								} else {
									$(".numBox_${row.CART_IDX}").val(plusNum);          
								}
							});
	
							$(".minus_${row.CART_IDX}").click(function(){
								var num = $(".numBox_${row.CART_IDX}").val();
								var minusNum = Number(num) - 1;
	
								if(minusNum <= 0) {
									$(".numBox_${row.CART_IDX}").val(num);
								} else {
									$(".numBox_${row.CART_IDX}").val(minusNum);          
								}
							});
							</script>
						</p>
					
						<button type="button" class="btn btn-info" onclick="modifyCartStock(cartStock${status.index})">수량 변경</button>		
						
					

			
			
			</td>
			
            <td> <fmt:formatNumber pattern="###,###,###"
						value="${row.GOODS_PRICE * row.GOODS_AMOUNT }" />원 </td>
            
            <%-- <td class="dBasket">
            <a href='#this' id="dBasket" name="dBasket">삭제</a>
            <input type="hidden" id="CART_IDX" value="${row.CART_IDX }">
            </td> --%>
                     
         </tr>
         <c:set var="sum" value="${sum + (row.GOODS_PRICE * row.GOODS_AMOUNT)}" />
         <c:set var="sumAmount" value="${sumAmount + row.GOODS_AMOUNT}" />
         <c:set var="cart" value="${row.CART_IDX}" />
         </c:forEach>
         <c:choose>
         <c:when test="${sum < 50000 }">
         <c:set var="deli" value="${deli + 3000}" />
         </c:when>
         <c:when test="${sum > 50000 }">
         <c:set var="deli" value="${deli + 0}" />
         </c:when>
         </c:choose>
         </c:when>
         <c:otherwise>
					<tr>
						<td colspan="4" align="center">조회된 결과가 없습니다.</td>
					</tr>
				</c:otherwise>
         </c:choose>
      </tbody>
      
      
    
   </table>
<div class="delBtn" align="right" width="100%">
   <button type="button" id="clearBasket" name="clearBasket" class="btn btn-info">장바구니 비우기</button> 
   
   <button type="button" id="selectDelete_btn" class="btn btn-info">선택 삭제</button> 
</div>
  
  
<div class="orderState">
<table class="table table-hover">

	<tr>
	<td>주문할 상품 수 : ${sumAmount }  </td>
	<td>&nbsp;</td>
	<td> 배송비 : <fmt:formatNumber pattern="###,###,###"
						value="${deli}" /> 원 </td>
	<td>&nbsp;</td>					
	<td>  합계 : <fmt:formatNumber pattern="###,###,###"
						value="${sum}" /> 원 </td>
	</tr>
</table>
  
</div>

<div class="orderOpne" align="center" width="100%">

  	<button type="button" id="orderOpne_bnt" class="btn btn-info" style="width:30%; height:50px">주문 정보 입력</button>
  	<script>
	 $("#orderOpne_bnt").click(function(){
	  $(".orderInfo").slideDown();
	  $("#orderOpne_bnt").slideUp();
	 });      
	</script>
	
</div><br/>
 
  <input type="hidden" name="totalPrice" value="${sum }" />
  <input type="hidden" name="sumAmount" value="${sumAmount}" />
  <input type="hidden" name="member_id" value="${session_MEMBER_ID}" />
  <input type="hidden" name="CART_IDX" value="${cart}" />
  <input type="hidden" name="RANDOM" value="<%=random %>" />
  
<div class="orderInfo" align="left" width="100%" style="display:none;">   
  <div class="inputArea" align="center">
   <label for="">신규배송지로 배송</label>
   <input type="radio" name="orderRadio" id="orderRadio" onclick="order()"/>
  </div>
 
  <div class="inputArea" align="center">
   <label for="" style="margin-right:10px; font-size:15px">수령인</label>
   <input type="text" name="orderName" id="orderName" class="orderText" value="${map.MEMBER_NAME }" 
   style="text-align:center; width:80%; height:30px; letter-spacing: 5px; font-size:15px;"/>
  </div>
  
  <div class="inputArea" align="center">
   <label for="orderPhon" style="margin-right:10px; font-size:15px">수령인 연락처</label>
   <input type="text" name="orderPhone" id="orderPhone" class="orderText" value="${map.MEMBER_PHONE }"
    style="margin-left:10px; text-align:center; width:80%; height:30px; letter-spacing: 5px; font-size:15px"/>
  </div>
  
  <div class="inputArea" align="center">
   <label for="userZip" style="margin-right:10px; font-size:15px">우편번호</label>
   <input type="text" name="orderZip" id="orderZip" class="orderText" value="${map.MEMBER_ZIPCODE }"
    style="text-align:center; width:80%; height:30px; letter-spacing: 5px; font-size:15px"/>
   <input type="button" class='btn btn-info' onclick="sample6_execDaumPostcode()" value="우편번호 찾기" 
    style="margin-left:10px; margin-bottom:5px; margin-top:3px; text-align:center; width:15%; height:25px; letter-spacing: 5px; font-size:10px "/>
  </div>
  
  <div class="inputArea" align="center">
   <label for="userAddr1" style="margin-right:10px; font-size:15px">주소</label>
   <input type="text" name="orderAddress1" id="orderAddress1" class="orderText" value="${map.MEMBER_ADDRESS1 }"
    style="text-align:center; width:80%; height:30px; letter-spacing: 5px; font-size:15px"/>
  </div>
  
  <div class="inputArea" align="center">
   <label for="userAddr2" style="margin-right:10px; font-size:15px">상세주소</label>
   <input type="text" name="orderAddress2" id="orderAddress2" class="orderText" value="${map.MEMBER_ADDRESS2 }"
    style="text-align:center; width:80%; height:30px; letter-spacing: 5px; font-size:15px"/>
  </div>
  
  <div class="inputArea" align="center">
   <label for="userEmail" style="margin-right:10px; font-size:15px">이메일</label>
   <input type="text" name="orderEmail" id="orderEmail" class="orderText" value="${map.MEMBER_EMAIL }"
    style="text-align:center; width:80%; height:30px; letter-spacing: 5px; font-size:15px"/>
  </div>
  
  
  <div class="inputArea" style="margin-top:10px;" align="center">
	  <button type="button" id="order_btn" class="btn btn-info" style="margin-right:10px; width:100px;">주문</button>
   <button type="button" id="cancel_btn" class="btn btn-info" style="width:100px;">취소</button> 
   
	  <script>
		$("#cancel_btn").click(function(){
		 $(".orderInfo").slideUp();
		 $("#orderOpne_bnt").slideDown();
		});
		     
	</script>
  </div>

  
  
  
</div>

<script>
	function modifyCartStock(cartStock){
		var CART_IDX = cartStock.value;
		var CART_AMOUNT = $(".numBox_"+CART_IDX).val();

		alert("수량을 변경 하시겠습니까?");
		var comSubmit = new ComSubmit();

		comSubmit.addParam("CART_IDX", CART_IDX);
		comSubmit.addParam("GOODS_AMOUNT", CART_AMOUNT);
		comSubmit.setUrl("<c:url value='/myPage/basketModify.do' />");
		comSubmit.submit();
		}
</script>

<script>
 $("#selectDelete_btn").click(function(){
  var confirm_val = confirm("정말 삭제하시겠습니까?");
  
  if(confirm_val) {
   var checkArr = new Array();
   
   $("input[class='chBox']:checked").each(function(){
    checkArr.push($(this).attr("data-cartNum"));
   });
   alert(checkArr);
   $.ajax({
    url : "/first/myPage/basketDelete.do",
    type : "post",
    data : { chbox : checkArr },
    success : function(result){
        if(result == 1){
     location.href = "/first/myPage/basketList.do";
        }else{
            alert("삭제 실패");
     }
    }
   });
  } 
 });
 
 function order() {
	  $(".orderText").val('');
	}

</script>


</form>
</div>
   <%@ include file="/WEB-INF/include/include-body.jspf" %>
   <script type="text/javascript">
   $(document).ready(function(){
	   $(".chBox").prop("checked", true);
       $("#order_btn").on("click", function(){ 
       
       var checkArr = new Array();
       //checked 되어있는 row에 data-cartNum 속성 값을 가져와 Array에 넣어준다. 
       $("input[class='chBox']:checked").each(function () {
           checkArr.push($(this).attr("data-cartNum"));
       });

       //input hidden으로 되어있는 id가 chk에 배열을 넣어준다.
       //넣어주면 chk[]이름으로 controller에 넘어가 method에서 @RequestParam으로 받기만 해주면 된다.
       //Param으로는 안된다.

       $("#chk").val(checkArr); //

       if (confirm("주문완료 하시겠습니까?")) {
           alert("주문 감사합니다.");
           fn_addOrderList();
       }

   	  }); 

       $("#clearBasket").on("click", function(e){ 
           e.preventDefault();
           fn_clearBasket();
        });



      $("a[name='goodsDetail']").on("click", function(e){ //상품상세보기
			e.preventDefault();
			fn_openGoodsDetail($(this));
		});
		

       $("#allCheck").click(function(){
          var chk = $("#allCheck").prop("checked");
          if(chk) {
           $(".chBox").prop("checked", true);
          } else {
           $(".chBox").prop("checked", false);
          }
         });

       $(".chBox").click(function(){
    	   $("#allCheck").prop("checked", false);
    	  });

      
   });

   

   function fn_clearBasket(){
      var comSubmit = new ComSubmit();
      comSubmit.setUrl("<c:url value='/myPage/basketClear.do' />");
      comSubmit.submit();
   }


   function fn_openGoodsDetail(obj){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/main/goodsDetail.do' />");
		comSubmit.addParam("GOODS_IDX", obj.parent().find("#GOODS_IDX").val());
		comSubmit.submit();
	}

	function fn_addOrderList(){
		var comSubmit = new ComSubmit("basketList");
		comSubmit.setUrl("<c:url value='/shop/addCartOrderList.do' />");
		comSubmit.submit();
	
	}



   </script>
   <script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("orderAddress2").value = extraAddr;
                
                } else {
                    document.getElementById("orderAddress2").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('orderZip').value = data.zonecode;
                document.getElementById("orderAddress1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("orderAddress2").focus();
            }
        }).open();
    }
</script>
   
</body>
</html>