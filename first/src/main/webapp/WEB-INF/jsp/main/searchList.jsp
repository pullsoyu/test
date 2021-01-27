<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>

<body>
<div class="container">
	<h2>포토겔러리</h2>
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

</div>
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
		$(document).ready(function(){
			
			fn_selectSearchList(1);

			$("a[name='GOODS_IDX']").on("click", function(e){ //상세보기
				e.preventDefault();
				fn_goodsDetail($(this));
			});
			
		});


	

		
		function fn_goodsDetail(obj){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/main/goodsDetail.do' />");
			comSubmit.addParam("GOODS_IDX", obj.parent().find("#GOODS_IDX").val());
			comSubmit.submit();
		}


		function fn_goodsLike(obj){

			var comAjax = new ComAjax(); 
			comAjax.setUrl("<c:url value='/shop/addLike2.do' />");
			comAjax.setCallback("fn_selectSearchList");
			comAjax.addParam("MEMBER_ID", "${session_MEMBER_ID}");
			comAjax.addParam("GOODS_IDX", obj.parent().find("#GOODS_IDX").val());

			comAjax.ajax();
			

			
		}

		
		function fn_selectSearchList(pageNo){
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/main/selectSearchList.do' />");
			comAjax.setCallback("fn_selectSearchListCallback");
			comAjax.addParam("PAGE_INDEX",pageNo);
			comAjax.addParam("PAGE_ROW", 15);
			comAjax.addParam("SEARCHKEYWORD", "${map.SEARCHKEYWORD}");
			comAjax.addParam("selectSearch", '${map.selectSearch}');
			
			comAjax.ajax();
		}
		
		function fn_selectSearchListCallback(data){
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
					eventName : "fn_selectSearchList"
				};
				gfn_renderPaging(params);
				
				var str = "";
				$.each(data.list, function(key, value){
					str += 

						
						
						"<div class='col-lg-4 col-md-6 mb-4'>" +
						"<div class='card h-100'>" +
							"<a href='#this' name='GOODS_SUMIMG'>" +
							"<img  src='/first/resources/CKimg/" + value.GOODS_SUMIMG + "' height='200' width='338' alt='' />" +
							"</a> <input type='hidden' id='GOODS_IDX' value='" + value.GOODS_IDX + "'>" +
							"<div class='card-body'>" +
								"<h4 class='card-title'>" +
									"<td class='GOODS_NAME'><a href='#this' name='GOODS_SUMIMG'>" + value.GOODS_NAME + "</a>" +
									"<input type='hidden' id='GOODS_IDX' value='" + value.GOODS_IDX + "'></td>" +
								"</h4>" +
								"<p class='card-text'>" + value.GOODS_COMPANY + "</p>" +
								"<h5 align='center' style='color:red;'>" + value.GOODS_PRICE +"원"+ "</h5>" +
								
								"<td>" + 
									"<a href='#this' name='GOODSLIKE'>"+ "찜하기" +"</a>" +
									"<input type='hidden' id='GOODS_IDX' name='GOODS_IDX' value=" + value.GOODS_IDX + ">" +
								"<td>" + 
							"</div>"+
						"</div>"+
					"</div>";
			




						
				});
				body.append(str);
				
				$("a[name='GOODS_SUMIMG']").on("click", function(e){ //제목 
					e.preventDefault();
					fn_goodsDetail($(this));
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