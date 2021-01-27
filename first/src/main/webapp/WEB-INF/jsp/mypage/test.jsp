<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8" /> 
<html>
<head>
	<title>kubg Admin</title>
	
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


	
<style>
	body { font-family:'맑은 고딕', verdana; padding:0; margin:0; }
	ul { padding:0; margin:0; list-style:none;  }
 
	div#root { width:90%; margin:0 auto; }
	
	header#header { font-size:60px; padding:20px 0; }
	header#header h1 a { color:#000; font-weight:bold; }
	
	nav#nav { padding:10px; text-align:right; }
	nav#nav ul li { display:inline-block; margin-left:10px; }
 
 		section#container { padding:20px 0; border-top:2px solid #eee; border-bottom:2px solid #eee; }
	section#container::after { content:""; display:block; clear:both; }
	aside { float:left; width:200px; }
	div#container_box { float:right; width:calc(100% - 200px - 20px); }
	
	aside ul li { text-align:center; margin-bottom:10px; }
	aside ul li a { display:block; width:100%; padding:10px 0;}
	aside ul li a:hover { background:#eee; }
	
	footer#footer { background:#f9f9f9; padding:20px; }
	footer#footer ul li { display:inline-block; margin-right:10px; } 
</style>


<style>
.inputArea { margin:10px 0; }
select { width:100px; }
label { display:inline-block; width:70px; padding:5px; }
label[for='gdsDes'] { display:block; }
input { width:150px; }
textarea#gdsDes { width:400px; height:180px; }

.select_img img { margin:20px 0; }

</style>

</head>
<body onload="fn_sum()">
<div id="root">
	<header id="header">
		<div id="header_box">
		
		</div>
	</header>

	<nav id="nav">
		<div id="nav_box">
			
		</div>
	</nav>
	
<section id="content">
<ul>
 <li>
  <div class="allCheck">
   <input type="checkbox" name="allCheck" id="allCheck" /><label for="allCheck">모두 선택</label> 
  </div>
  
  <script>
$("#allCheck").click(function(){
 var chk = $("#allCheck").prop("checked");
 if(chk) {
  $(".chBox").prop("checked", true);
 } else {
  $(".chBox").prop("checked", false);
 }
});
</script>
  
  <div class="delBtn">
   <button type="button" class="selectDelete_btn">선택 삭제</button> 
  </div>
  
  <script>
 $(".selectDelete_btn").click(function(){
  var confirm_val = confirm("정말 삭제하시겠습니까?");
  
  if(confirm_val) {
   var checkArr = new Array();
   
   $("input[class='chBox']:checked").each(function(){
    checkArr.push($(this).attr("data-cartNum"));
   });
    
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
</script>
  
 </li>
  <c:forEach items="${list}" var="cartList">
  <c:set var="sum" value="0"/>
  <li>
  <div class="checkBox">
   <input type="checkbox" name="chBox" class="chBox" data-cartNum="${cartList.CART_IDX}" />
  </div>
  
  <script>
 $(".chBox").click(function(){
  $("#allCheck").prop("checked", false);
 });
</script>
  
   <div class="thumb">
    <img src="${cartList.GOODS_SUMIMG}" />
   </div>
   <div class="gdsInfo">
    <p>
     <span>상품명</span>${cartList.GOODS_NAME}<br />
     <span>개당 가격</span><fmt:formatNumber pattern="###,###,###" value="${cartList.GOODS_PRICE}" /> 원<br />
     


    <p class="cartStock">
			<button type="button" class="plus_${cartList.CART_IDX}">+</button>
			<input type="number" id="GOODS_AMOUNT" class="numBox_${cartList.CART_IDX}" min="1" max="100" value="1" readonly="readonly" />
			<button type="button" class="minus_${cartList.CART_IDX}">-</button>
			금액 : <input type="number" class="sum_${cartList.CART_IDX}" value="${cartList.GOODS_PRICE }" size="11" readonly>원
			<div class="modify">
    
		
<script>
 $(".plus_${cartList.CART_IDX}").click(function(){
	var num = $(".numBox_${cartList.CART_IDX}").val();
	var plusNum = Number(num) + 1;

	if(plusNum == null) {
		$(".numBox_${cartList.CART_IDX}").val(num);
	} else {
		$(".numBox_${cartList.CART_IDX}").val(plusNum);         
	}

	var snum = ${cartList.GOODS_PRICE}
	var snum2 = $(".sum_${cartList.CART_IDX}").val();
	var samount = $(".numBox_${cartList.CART_IDX}").val();
	var splusNum = Number(snum2) + Number(snum);

	if(splusNum == null) {
		$(".sum_${cartList.CART_IDX}").val(snum2);
	} else {
		$(".sum_${cartList.CART_IDX}").val(splusNum); 
		           
	}
});

$(".minus_${cartList.CART_IDX}").click(function(){
	var num = $(".numBox_${cartList.CART_IDX}").val();
	var minusNum = Number(num) - 1;

	if(minusNum <= 0) {
		$(".numBox_${cartList.CART_IDX}").val(num);
	} else {
		$(".numBox_${cartList.CART_IDX}").val(minusNum);     
		       
	}

	var snum = ${cartList.GOODS_PRICE}
	var snum2 = $(".sum_${cartList.CART_IDX}").val();
	var samount = $(".numBox_${cartList.CART_IDX}").val();
	var sminusNum = Number(snum2) - Number(snum);

	if(sminusNum <= 0) {
		alert("0개는 주문할 수 없습니다");
	} else {
		$(".sum_${cartList.CART_IDX}").val(sminusNum);   
		      
	}
});




</script>
	</p>	
    </p>
    
    <div class="delete">
     <button type="button" class="delete_${cartList.CART_IDX}_btn" data-cartNum="${cartList.CART_IDX }" >삭제</button>
     <script>
 $(".delete_${cartList.CART_IDX}_btn").click(function(){
  var confirm_val = confirm("정말 삭제하시겠습니까?");
  
  if(confirm_val) {
   var checkArr = new Array();
   
   checkArr.push($(this).attr("data-cartNum"));
    
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
</script>
    </div>
    
    
   </div>   
  </li>
  
  <c:set var="sum" value="" />
  </c:forEach>
  
  
 </ul>
 
 <p class="p"></p>


 
 <div class="orderOpne">
  <button type="button" class="orderOpne_bnt">주문 정보 입력</button>
 </div>
</div>

</section>

	<footer id="footer">
		<div id="footer_box">
			
		</div>		
	</footer>

</div>
<!-- <script>
  function fn_sum(){
	var temp = '0';
	
	var sum = $(".sum_${cartList.CART_IDX}").val();
	var str = "총 합계 :";
	/* p.empty(); */
	
	alert(sum);
	}
</script> -->


</body>

</html>