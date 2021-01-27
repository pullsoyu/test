<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<div id="con_lf" class="container">

	<form id="mem" name="mem" enctype="multipart/form-data">
		<table class="table table-hover">
			<colgroup>
				<col width="15%"/>
				<col width="35%"/>
				<col width="15%"/>
				<col width="35%"/>
			</colgroup>
			<h2 class="pg_tit">
				<span>회원 정보 수정</span>
			</h2>
			<tbody>
				<tr>
					<th scope="row">아이디</th>
					<td>${map.MEMBER_ID }</td>
					<th scope="row">이름</th>
					<td>
						${map.MEMBER_NAME }
					</td>
					
				</tr>
				<tr>
					<th scope="row">비밀번호</th>
					<td>
						<input type="password" id="member_password" class="wdp_90" name="member_password" value="${map.MEMBER_PASSWORD }" />
					</td>
					<th scope="row">연락처</th>
					<td>
						<input type="text" id="member_phone" name="member_phone" class="wdp_90" value="${map.MEMBER_PHONE }"/>
					</td>
				</tr>
				
				<tr>
					
					
					<th scope="row">이메일</th>
					<td>
						<input type="text" id="member_email" name="member_email" class="wdp_90" value="${map.MEMBER_EMAIL }"/>
					</td>
					<th scope="row">등록일</th>
					<td colspan="3">${map.MEMBER_REGISTDATE }</td>
				</tr>
			
				<tr>
					<th scope="row">주소</th>
					<td>
						<input type="text" id="member_address1" name="member_address1" class="wdp_90" value="${map.MEMBER_ADDRESS1 }"/><br>
						<input type="text" id="member_address2" name="member_address2" class="wdp_90" value="${map.MEMBER_ADDRESS2 }"/>
					</td>
					<th scope="row">우편번호</th>
					<td>
					
					<input type="text" id="member_zipcode" name="member_zipcode" class="wdp_90" value="${map.MEMBER_ZIPCODE }" required placeholder="우편번호 입력해 주세요."> 
					<input type="button" class='btn btn-info' onclick="sample6_execDaumPostcode()" value="우편번호 찾기">	
					</td>
				</tr>
				
				
				
			</tbody>
		</table>
	
	
	<a href="#this" class="btn btn-info" id="modify">저장하기</a>
	<a href="#this"class="btn btn-info" id="admin">취소하기</a>
	</form>
	</div>
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#admin").on("click", function(e){ //관리자모드로가기 버튼
				e.preventDefault();
				fn_gotoAccount();
			});
			
			$("#modify").on("click", function(e){
				e.preventDefault();
				if ($("#member_password").val().length < 8) {
					alert("비밀번호는 8자 이상으로 설정해야 합니다.");
					$("#member_password").val("").focus();
					return false;
				}else if($.trim($("#member_password").val()) == "null" || $.trim($("#member_email").val()) != $("#member_email").val()){
					alert("공백은 입력이 불가능합니다.");
					return false;
					}else{fn_modifyMember();}
				
			
				
			});
		});
			
		
		function fn_gotoAccount(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/myPage/myPageMain.do' />");
			comSubmit.submit();
		}
		
		function fn_modifyMember(){
			var id = "${map.MEMBER_ID}";
			var comSubmit = new ComSubmit("mem");
			comSubmit.setUrl("<c:url value='/myPage/accountModify.do' />");
			comSubmit.addParam("MEMBER_ID", id);
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
                    document.getElementById("member_address2").value = extraAddr;
                
                } else {
                    document.getElementById("member_address2").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('member_zipcode').value = data.zonecode;
                document.getElementById("member_address1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("member_address2").focus();
            }
        }).open();
    }
</script>
</body>
</html>



