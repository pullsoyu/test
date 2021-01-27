<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>first</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>

<body>
<div class="container">
	<h2 align="center">과일</h2>
	<div>
	<div class="GOODS_COUNT_DESC" ><a href="#this" name="GOODS_COUNT_DESC">인기상품순</a>
	<input type="hidden" id="IDX" value="${row.GOODS_IDX }">
	
	<a href="#this" name="GOODS_PRICE_ASC">낮은가격순</a>
	<input type="hidden" id="IDX" value="${row.GOODS_IDX }">
	
	<a href="#this" name="GOODS_PRICE_DESC">높은가격순</a>
	<input type="hidden" id="IDX" value="${row.GOODS_IDX }">
	
	
	<a href="#this" name="GOODS_REVIEW_DESC">후기많은순</a>
	<input type="hidden" id="IDX" value="${row.GOODS_IDX }">
	
	<a href="#this" name="GOODS_IDX_DESC">최근등록순</a>
	<input type="hidden" id="IDX" value="${row.GOODS_IDX }"></div>
	</div>
	

	<table class="board_list">
		<colgroup>
			<col width="10%"/>
			<col width="*"/>
			<col width="15%"/>
			<col width="20%"/>
		</colgroup>
		
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
			
			$("a[name='GOODS_NAME']").on("click", function(e){ //상품상세보기
				e.preventDefault();
				fn_openGoodsDetail($(this));
			});

			$("a[name='GOODS_SUMIMG']").on("click", function(e){ //상품상세보기
				e.preventDefault();
				fn_openGoodsDetail($(this));
			});

			$("a[name='GOODS_COUNT_DESC']").on("click", function(e){ //상품상세보기(과일)
				e.preventDefault();
				fn_openGoodsKind1($(this));
			});

			$("a[name='GOODS_PRICE_ASC']").on("click", function(e){ //상품낮은가격순
				e.preventDefault();
				fn_openGoodsKind1PA($(this));
			});

			$("a[name='GOODS_PRICE_DESC']").on("click", function(e){ //상품높은가격순
				e.preventDefault();
				fn_openGoodsKind1PD($(this));
			});

			$("a[name='GOODS_REVIEW_DESC']").on("click", function(e){ //후기많은순
				e.preventDefault();
				fn_openGoodsKind1RD($(this));
			});
			$("a[name='GOODS_IDX_DESC']").on("click", function(e){ //최근등록순
				e.preventDefault();
				fn_openGoodsKind1ID($(this));
			});

			$("a[name='GOODSLIKE']").on("click", function(e){ //제목 
				e.preventDefault();
				fn_goodsLike($(this));
			});

		});
		
		function fn_openGoodsDetail(obj){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/main/goodsDetail.do' />");
			comSubmit.addParam("GOODS_IDX", obj.parent().find("#IDX").val());
			comSubmit.submit();
		}

		function fn_openGoodsKind1(obj){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/main/fruitList.do' />");
			comSubmit.addParam("GOODS_IDX", obj.parent().find("#IDX").val());
			comSubmit.submit();
		}

		function fn_openGoodsKind1PA(obj){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/goods/fruitListPA.do' />");
			comSubmit.addParam("GOODS_IDX", obj.parent().find("#IDX").val());
			comSubmit.submit();
		}

		function fn_openGoodsKind1PD(obj){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/goods/fruitListPD.do' />");
			comSubmit.addParam("GOODS_IDX", obj.parent().find("#IDX").val());
			comSubmit.submit();
		}

		function fn_openGoodsKind1RD(obj){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/goods/fruitListRD.do' />");
			comSubmit.addParam("GOODS_IDX", obj.parent().find("#IDX").val());
			comSubmit.submit();
		}

		function fn_openGoodsKind1ID(obj){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/goods/fruitListID.do' />");
			comSubmit.addParam("GOODS_IDX", obj.parent().find("#IDX").val());
			comSubmit.submit();
		}

		function fn_goodsLike(obj){

			var comAjax = new ComAjax(); 
			comAjax.setUrl("<c:url value='/shop/addLike2.do' />");
			comAjax.setCallback("fn_selectSearchList");
			comAjax.addParam("MEMBER_ID", "${session_MEMBER_ID}");
			comAjax.addParam("GOODS_IDX", obj.parent().find("#IDX").val());

			comAjax.ajax();
		}

		function fn_selectBoardList(pageNo){
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/goods/selectFruitListPA.do' />");
			comAjax.setCallback("fn_selectBoardListCallback");
			comAjax.addParam("PAGE_INDEX",pageNo);
			comAjax.addParam("PAGE_ROW", 15);
			comAjax.ajax();
		}

		function fn_selectBoardListCallback(data){
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
					eventName : "fn_selectBoardList"
				};
				gfn_renderPaging(params);
				
				var str = "";
				$.each(data.list, function(key, value){
					str += 

						"<div class='col-lg-4 col-md-6 mb-4'>" +
						"<div class='card h-100'>" +
							"<a href='#this' name='GOODS_SUMIMG'>" +
							"<img  src='/first/resources/CKimg/" + value.GOODS_SUMIMG + "' height='200' width='338' alt='' />" +
							"</a> <input type='hidden' id='IDX' value='" + value.GOODS_IDX + "'>" +
							"<div class='card-body'>" +
								"<h4 class='card-title'>" +
									"<td class='GOODS_NAME'><a href='#this' name='GOODS_SUMIMG'>" + value.GOODS_NAME + "</a>" +
									"<input type='hidden' id='IDX' value='" + value.GOODS_IDX + "'></td>" +
								"</h4>" +
								"<p class='card-text'>" + value.GOODS_COMPANY + "</p>" +
								"<h5 align='center' style='color:red;'>" + value.GOODS_PRICE +"원"+ "</h5>" +
								
								"<td>" + 
									"<a href='#this' name='GOODSLIKE'>"+ "찜하기" +"</a>" +
									"<input type='hidden' id='IDX' name='GOODS_IDX' value=" + value.GOODS_IDX + ">" +
								"<td>" + 
							"</div>"+
						"</div>"+

						"</div>";
					




					
				});
				body.append(str);

				$("a[name='GOODS_SUMIMG']").on("click", function(e){ //제목 
					e.preventDefault();
					fn_openGoodsDetail($(this));
				});

				$("a[name='GOODSLIKE']").on("click", function(e){ //제목 
					e.preventDefault();
					fn_goodsLike($(this));
				});
			}
		}

		
	</script>
		
	
</body>
</html>