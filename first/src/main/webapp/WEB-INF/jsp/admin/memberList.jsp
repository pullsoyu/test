
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
<div class="container">
	<h2>회원 목록</h2>
	<table class="board_list table table-hover">
		<colgroup>
			<col width="10%"/>
			<col width="*"/>
			<col width="15%"/>
			<col width="20%"/>
		</colgroup>
		<thead>
			<tr>
				<th scope="col">회원번호</th>
				<th scope="col">아이디</th>
				<th scope="col">이름</th>
				<th scope="col">회원가입날짜</th>
				<th scope="col">탈퇴여부</th>
				
			</tr>
		</thead>
		<tbody>
		
			<!-- 
			<c:choose>
				<c:when test="${fn:length(memberlist) > 0}">
					<c:forEach items="${memberlist }" var="row">
						<tr>
							<td>${row.MEMBER_IDX}</td>
							<td class="MEMBER_ID">
								<a href="#this" name="MEMBER_ID">${row.MEMBER_ID }</a>
								<input type="hidden" id="IDX" value="${row.MEMBER_IDX }">
							</td>
							<td>${row.MEMBER_NAME }</td>
							<td>${row.MEMBER_REGISTDATE }</td>
							<td>${row.MEMBER_DELGB }</td>
							
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
		$(document).ready(function(){
			fn_selectMemberList(1);
			
			$("a[name='MEMBER_ID']").on("click", function(e){ //멤머상세보기
				e.preventDefault();
				fn_openMemberDetail($(this));
			});
		});

		
		
		function fn_openMemberDetail(obj){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/memberDetail.do' />");
			comSubmit.addParam("MEMBER_IDX", obj.parent().find("#IDX").val());
			comSubmit.submit();
		}

		function fn_selectMemberList(pageNo){
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/admin/selectMemberList.do' />");
			comAjax.setCallback("fn_selectMemberListCallback");
			comAjax.addParam("PAGE_INDEX",pageNo);
			comAjax.addParam("PAGE_ROW", 15);
			comAjax.ajax();
		}
		
		function fn_selectMemberListCallback(data){
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
					eventName : "fn_selectMemberList"
				};
				gfn_renderPaging(params);
				
				var str = "";
				$.each(data.list, function(key, value){
					str += "<tr>" + 
								"<td>" + value.MEMBER_IDX + "</td>" + 
								"<td class='title'>" +
									"<a href='#this' name='MEMBER_ID'>" + value.MEMBER_ID + "</a>" +
									"<input type='hidden' id='IDX' name='IDX' value=" + value.MEMBER_IDX + ">" + 
								"</td>" +
								"<td>" + value.MEMBER_NAME + "</td>" + 
								"<td>" + value.MEMBER_REGISTDATE + "</td>" + 
								"<td>" + value.MEMBER_DELGB + "</td>" + 
							"</tr>";
				});
				body.append(str);
				
				
				$("a[name='MEMBER_ID']").on("click", function(e){ //멤머상세보기
					e.preventDefault();
					fn_openMemberDetail($(this));
				});
				
			}
		}
		
	</script>
	</div>
</body>
</html>