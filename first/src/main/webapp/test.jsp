<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȭ�鱸��</title>
<script>
function checkIt(){
	if(!info.name.value){
		alert("�̸��� �Է��ϼ���");
		return false;
		}
}
</script>
</head>
<body>
	<form name="info" onsubmit="return checkIt()">
	<fieldset>
	<legend>��ǰ�� ����</legend>
	<ol type="1">
	<li>
	��ǰ�ڸ�:<input type="text" name="name" placeholder="name"><br>
	</li>
	<li>
	email:<input type="email" placeholder="answs@naver.com"><br>
	</li>
	<li>
	Ȩ������:<input type="url" placeholder="http://"><br>
	</li>
	</ol>
	</fieldset>
	
	<fieldset>
	<legend>��ǰ ����</legend>
	<ol type="1">
	<li>
	��ǰ��:<input type="text"><br>
	</li>
	<li>
	��ǰ����:<input type="number" min="10" max="100" step="10" placeholder="�ּ�10�̻�"><br>
	</li>
	<li>
	��ǰ���:<input type="range" min="0" max="10" step="2"><br>
	</li>
	<li>
	��Ÿ����:<textarea>��Ÿ���� �Է�</textarea>
	</li>
	</ol>
	</fieldset>
	<input type="submit" value="send message">
	</form>
</body>
</html>