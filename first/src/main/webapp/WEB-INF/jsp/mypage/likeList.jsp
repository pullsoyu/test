<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
<div id="con_lf" class="container">
<h2>찜한상품</h2><br>
<table class="table table-hover">
		<colgroup>
			<col width="10%"/>
			<col width="20%"/>
			<col width="40%"/>
			<col width="20%"/>
			<col width="10%"/>
		</colgroup>
		
		
		
		<thead>
		
		<c:choose>
			<c:when test="${fn:length(list) > 0}">			
			<c:forEach items="${list }" var="row" begin="0" end="0">
    	 		<p>총 <span style="color:red;">${row.COUNT }개</span>의 상품이 찜한 상품에 있습니다</p>
    		</c:forEach>
     		</c:when>
     	</c:choose>
			<tr>
				
				<th scope="col">
				   <div class="allCheck">
	               <input type="checkbox" name="allCheck" id="allCheck" /><label for="allCheck">선택</label>
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
	               </div>
	            </th>
				<th scope="col">이미지</th>	
				<th scope="col">상품정보</th>	
				<th scope="col">가격</th>		

			</tr>
		</thead>
			
		<tbody>
		<c:choose>
			<c:when test="${fn:length(list) > 0}">
			<c:forEach items="${list }" var="row">
	         <tr>
	            <th scope="row">
	            <input type="checkbox" class="chBox" id="chBox" name="chBox" data-likeNum="${row.LIKE_IDX }" value="${row.LIKE_IDX }"></th>
	            <td class="GOODS_SUMIMG">
				<a href="#this" id="goodsDetail" name="goodsDetail">
				<img src="/first/resources/CKimg/${row.GOODS_SUMIMG }" height="100" width="100"/></a>
				<input type="hidden" id="GOODS_IDX" value="${row.GOODS_IDX }">
				</td>     
	            <td> ${row.GOODS_NAME } </td>
	            <td> ${row.GOODS_PRICE} </td>
	            <td class='dLike'>
				<a href='#this' id='dLike' name='dLike'>삭제</a>
				<input type='hidden' id='LIKE_IDX' value="${row.LIKE_IDX } ">
				</td>
	
	            
	                     
	         </tr>
         </c:forEach>
         </c:when>
         </c:choose>
		</tbody>
	</table>
<div class="delBtn" align="right" width="100%">	
   <button type="button" id="clearLike" name="clearLike" class="btn btn-info" onclick="fn_clearLike()">찜한상품 비우기</button>
   <button type="button" id="addBasket_btn" class="btn btn-info">장바구니 추가하기</button> 
</div>


</div>	
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
<script type="text/javascript">
   $(document).ready(function(){  
	   var checkArr = new Array();
       //checked 되어있는 row에 data-cartNum 속성 값을 가져와 Array에 넣어준다. 
       $("input[class='chBox']:checked").each(function () {
           checkArr.push($(this).attr("data-likeNum"));
       });

       //input hidden으로 되어있는 id가 chk에 배열을 넣어준다.
       //넣어주면 chk[]이름으로 controller에 넘어가 method에서 @RequestParam으로 받기만 해주면 된다.
       //Param으로는 안된다.

       $("#chk").val(checkArr); //

      $("a[name='dLike']").on("click", function(e){ 
			e.preventDefault();
			fn_deleteLike($(this));
      	});	
    	
      $("a[name='goodsDetail']").on("click", function(e){ //상품상세보기
			e.preventDefault();
			fn_openGoodsDetail($(this));
		});

       $("#allCheck").click(function(){
          var chk = $("#allCheck").prop("checked");
          if(chk) {
           $(".chkBox").prop("checked", true);
          } else {
           $(".chkBox").prop("checked", false);
          }
         });

       $(".chBox").click(function(){
    	   $("#allCheck").prop("checked", false);
    	  });
      
   });

   $("#addBasket_btn").click(function(){
	   var confirm_val = confirm("장바구니에 추가하시겠습니까?");
	   
	   if(confirm_val) {
	    var checkArr = new Array();

	    $("input[class='chBox']:checked").each(function(){
	     checkArr.push($(this).attr("data-likeNum"));
	    });
	    
		if(checkArr != ""){	
	    $.ajax({
	     url : "/first/myPage/addBasket.do",
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
		}else{alert("추가할 상품을 선택하세요!");}
	   } 
	});

   function fn_deleteLike(obj){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/myPage/likeDelete.do' />");
		comSubmit.addParam("LIKE_IDX", obj.parent().find("#LIKE_IDX").val());
		comSubmit.submit();
	}
   
   function fn_clearLike(){
      var comSubmit = new ComSubmit();
      comSubmit.setUrl("<c:url value='/myPage/likeClear.do' />");
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