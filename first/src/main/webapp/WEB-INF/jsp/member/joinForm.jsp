<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<%@ include file="/WEB-INF/include/include-header.jspf" %>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>



<script >

	$(function(){
		$("#joinForm").submit(function(){
			if($("#member_password").val() !== $("#member_password2").val()){
				alert("비밀번호가 다릅니다.");
				$("#member_password").val("").focus();
				$("#member_password2").val("");
				return false;
			}else if ($("#member_password").val().length < 8) {
				alert("비밀번호는 8자 이상으로 설정해야 합니다.");
				$("#member_password").val("").focus();
				return false;
			}else if($.trim($("#member_password").val()) !== $("#member_password").val() || $.trim($("#member_email").val()) !== $("#member_email").val() || $.trim($("#member_id").val()) !== $("#member_id").val()){
				alert("공백은 입력이 불가능합니다.");
				return false;
			}
		})
		
		
		
		$("#member_id").keyup(function() {
			$.ajax({
				url : "./check_id.do",
				type : "POST",
				data : {
					id : $("#member_id").val()
				},
				success : function(result) {
					if (result == 1) {
						$("#id_check").html("중복된 아이디가 있습니다.");
						$("#joinBtn").attr("disabled", "disabled");
					} else {
						$("#id_check").html("가능");
						$("#joinBtn").removeAttr("disabled");
					}
				},
			})
		});


		$("#member_password").keyup(function(){
			if($("#member_password").val() != $("#member_password2").val()){
				$("#passwordCheckMessage").html("비밀번호가 서로 일치하지 않습니다");
				$("#joinBtn").attr("disabled", "disabled");
			}
			else{
				$("#passwordCheckMessage").html("비밀번호가 일치");
				$("#joinBtn").removeAttr("disabled");
			}
		})
		
		$("#member_password2").keyup(function(){
			if($("#member_password").val() != $("#member_password2").val()){
				$("#passwordCheckMessage").html("비밀번호가 서로 일치하지 않습니다");
				$("#joinBtn").attr("disabled", "disabled");
			}
			else{
				$("#passwordCheckMessage").html("비밀번호가 일치");
				$("#joinBtn").removeAttr("disabled");
			}
		})
		
		
		$("#member_email").keyup(function(){
			$.ajax({
				url : "./check_email.do",
				type : "POST",
				data : {
					email : $("#member_email").val()
				},
				success : function(result) {
					if (result == 1) {
						$("#email_check").html("중복된 이메일이 있습니다.");
					} else {
						$("#email_check").html("");
					}
				},
			})
		});
	})
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


<title>회원가입 폼</title>
</head>
<body>
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large w3-margin-top">
				<h3>Member Join Form</h3>
			</div>
			<div>
				<form id="joinForm" action="/first/member/join.do">
					<p>
						<label>ID</label> 
						<input class="w3-input" type="text" id="member_id" name="member_id" required placeholder="만드실 아이디 입력."> 
						<span id="id_check" class="w3-text-red"></span>
					</p>
					<p>
						<label>Password</label> 
						<input class="w3-input" id="member_password" name="member_password" onkeyup="passwordCheckFunction();" type="password" required placeholder="비밀번호 입력">
						<span style="color:red;" id="passwordCheckMessage"></span>
					
					</p>
					<p>
						<label>Confirm</label> 
						<input class="w3-input" id="member_password2" name="member_password2" onkeyup="passwordCheckFunction();" type="password" required placeholder="비밀번호 확인">
					</p>
					<p>
						<label>Name</label> 
						<input class="w3-input" type="text" id="member_name" name="member_name" required placeholder="이름을 입력해 주세요."> 
					</p>
					<p>
						<label>Phone</label> 
						<input class="w3-input" type="text" id="member_phone" name="member_phone" required placeholder="연락처 입력해 주세요."> 
					</p>
					<p>
						<label>Zipcode</label> 
						<input type="button" onclick="sample6_execDaumPostcode()" class="btn btn-dark" value="우편번호 찾기">
						<input class="w3-input" type="text" id="member_zipcode" name="member_zipcode" required placeholder="우편번호 입력해 주세요."> 
					
					</p>
					<p>
						<label>Address1</label> 
						<input class="w3-input" type="text" id="member_address1" name="member_address1" required placeholder="상세주소 입력해 주세요."> 
						
					</p>
					<p>
						<label>Address2</label> 
						<input class="w3-input" type="text" id="member_address2" name="member_address2" required placeholder="상세주소 입력해 주세요."> 
						
					</p>
					
					<p>
						<label>Email</label>
						<input type="text" id="member_email" name="member_email" class="w3-input" required placeholder="이메일 인증 후 로그인이 가능합니다.">
						<span id="email_check" class="w3-text-red"></span>
					</p>
					
					
					<p class="w3-center">
						<button type="submit" id="joinBtn" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">Join</button>
						<button type="button" onclick="history.go(-1);" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">Cancel</button>
					</p>
				</form>
			</div>
		</div>
	</div>
</body>
</html>