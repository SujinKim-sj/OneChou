<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="" class="frm" method="post" id="frm" enctype="multipart/form-data">
		<input type="hidden" name="memberId" value="${member.id}">
		<fieldset>
			<legend>로스터리 이름</legend>
			<input type="text" class="roastery" name="name" id="name">
		</fieldset>
		<fieldset>
			<legend>주소</legend>
			<input type="text" class="roastery" name="address" id="address">
		</fieldset>
		<fieldset>
			<legend>설명</legend>
			<textarea rows="15" cols="80" name="info" class="roastery" id="info"></textarea>
		</fieldset>
		<button type="button" id="btn">회원가입</button>
		</form>
		
		<script type="text/javascript" src="../resources/js/roastery/add.js"></script>
</body>
</html>