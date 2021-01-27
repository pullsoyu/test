<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<meta charset="UTF-8">
<link href="<c:url value="/resources/css/mypage.css"/>" rel="stylesheet">

</head>
<!--  onload="begin()" cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center" -->
<body>
<div id="con_lf" class="container">
      <div class="card align-middle"style="margin-left:20%; margin-right:20%; height:400px; border-radius:20px; background-color:#fff; margin-top:50px;">
         <div>
            <div class="card-title" style="margin-top:30px;">
               <h2 class="card-title text-center" style="color:#113366;"></h2>
            </div>
            <div class="card-body">
               <input type="password" id="MEMBER_PASSWORD" name="MEMBER_PASSWORD" class="form-control" placeholder="Password">
            </div>
         
            <div class="card-body">
            	<input type="button" class="btn btn-lg btn-primary btn-block" value="확인" onclick="fn_pwCheck();" style="background-color:#26a69a;">
            	<input type="button" class="btn btn-lg btn-primary btn-block" value="취소" onclick="back();" style="background-color:#26a69a;">
				<span id="pwc"></span>
				<br>
            </div>
         </div>
      </div>
 </div>
</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript">


function fn_pwCheck(){ //pw check
    var MEMBER_PASSWORD = {MEMBER_PASSWORD : $('#MEMBER_PASSWORD').val()};
    $.ajax({
        url:"<c:url value='/myPage/pwCheck.do'/>",
        type:'get',
        data: MEMBER_PASSWORD,
        success:function(data){              
            if($.trim(data)=="1"){
            	document.location.href= "accountModifyForm.do";   
            }else{
               $('#pwc').html("비밀번호가 틀렸습니다.").css("color", "red");
            }
        },
        error:function(){
                alert("에러입니다");
        }
    });
};

function back(){
	history.go(-1);
}
</script>
</html>