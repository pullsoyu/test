<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
long random = System.currentTimeMillis();
%>	
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


	<script> 
		function REVIEWLIST(){
	
		var GOODS_IDX = ${map.GOODS_IDX};
		$.getJSON("<c:url value='/shop/goodsReviewList.do?n=${map.GOODS_IDX}' />", function(data){
			var str = "";

			$(data.list).each(function(){
			console.log(data);
			var REVIEW_DATE = new Date(this.REVIEW_DATE);
			REVIEW_DATE = REVIEW_DATE.toLocaleDateString("ko-US")

			str += "<li>"
				+ "<div class='userInfo'>"
				+ "<span class='userName bg-white'>" + "[" + this.MEMBER_ID + "]님 " + "</span>"
				+ "<span class='date bg-white'>" + REVIEW_DATE + "</span>"
				
				+ "<span class='score bg-success'>" + " [" + this.REVIEW_SCORE +"]점" + "</span>"
				+ "</div>"
				+ "<div class='replyContent bg-white'>" + this.REVIEW_CONTENT + "</div>"

				+ "<div class='replyFooter'>"
				+ "<button type='button' id='modify_modal' class='modify btn btn-warning btn-sm' data-REVIEW_IDX='" + this.REVIEW_IDX + "'>수정</button>"
				+ "<button type='button' id='delete' class='delete btn btn-danger btn-sm' data-REVIEW_IDX='" + this.REVIEW_IDX + "'>삭제</button>"
				+ "</div><br/>"

				+ "</li>";
			});

			$("section.reviewList ol").html(str);
		});
		}
	</script>
	
<!-- 모달박스 리뷰수정용 -->	
<style>
 div.replyModal { position:relative; z-index:1; display:none; }
 div.modalBackground { position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0, 0, 0, 0.8); z-index:-1; }
 div.modalContent { position:fixed; top:20%; left:calc(50% - 250px); width:500px; height:250px; padding:20px 10px; background:#fff; border:2px solid #666; }
 div.modalContent textarea { font-size:16px; font-family:'맑은 고딕', verdana; padding:10px; width:470px; height:160px; }
 div.modalContent button { font-size:20px; padding:5px 10px; margin:10px 0; background:#fff; border:1px solid #ccc; }
 div.modalContent button.modal_cancel { margin-left:20px; }
 div.form-control { position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0, 0, 0, 0.8); z-index:-1; }	
.wrapper{
margin-left:200px;margin-top:100px;}
</style>

</head>
<body>
<div class="wrapper">
	<caption>상품 상세보기</caption>
	
	<div style="float: left;">
		<img src="/first/resources/CKimg/${map.GOODS_SUMIMG }"  width="300" class="img-responsive img-rounded"  />
	</div>
	
	<div>
		<p class="cartStock ">
			<span>구입 수량</span>
			<button type="button" class="plus btn btn-info">+</button>
			<input type="number" id="GOODS_AMOUNT" class="numBox" min="1" max="100" value="1"
				readonly="readonly" />
			<button type="button" class="minus btn btn-info">-</button>

		</p>
		<div>
			<p class="addToLike ">
				<button id="addLike" class="btn btn-info" type="button">좋아요</button>
			</p>
			<p class="addToCart ">
				<button id="addCart" class="btn btn-info" type="button">카트에 담기</button>
			</p>
			<p class="addOrderList ">
				<button id="addOrderList" class="btn btn-info" type="button">바로구매</button>
			</p>
			
			
		</div>
	</div>
	
	<table class="table table-striped table-bordered table-hover float:right">
		<colgroup>
			<col width="8%" />
			<col width="20%" />
			<col width="7%" />
			<col width="20%" />
		</colgroup>



		<tbody>
			<tr>
				<th scope="row">상품코드</th>
				<td>${map.GOODS_IDX }</td>
				<th scope="row">분류</th>
				<td>${map.GOODS_KIND }</td>

			</tr>
			<tr>
				<th scope="row">상품명</th>
				<td>${map.GOODS_NAME }</td>
				<th scope="row">가격</th>
				<td><fmt:formatNumber pattern="###,###,###"
						value="${map.GOODS_PRICE }" /> 원</td>

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
			
			
		</tbody>
	</table>
		<input type="hidden" value="<%=random%>">
		<input type="hidden" value="${GOODS_PRICE }">
	

	<div id="reply">

		<c:if test="${session_MEMBER_ID == null }">
			<p>
				소감을 남기시려면 <a href="${pageContext.request.contextPath}/member/loginForm.do">로그인</a>해주세요
			</p>
		</c:if>

		<c:if test="${session_MEMBER_ID != null}">

			<form role="form" method="post" id="reviewForm" name="reviewForm"
				autocomplete="off">
				<div class="input_area input-group col-sm-8">

					<input type="hidden" name="MEMBER_IDX" value="${session_MEMBER_INFO.MEMBER_IDX}"> 
					<input type="hidden" name="GOODS_IDX" value="${map.GOODS_IDX}"> 
					<input type="text" class="form-control" name="REVIEW_TITLE" id="REVIEW_TITLE" placeholder="리뷰제목."> 
					<input type="number" class="form-control" max="10" min="1"
						name="REVIEW_SCORE" placeholder="리뷰점수." id="REVIEW_SCORE">
						
					
				</div>
				<div class="input_area input-group col-sm-8">
					<textarea name="REVIEW_CONTENT" cols="30" rows="5" class="form-control" id="REVIEW_CONTENT"
						placeholder="리뷰내용."></textarea>
				</div>

				<a href="#this" class="btn btn-primary" id="reviewWrite">소감 남기기</a>
				<a href="#this" class="btn btn-danger" id="goodslist">상품목록으로</a>
				
			</form>

		</c:if>

	<section id="reviewList" class="reviewList">
		<ol>
		
			<!-- 아이작스 상품평으로 변환하기위해 기본기능 주석
			<c:forEach items="${reviewList}" var="reviewList">
			<li>
			<div>
			<span>${reviewList.MEMBER_ID}</span>
			<span>${reviewList.REVIEW_TITLE}</span>
			<span>${reviewList.REVIEW_SCORE}점</span>
			<span><fmt:formatDate value="${reviewList.REVIEW_DATE}" pattern="yyyy-MM-dd" /></span>
			</div>
			<div class="replyContent">${reviewList.REVIEW_CONTENT}</div>
			</li>
			</c:forEach>
			-->
			
		</ol>
		
		<script>
			REVIEWLIST();
		</script>
		
	</section>

	</div>


	
	<img src="/first/resources/CKimg/${map.GOODS_CONTENT }" width="80%" />

</div>
	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	
	<script type="text/javascript">


	$(document).on("click", ".modal_modify_btn", function(){
	//$(".modal_modify_btn").click(function(){

		alert('@@수정버튼테스트, 리뷰IDX확인 : ' + $(this).attr("data-REVIEW_IDX"));
		
			var comSubmit = new ComSubmit();
			var REVIEW_IDX = $(this).attr("data-REVIEW_IDX");
			var REVIEW_CONTENT = $(".modal_REVIEW_CONTENT").val();
			
			comSubmit.addParam("REVIEW_IDX", REVIEW_IDX);
			comSubmit.addParam("MEMBER_IDX", "${session_MEMBER_INFO.MEMBER_IDX}");
			comSubmit.addParam("REVIEW_CONTENT", REVIEW_CONTENT);
			comSubmit.addParam("GOODS_IDX", "${map.GOODS_IDX}");
			comSubmit.setUrl("<c:url value='/shop/goodsReviewModify.do' />");
			comSubmit.submit();


			/*
			var data = {
		     REVIEW_IDX : $(this).attr("data-REVIEW_IDX"),
		     REVIEW_CONTENT : $(".modal_REVIEW_CONTENT").val()
		    };  // ReplyVO 형태로 데이터 생성
		  
		  $.ajax({
		   url : "/shop/view/modifyReply",
		   type : "post",
		   data : data,
		   success : function(result){
		    
		    if(result == 1) {
		     replyList();
		     $(".replyModal").fadeOut(200);
		    } else {
		     alert("작성자 본인만 할 수 있습니다.");       
		    }
		   },
		   error : function(){
		    alert("로그인하셔야합니다.")
		   }
		  });
		  */
		 
	});
	
	$(document).on("click", ".modify", function(){
		 //$(".replyModal").attr("style", "display:block;");
		 $(".replyModal").fadeIn(200);
		 $(".input-group").fadeOut(200);
		 
		 var REVIEW_IDX = $(this).attr("data-REVIEW_IDX");
		 var REVIEW_CONTENT = $(this).parent().parent().children(".replyContent").text();
		 
		 $(".modal_REVIEW_CONTENT").val(REVIEW_CONTENT);
		 $(".modal_modify_btn").attr("data-REVIEW_IDX", REVIEW_IDX);
		 
		});

	$(document).on("click", "#delete", function(e){
		e.preventDefault();
		fn_reviewDelete($(this).attr("data-REVIEW_IDX"));
		});

	

	
	$(document).ready(function(){
		

		$("#goodslist").on("click", function(e){ //관리자모드로가기 버튼
			e.preventDefault();
			fn_goodslist();
		});

		$("#reviewWrite").on("click", function(e){ //상품평댓글
			e.preventDefault();
			fn_reviewWrite();
		});
		
		
		$("#addLike").on("click", function(e){ //상품평댓글
			e.preventDefault();
			fn_addLike();
		});

		$("#addCart").on("click", function(e){ //상품평댓글
			e.preventDefault();
			fn_addCart();
		});
		

		$("#addOrderList").on("click", function(e){ //상품평댓글
			e.preventDefault();
			fn_addOrderList();
		});

		
		
	});

	

	
	function fn_addOrderList(){
		var comSubmit = new ComSubmit();
		var GOODS_AMOUNT = $(".numBox").val();
		alert('상품을'+ GOODS_AMOUNT + '개 주문했습니다');
		alert('멤버IDX:' + ${session_MEMBER_INFO.MEMBER_IDX});
		comSubmit.addParam("MEMBER_IDX", "${session_MEMBER_INFO.MEMBER_IDX}");
		comSubmit.addParam("GOODS_IDX", "${map.GOODS_IDX}");
		comSubmit.addParam("GOODS_AMOUNT", GOODS_AMOUNT);
		comSubmit.addParam("RANDOM", <%=random%>);
		comSubmit.addParam("GOODS_PRICE", "${map.GOODS_PRICE}");
		comSubmit.setUrl("<c:url value='/shop/addOrderList.do' />");
		comSubmit.submit();
	}
	
	function fn_addLike(){
		var comSubmit = new ComSubmit();
		alert('좋아요테스트'+${map.GOODS_IDX});
		comSubmit.addParam("MEMBER_ID", "${session_MEMBER_INFO.MEMBER_ID}");
		comSubmit.addParam("GOODS_IDX", "${map.GOODS_IDX}");
		comSubmit.setUrl("<c:url value='/shop/addLike.do' />");
		comSubmit.submit();
	}

	function fn_addCart(){
		var comSubmit = new ComSubmit();
		var GOODS_AMOUNT = $(".numBox").val();
		alert('장바구니에 상품을'+ GOODS_AMOUNT + '개 담았습니다');
		
		comSubmit.addParam("MEMBER_ID", "${session_MEMBER_INFO.MEMBER_ID}");
		comSubmit.addParam("GOODS_IDX", "${map.GOODS_IDX}");
		comSubmit.addParam("GOODS_AMOUNT", GOODS_AMOUNT);
		
		comSubmit.setUrl("<c:url value='/shop/addCart.do' />");
		comSubmit.submit();
	}


	function fn_reviewDelete(REVIEW_IDX){
		var comSubmit = new ComSubmit();
		
		comSubmit.addParam("REVIEW_IDX", REVIEW_IDX);
		comSubmit.addParam("MEMBER_IDX", "${session_MEMBER_INFO.MEMBER_IDX}");
		comSubmit.addParam("GOODS_IDX", "${map.GOODS_IDX}");
		comSubmit.setUrl("<c:url value='/shop/goodsReviewDelete.do' />");
		comSubmit.submit();
	}

	/*
	$(document).on("click", ".delete", function(){
		  
		var data = {REVIEW_IDX : $(this).attr("data-REVIEW_IDX")};

		$.ajax({
			url : "/shop/goodsReviewDelete.do",
			type : "post",
			data : data,
			success : function(){
			REVIEWLIST();
			}
		});
		
	});
	*/
	function fn_goodslist(){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/main/openBoardList.do' />");
		comSubmit.submit();
	}

	function fn_reviewWrite(){
		var comSubmit = new ComSubmit("reviewForm");
		comSubmit.setUrl("<c:url value='/shop/reviewWrite.do' />");
		comSubmit.submit();
	}

/*
	function fn_reviewWrite(){
		var comAjax = new comAjax("reviewForm");
		comAjax.setUrl("<c:url value='/shop/reviewWrite.do' />");

		comAjax.setCallback("REVIEWLIST");
		comAjax.ajax();
	}
*/

	$(".plus").click(function(){
		var num = $(".numBox").val();
		var plusNum = Number(num) + 1;

		if(plusNum >= ${map.GOODS_COUNT }) {
			$(".numBox").val(num);
		} else {
			$(".numBox").val(plusNum);          
		}
	});

	$(".minus").click(function(){
		var num = $(".numBox").val();
		var minusNum = Number(num) - 1;

		if(minusNum <= 0) {
			$(".numBox").val(num);
		} else {
			$(".numBox").val(minusNum);          
		}
	});
	</script>

<div class="replyModal">
	<div class="modalContent">
		<div>
			<textarea class="modal_REVIEW_CONTENT" name="modal_REVIEW_CONTENT"></textarea>
		</div>
		<div>
			<button type="button" class="modal_modify_btn">수정</button>
			<button type="button" class="modal_cancel">취소</button>
		</div>
	</div>
	<div class="modalBackground"></div>
</div>

<script>
$(".modal_cancel").click(function(){
 //$(".replyModal").attr("style", "display:none;");
	 $(".replyModal").fadeOut(200);
	 $(".input-group").fadeIn(200);
});
</script>

</body>
</html>

