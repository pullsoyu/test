<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>화면구현</title>
<script>
function checkIt(){
	if(!info.name.value){
		alert("이름을 입력하세요");
		return false;
		}
}
</script>
</head>
<body>
	<form name="info" onsubmit="return checkIt()">
	<fieldset>
	<legend>납품자 정보</legend>
	<ol type="1">
	<li>
	납품자명:<input type="text" name="name" placeholder="name"><br>
	</li>
	<li>
	email:<input type="email" placeholder="answs@naver.com"><br>
	</li>
	<li>
	홈페이지:<input type="url" placeholder="http://"><br>
	</li>
	</ol>
	</fieldset>
	
	<fieldset>
	<legend>남품 정보</legend>
	<ol type="1">
	<li>
	상품명:<input type="text"><br>
	</li>
	<li>
	납품수량:<input type="number" min="10" max="100" step="10" placeholder="최소10이상"><br>
	</li>
	<li>
	남품등급:<input type="range" min="0" max="10" step="2"><br>
	</li>
	<li>
	기타사항:<textarea>기타사항 입력</textarea>
	</li>
	</ol>
	</fieldset>
	<input type="submit" value="send message">
	</form>
</body>
</html>